from django.db import models

class Student(models.Model):
    id = models.BigIntegerField(primary_key=True, db_column='id')
    lastname = models.CharField(max_length=255)
    firstname = models.CharField(max_length=255)
    middlename = models.CharField(max_length=255)
    extname = models.CharField(max_length=10)
    mycourse = [
        ('BSIT', 'BSIT'),
        ('BSCS', 'BSCS'),
        ('BSES', 'BSES'),
        ('BSMB', 'BSMB'),
        ('BSMRB', 'BSMRB'),
    ]
    course = models.CharField(max_length=10, choices=mycourse)
    myyear = [
        ('First Year', 'First Year'),
        ('Second Year', 'Second Year'),
        ('Third Year', 'Third Year'),
        ('Fourth Year', 'Fourth Year'),
        ('Fifth Year', 'Fifth year'),
    ]
    year = models.CharField(max_length=15, choices=myyear)
    myblock = [
        ('Block 1', 'Block 1'),
        ('Block 2', 'Block 2'),
        ('Block 3', 'Block 3'),
        ('Block 4', 'Block 4'),
        ('Block 5', 'Block 5'),
    ]
    block = models.CharField(max_length=15, choices=myblock)

    class Meta:
        db_table = 'student'

    def __str__(self):
        return self.lastname + ' ' + self.firstname

class Event(models.Model): 
    event_id = models.AutoField(primary_key=True, db_column='event_id')
    event_name = models.CharField(max_length=255)
    mytype = [
        ('Whole Day', 'Whole Day'),
        ('Half Day', 'Half Day'),
    ]
    type = models.CharField(max_length=15, choices=mytype)
    mydaytype = [
            ('Morning', 'Morning'),
        ('Afternoon', 'Afternoon'),
    ]
    half_day_type = models.CharField(max_length=15, choices=mydaytype)
    eventdate = models.DateField()

    class Meta:
        db_table = 'events'

    def __str__(self):
        return self.event_name
   

class Notification(models.Model):
    idnotification = models.AutoField(primary_key=True, db_column='idnotification')
    notification = models.CharField(max_length=50)
    created_at = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'notification'

    def __str__(self):
        return self.notification
    
class Attendance(models.Model):
    attendanceid = models.AutoField(primary_key=True, db_column='attendanceid')
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE)
    eventid = models.ForeignKey(Event, on_delete=models.CASCADE)
    timein_am = models.DateField(blank=True, null=True)
    timeout_am = models.DateField(blank=True, null=True)
    timein_pm = models.DateField(blank=True, null=True)
    timeout_pm = models.DateField(blank=True, null=True)

    class Meta:
        db_table = 'myattendance'

    def __str__(self):
        return f"{self.student_id} - {self.eventid}"


class NotifStudents(models.Model):
    notifstudents_id = models.AutoField(primary_key=True, db_column='notifstudents_id')
    notif_id = models.ForeignKey(Notification, on_delete=models.CASCADE)
    students_id = models.ForeignKey(Student, on_delete=models.CASCADE)

    class Meta:
        db_table = 'notifstudents'

    def __str__(self):
        return f"{self.notif_id} - {self.students_id}"

class EventAttendance(models.Model):
    eventattendanceid = models.AutoField(primary_key=True, db_column='eventattendanceid')
    studentid = models.ForeignKey(Student, on_delete=models.CASCADE)
    eventid = models.ForeignKey(Event, on_delete=models.CASCADE)
    timein_no = models.IntegerField()
    timeout_no = models.IntegerField()
    event_total_timein = models.IntegerField()
    event_total_timeout= models.IntegerField()
    event_total_absents = models.IntegerField()

    class Meta:
        db_table = 'eventattendance'

    def __str__(self):
        return f"{self.studentid} - {self.eventid}"

     