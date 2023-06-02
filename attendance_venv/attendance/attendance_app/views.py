from django.shortcuts import render, redirect, get_object_or_404
import os
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.conf import settings
from .utils.qrcode_generator import generate_qrcode
from .models import Student, Event, Attendance, Notification, NotifStudents, EventAttendance
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView
from django.utils import timezone
from django.db.models import Q, F
from .models import Event
import math
from .forms import StudentForm, EditForm
from django.views import View
from django.db import connection
from django.core.paginator import Paginator
from django.db.models import Sum
from datetime import datetime
from pytz import timezone

def add_students(request):
    if request.method == 'POST':
        idnum = request.POST['idnum']
        lastname = request.POST['lastname']
        firstname = request.POST['firstname']
        middlename = request.POST['middlename']
        extname = request.POST['extname']
        course = request.POST['course']
        year = request.POST['year']
        block = request.POST['block']

        student_info = Student(
            id=idnum,
            lastname=lastname,
            firstname=firstname,
            middlename=middlename,
            extname=extname,
            course=course,
            year=year,
            block=block
        )
        student_info.save()

        # Generate QR code
        temp_dir = os.path.join(settings.BASE_DIR, 'QRCODES')
        file_path = os.path.join(temp_dir, f"{idnum}.png")
        generate_qrcode(idnum, file_path)

        return redirect('student_info')  # Replace 'student_info' with the appropriate URL name for the student info page

    return render(request, 'addstudent.html')

    
class StudentListView(ListView):
    model = Student
    template_name = 'student_info.html'
    context_object_name = 'students'
    paginate_by = 10


def add_event(request):
    if request.method == 'POST':
        name = request.POST.get('event_name')
        event_type = request.POST.get('type')
        date = request.POST.get('date')

        if event_type == 'Whole Day':
            event = Event(event_name=name, type=event_type, eventdate=date)
        else:
            type2 = request.POST.get('type2')
            event = Event(event_name=name, type=event_type, half_day_type=type2, eventdate=date)

        event.save()
        return redirect('events')  # Assuming you have a URL pattern named 'events'

    return render(request, 'addevent.html')

def event_list(request):
    result_per_page = 10
    search = request.GET.get('search', '')

    query = Event.objects.all()

    if search:
        query = query.filter(
            Q(event_name__contains=search) |
            Q(event_id__contains=search) |
            Q(type__contains=search) |
            Q(half_day_type__contains=search) |
            Q(eventdate__contains=search)
        )

    resultRows = query.count()
    number_of_page = math.ceil(resultRows / result_per_page)

    if 'page' not in request.GET:
        page = 1
    else:
        page = int(request.GET['page'])

    first_page_number = (page - 1) * result_per_page
    query = query.order_by('event_name')[first_page_number:first_page_number + result_per_page]

    records = query.values()

    return render(request, 'events.html', {
        'records': records,
        'number_of_page': number_of_page,
        'search': search,
        'current_page': page,
    })

#DELETE FUNCTIONS 
def delete_student(request, id):
    student = Student.objects.get(id=id)
    student.delete()
    return redirect('student_info')



def delete_event(request, id):
    event = Event.objects.get(event_id=id)
    event.delete()
    return redirect('events')

#UPDATE FUNCTION
class StudentUpdate(UpdateView):
    template_name = 'editstudent.html'
    form_class = StudentForm
    model = Student
    success_url = '/student_info'  # Replace with the desired success URL

    def get_object(self, queryset=None):
        id = self.kwargs.get('id')
        return get_object_or_404(Student, id=id)

    def form_valid(self, form):
        response = super().form_valid(form)

        return response

class EventUpdate(View):
    template_name = 'editevent.html'

    def get(self, request, event_id):
        event = get_object_or_404(Event, event_id=event_id)
        form = EditForm(instance=event)
        context = {'form': form, 'event': event}  # Pass the event object to the context
        return render(request, self.template_name, context)

    def post(self, request, event_id):
        event = get_object_or_404(Event, event_id=event_id)
        form = EditForm(request.POST, instance=event)
        if form.is_valid():
            form.save()
            return redirect('events')
        else:
            context = {'form': form, 'event': event} 
            return render(request, self.template_name, context)

# views.py
from django.db.models import Sum, F, IntegerField
from django.db.models.functions import Coalesce

def report(request):
    result_per_page = 10
    search = request.GET.get('search', '')

    query = EventAttendance.objects.annotate(
        student_id=F('studentid__id'),
        student_lastname=F('studentid__lastname'),
        student_firstname=F('studentid__firstname')
    ).values(
        'student_id',
        'student_lastname',
        'student_firstname'
    ).annotate(
        total_timein=Coalesce(Sum('event_total_timein'), 0, output_field=IntegerField()),
        total_timeout=Coalesce(Sum('event_total_timeout'), 0, output_field=IntegerField()),
        total_absents=Coalesce(Sum('event_total_absents'), 0, output_field=IntegerField())
    ).order_by('student_lastname')

    if search:
        query = query.filter(
            Q(student_lastname__icontains=search) |
            Q(student_firstname__icontains=search) |
            Q(student_id__icontains=search)
        )

    paginator = Paginator(query, result_per_page)
    page_number = request.GET.get('page', 1)
    page = paginator.get_page(page_number)

    context = {
        'records': page,
        'number_of_page': paginator.num_pages,
    }
    return render(request, 'report.html', context)


def time_in(request):
    if request.method == 'POST':
        idnum = request.POST.get('text')
        eventid = request.POST.get('event')
        if idnum and eventid:
            now = datetime.now(timezone('Asia/Manila')).strftime('%Y-%m-%d %H:%M:%S')
            is_morning = datetime.now(timezone('Asia/Manila')).hour < 12

            try:
                event = Event.objects.get(event_id=eventid)
                if is_morning and event.half_day_type != 'Afternoon':
                    attendance = Attendance.objects.filter(student_id=idnum, eventid=eventid, timein_am__isnull=False)
                    if attendance.exists():
                        return render(request, 'timein.html', {'error': 'An existing record with the same student ID and event ID already has a time-in entry.'})

                    attendance = Attendance.objects.update_or_create(student_id=idnum, eventid=eventid, defaults={'timein_am': now})
                    notification = Notification.objects.create(notification='Student ' + idnum + ' logged in this morning.', created_at=now)
                    notification_id = notification.pk

                    student_info = Student.objects.filter(id=idnum).values('year')
                    if student_info.exists():
                        year = student_info[0]['year']
                        student_info = Student.objects.filter(year=year, id=idnum).values('id')
                        if student_info.exists():
                            idstudent = student_info[0]['id']
                            notif_students = NotifStudents.objects.create(notif_id=notification_id, students_id=idstudent)
                            eventattendance = EventAttendance.objects.update_or_create(studentid=idnum, eventid=eventid, defaults={'timein_no': F('timein_no') + 1})

                            eventattendance = EventAttendance.objects.filter(studentid=idnum, eventid=eventid).values('timein_no', 'timeout_no')
                            if eventattendance.exists():
                                timein_no = eventattendance[0]['timein_no']
                                timeout_no = eventattendance[0]['timeout_no']
                                timein_no += 1
                                EventAttendance.objects.filter(studentid=idnum, eventid=eventid).update(timein_no=timein_no)

                                if event.type == 'Whole Day':
                                    EventAttendance.objects.filter(studentid=idnum, eventid=eventid).update(event_total_timein=F('event_total_timein') + 1, event_total_timeout=F('event_total_timeout') + 1)
                                elif event.type == 'Half Day':
                                    if event.half_day_type == 'Morning':
                                        EventAttendance.objects.filter(studentid=idnum, eventid=eventid).update(event_total_timein=F('event_total_timein') + 1)
                                    elif event.half_day_type == 'Afternoon':
                                        EventAttendance.objects.filter(studentid=idnum, eventid=eventid).update(event_total_timeout=F('event_total_timeout') + 1)

                            return render(request, 'timein.html', {'success': 'Time-in recorded successfully.'})
                        else:
                            return render(request, 'timein.html', {'error': 'Invalid student ID.'})
                    else:
                        return render(request, 'timein.html', {'error': 'Invalid student ID.'})
                else:
                    return render(request, 'timein.html', {'error': 'Cannot record time-in for the selected event.'})
            except Event.DoesNotExist:
                return render(request, 'timein.html', {'error': 'Invalid event ID.'})
        else:
            return render(request, 'timein.html', {'error': 'Please provide the student ID and event ID.'})
    else:
        events = Event.objects.all().values('event_id', 'event_name')
        return render(request, 'timein.html', {'events': events})


def get_events():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM events")
        events = Event.objects.all()
    return events


def save_timeout(request):
    events = get_events()

    if request.method == 'POST':
        idnum = request.POST.get('text')
        eventid = request.POST.get('event')
        current_datetime = datetime.now()
        is_morning = current_datetime.hour < 12


        return render(request, 'timeout.html', {'events': events})
        with connection.cursor() as cursor:
            cursor.execute("SELECT half_day_type FROM events WHERE event_id = %s", [eventid])
            result = cursor.fetchone()

            if result is None:
                return render(request, 'timeout.html', {'message': 'Event not found.'})

            half_day_type = result[0]

            if is_morning and half_day_type != 'Afternoon':
                cursor.execute("SELECT * FROM attendance WHERE student_id = %s AND eventid = %s AND timeout_am IS NOT NULL",
                               [idnum, eventid])

                if cursor.fetchone():
                    return render(request, 'timeout.html', {'message': 'An existing record with the same student ID and event ID already has a time-out entry.'})

                # Rest of your code for morning timeout handling

                # Return appropriate response for successful timeout
                return render(request, 'timeout.html', {'message': f'Successfully timed-out: {idnum}'})

            elif not is_morning and half_day_type != 'Morning':
                cursor.execute("SELECT * FROM attendance WHERE student_id = %s AND eventid = %s AND timeout_pm IS NOT NULL",
                               [idnum, eventid])

                if cursor.fetchone():
                    return render(request, 'timeout.html', {'message': 'An existing record with the same student ID and event ID already has.'})

                # Rest of your code for afternoon timeout handling

                # Return appropriate response for successful timeout
                return render(request, 'timeout.html', {'message': f'Successfully timed-out: {idnum}'})

        # Return appropriate response for non-POST request or other cases
        return render(request, 'timeout.html', {'message': 'Invalid time-out request.'})
    

    else:
        # Return appropriate response for non-POST request
        return render(request, 'timeout.html', {'message': 'Invalid request method.'})
    
