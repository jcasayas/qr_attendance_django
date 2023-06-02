from django.forms import ModelForm
from .models import Student, Event
from django import forms

class StudentForm(ModelForm):
    extname = forms.CharField(required=False)
    class Meta:
        model = Student
        fields = ("id", "lastname", "firstname", "middlename", "extname","course", "year", "block")

class EditForm(ModelForm):
    eventdate = forms.DateTimeField(widget=forms.DateTimeInput(attrs={'type': 'datetime-local'}))
    class Meta:
        model = Event
        fields = ("event_id", "event_name", "type", "half_day_type", "eventdate")