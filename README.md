# QR Attendance System

## Requirements
- Python
- Django
- Database (e.g., PostgreSQL, MySQL)
- Web Browser
- QR Code Library for Python (e.g., qrcode, PyQRCode)
- Pillow Library

## Setting up the Django Application 📂

1. Install Python on your machine.
2. Install Django using pip.
3. Create a new Django project using the following command:
   ```
   django-admin startproject qr_attendance
   ```
4. Navigate to the project directory:
   ```
   cd qr_attendance
   ```
5. Create a new Django app for the QR Attendance system:
   ```
   python manage.py startapp qr_attendance_app
   ```
6. Configure the database settings in the project's settings.py file.
7. Create necessary models and database tables for the QR Attendance system using Django's migrations:
   ```
   python manage.py makemigrations
   python manage.py migrate
   ```

## Clone the Repository 📂

1. Click the following link to access the repository on Github:

   [Repository Link](https://github.com/jcasayas/qr_attendance_django) 🌐

2. Clone the repository to your local machine:
   ```
   git clone https://github.com/jcasayas/qr_attendance_django
   ```

3. Open the project in your preferred code editor.

## How To Use
### **Access the Web Application:**
1. Open your web browser (e.g., Google Chrome, Mozilla Firefox).
2. Type in the URL or web address of the 'QR Attendance' web application: http://127.0.0.1:8000/

### **Navigate the Dashboard:**
- After logging in, you will be directed to the dashboard. This is the main page, here you will be able to see the attendance of each student for specific events.
- The dashboard also consists of a navigation bar wherein it can redirect you to the events, student list, and the overall student report.
- You are able to time-in and time-out by clicking their respective buttons which redirects them to the time-in/time-out page.
- You can also add a new student record here by clicking the 'Add Student' button.

*Events*
- In the events page, you will be able to see the events that are currently encoded into the system.
- You can also add new events, as well as edit or delete existing events.

*Student List*
- In the student list page, you will be able to see the student information of each student that is currently encoded into the system.
- You can also add new students, as well as edit or delete existing records of students.
- You are able to time-in and time-out by clicking their respective buttons which redirects them to the time-in/time-out page.

*Attendance Report:*
- To view overall attendance records or history, navigate to the 'Attendance Report'.

## Authors 👨‍💻👩‍💻

<img src="https://i.imgur.com/GSiZWPz.jpg" alt="Calma, Ingrid Justine" style="width:150px;height:200px;"> <br> Calma, Ingrid Justine<br>
<img src="https://i.imgur.com/VmjiQOC.jpg" alt="Casayas, Jiezca P." style="width:150px;height:200px;"> <br> Casayas, Jiezca P.<br>

Please note that the specific implementation may vary depending on the Django project structure and libraries used in your application. Make sure to follow the documentation or guidelines provided by Django and the libraries you are using.
