"""
URL configuration for attendance project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from attendance_app import views

urlpatterns = [
    path('admin/', admin.site.urls),

    path('student_info/', views.StudentListView.as_view(), name='student_info'),
    path('add-student/',views.add_students, name='add-student'),
    path('student_info/student_update/<str:id>/', views.StudentUpdate.as_view(), name='student_update'),
    path('students/delete_student/<int:id>/', views.delete_student, name='delete_student'),


    path('time_in/', views.time_in, name='time_in'),
    path('add_event/', views.add_event, name='add_event'),
    path('events/', views.event_list, name='events'),
    path('events/delete_event/<int:id>/', views.delete_event, name='delete_event'),
    path('events/event_update/<int:event_id>/', views.EventUpdate.as_view(), name='event_update'),
    path('report/', views.report, name='report'),

     path('save_timeout/', views.save_timeout, name='save_timeout'),


    
]
