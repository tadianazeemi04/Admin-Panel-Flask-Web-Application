# 🛠️ Admin Panel Flask Web Application – JobSight

A full-stack Flask web application for managing job listings with admin/user authentication, CSV uploads, analytics, and RESTful APIs.

---

## 🚀 Features

- 🔐 **User Authentication**
  - Register/Login with hashed passwords
  - Admin vs. Normal User Panel
- 🧑‍💼 **Admin Dashboard**
  - Add, update, delete, and archive jobs
  - Upload job listings via CSV
  - View basic job analytics
- 📊 **Analytics**
  - Total jobs, average salary, and unique companies
- 🔄 **Soft Delete**
  - Deleted jobs moved to a separate `deleted_jobs` table
- 🌐 **REST API**
  - `/api/jobs` – Get all job posts
  - `/api/analytics` – Get summary data
  - `/api/jobs/delete/<id>` – Delete job
  - `/api/jobs/update/<id>` – Update job
- 📁 **CSV Upload**
  - Bulk upload job data using pandas

---

## 📂 Project Structure

```bash
Admin-Panel-Flask-Web-Application/
│
├── templates/               # HTML templates (login, register, panels)
├── app.py                   # Main Flask app
├── jobsight.sql             # SQL schema (optional backup)
├── pyvenv.cfg               # Virtual environment config
├── Include/                 # Python headers (venv)
├── Lib/                     # Python libraries (venv)
└── Scripts/                 # venv scripts
```
##⚙️ Technologies Used
```bash
Python 3.x

Flask

Flask-MySQLdb

MySQL

Pandas

HTML + Bootstrap (in templates)

Werkzeug (for password hashing)
```
##🔧 Setup Instructions
1. Clone the Repository
```
git clone https://github.com/tadianazeemi04/Admin-Panel-Flask-Web-Application.git
cd Admin-Panel-Flask-Web-Application
```
2. Set up Virtual Environment (Optional but Recommended)
```
python -m venv venv
venv\Scripts\activate   # On Windows
```
3. Install Requirements
```
pip install flask flask-mysqldb pandas
```
4. Create MySQL Database
Create a MySQL database named jobsight.

Run the app once — it will auto-create the user_auth table and an admin user.
```
-- You can also run this manually if needed:
CREATE DATABASE jobsight;
```
##✅ Default Admin Credentials:
```
Username: admin

Password: admin123
```
##▶️ Running the App
```
python app.py
```
Then open your browser and go to:
http://127.0.0.1:5000

##📥 CSV Upload Format
Make sure your CSV has the following columns in order:
```
job_title, company_name, job_type, company_website, social_media_link, 
skills_required, education_required, job_posting_link, min_salary, max_salary
```
##📜 License
This project is open-source and available under the MIT License.

##👨‍💻 Author
Tadian Ahmad Azeemi

