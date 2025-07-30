from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from flask_mysqldb import MySQL
from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash
import MySQLdb.cursors
import pandas as pd
import os

app = Flask(__name__)
app.secret_key = 'your-very-secret-key-123'

# MySQL Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'jobsight'
mysql = MySQL(app)

# Database initialization (run once)
def init_db():
    with app.app_context():
        cur = mysql.connection.cursor()
        cur.execute("""
        CREATE TABLE IF NOT EXISTS user_auth (
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(50) UNIQUE NOT NULL,
            full_name VARCHAR(255) NOT NULL,
            email VARCHAR(100) UNIQUE NOT NULL,
            password VARCHAR(255) NOT NULL,
            is_admin BOOLEAN DEFAULT FALSE
        )
        """)
        mysql.connection.commit()
        cur.close()

# Create admin user if not exists
def create_admin():
    with app.app_context():
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user_auth WHERE username = 'admin'")
        admin = cur.fetchone()
        if not admin:
            hashed_pw = generate_password_hash('admin123')
            cur.execute(
                "INSERT INTO user_auth (username, full_name, email, password, is_admin) VALUES (%s, %s, %s, %s, %s)",
                ('admin', 'Administrator','admin@example.com', hashed_pw, True)
            )
            mysql.connection.commit()
        cur.close()

# Initialize database and create admin
init_db()
create_admin()

@app.route('/')
def home():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():

    # Check if user is already logged in

    if 'loggedin' in session:
        if session.get('is_admin', False):
            return redirect(url_for('admin_panel'))
        else:
            return redirect(url_for('user_panel'))
        
    # Handle login form submission

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        if not username or not password:
            flash('Please fill all fields', 'danger')
            return redirect(url_for('login'))
        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user_auth WHERE username = %s', (username,))
        user = cursor.fetchone()
        cursor.close()

        if user and check_password_hash(user['password'], password):
            session['loggedin'] = True
            session['user_id'] = user['id']
            session['username'] = user['username']
            session['is_admin'] = user.get('is_admin', False)
            
            if session['is_admin']:
                return redirect(url_for('admin_panel'))
            else:
                return redirect(url_for('user_panel'))
        else:
            flash('Invalid credentials', 'danger')
    
    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():

    if request.method == 'POST':
        username = request.form.get('username')
        full_name = request.form.get('full_name')
        email = request.form.get('email')
        password = request.form.get('password')
        confirm_password = request.form.get('confirm_password')
        
        # Validation
        if not all([username, full_name, email, password, confirm_password]):
            flash('Please fill all fields', 'danger')
            return redirect(url_for('register'))
            
        if password != confirm_password:
            flash('Passwords do not match!', 'danger')
            return redirect(url_for('register'))
            
        if len(password) < 8:
            flash('Password must be at least 8 characters', 'danger')
            return redirect(url_for('register'))

        hashed_password = generate_password_hash(password)
        
        try:
            cursor = mysql.connection.cursor()
            cursor.execute(
                'INSERT INTO user_auth (username, full_name, email, password) VALUES (%s, %s, %s, %s)',
                (username, full_name, email, hashed_password)
            )
            mysql.connection.commit()
            cursor.close()
            flash('Registration successful! Please login.', 'success')
            return redirect(url_for('login'))
        except Exception as e:
            flash('Username or email already exists', 'danger')
            return redirect(url_for('register'))
    
    return render_template('register.html')

@app.route('/user_panel')
def user_panel():
    if 'loggedin' in session and not session.get('is_admin', False):
        return render_template('user_panel.html', username=session['username'])
    flash('Access denied', 'danger')
    return redirect(url_for('login'))

@app.route('/admin_panel')
def admin_panel():
    if 'loggedin' in session and session.get('is_admin', False):
        
        return render_template('admin_panel.html', username=session['username'])
    flash('Admin access required', 'danger')
    return redirect(url_for('login'))

@app.route('/logout')
def logout():
    session.clear()
    flash('You have been logged out.', 'info')
    return redirect(url_for('login'))

@app.route('/add', methods=['POST'])
def add_jobs():
    try:
        # Get form data
        job_title = request.form.get('job_title')
        company_name = request.form.get('company_name')
        job_type = request.form.get('job_type')
        company_website = request.form.get('company_website')
        social_media_link = request.form.get('social_media_link')
        skills_required = request.form.get('skills_required')
        education_required = request.form.get('education_required')
        job_posting_link = request.form.get('job_posting_link')
        min_salary = request.form.get('min_salary')
        max_salary = request.form.get('max_salary')

        # Validate required fields
        if not all([job_title, company_name, skills_required, job_posting_link, min_salary]):
            flash('Please fill all required fields', 'error')
            return redirect(url_for('admin_panel'))

        # Insert into database
        cur = mysql.connection.cursor()
        query = """
        INSERT INTO job_data_update 
        (job_title, company_name, job_type, company_website, social_media_link, 
         skills_required, education_required, job_posting_link, min_salary, max_salary)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cur.execute(query, (
            job_title, company_name, job_type, 
            f"https://{company_website}" if company_website and not company_website.startswith(('http://', 'https://')) else company_website,
            f"https://linkedin.com/{social_media_link}" if social_media_link and not social_media_link.startswith(('http://', 'https://')) else social_media_link,
            skills_required, education_required, job_posting_link, min_salary, max_salary
        ))
        mysql.connection.commit()
        cur.close()

        flash('Job added successfully!', 'success')
        return redirect(url_for('admin_panel'))

    except Exception as e:
        mysql.connection.rollback()
        flash(f'An error occurred: {str(e)}', 'error')
        return redirect(url_for('admin_panel'))


# API: Get all jobs
@app.route('/api/jobs')
def get_jobs():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM job_data_update ORDER BY timestamp DESC")
    rows = cur.fetchall()
    column_names = [desc[0] for desc in cur.description]
    cur.close()
    jobs = [dict(zip(column_names, row)) for row in rows]
    return jsonify(jobs)

# API: Analytics
@app.route('/api/analytics')
def get_analytics():
    cur = mysql.connection.cursor()
    cur.execute("SELECT COUNT(*) FROM job_data_update")
    total_jobs = cur.fetchone()[0]

    cur.execute("SELECT AVG((min_salary + max_salary) / 2) FROM job_data_update")
    avg_salary = cur.fetchone()[0]

    cur.execute("SELECT COUNT(DISTINCT company_name) FROM job_data_update")
    companies = cur.fetchone()[0]

    cur.close()
    return jsonify({
        "total_jobs": total_jobs,
        "avg_salary": round(avg_salary, 2) if avg_salary else 0,
        "companies": companies
    })

# Upload route
@app.route('/upload', methods=['POST'])
def upload_csv():
    if 'file' not in request.files:
        return "No file part", 400
    file = request.files['file']
    if file.filename == '':
        return "No selected file", 400
    if file and file.filename.endswith('.csv'):
        df = pd.read_csv(file)
        df.columns = [
            'job_title',
            'company_name',
            'job_type',
            'company_website',
            'social_media_link',
            'skills_required',
            'education_required',
            'job_posting_link',
            'min_salary',
            'max_salary'
        ]
        df.replace('', None, inplace=True)
        df = df.where(pd.notna(df), None)

        cur = mysql.connection.cursor()
        for _, row in df.iterrows():
            cur.execute("""
                INSERT INTO job_data_update (
                    job_title, company_name, job_type, company_website,
                    social_media_link, skills_required, education_required,
                    job_posting_link, min_salary, max_salary
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, tuple(row))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('admin_panel'))
    return "Invalid file format", 400

# ---------------------------------------------------------------------------------------------------------

@app.route('/search', methods=['GET'])
def search_jobs():
    job_title = request.args.get('job_title', '')
    job_type = request.args.get('job_type', '')
    skills_required = request.args.get('skills_required', '')
    education_required = request.args.get('education_required', '')
    min_salary = request.args.get('min_salary')
    max_salary = request.args.get('max_salary')

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    query = """
        SELECT * FROM job_data_update
        WHERE LOWER(job_title) LIKE LOWER(%s)
        AND LOWER(job_type) LIKE LOWER(%s)
        AND LOWER(skills_required) LIKE LOWER(%s)
        AND LOWER(education_required) LIKE LOWER(%s)
    """
    values = [f"%{job_title}%", f"%{job_type}%", f"%{skills_required}%", f"%{education_required}%"]

    if min_salary:
        query += " AND max_salary >= %s"
        values.append(min_salary)
    if max_salary:
        query += " AND min_salary <= %s"
        values.append(max_salary)

    cursor.execute(query, values)
    jobs = cursor.fetchall()
    return render_template('search.html', jobs=jobs)


# Endpoint for suggestions (autocomplete)
@app.route('/autocomplete/<column>')
def autocomplete(column):
    allowed = ['job_title', 'skills_required', 'education_required']
    if column not in allowed:
        return jsonify([])

    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT DISTINCT {column} FROM job_data_update WHERE {column} IS NOT NULL")
    results = cursor.fetchall()
    suggestions = [r[0] for r in results if r[0]]
    return jsonify(suggestions)


@app.route('/update_job', methods=['POST'])
def update_job():
    data = request.get_json()
    job_id = data['id']
    fields = data['data']

    try:
        cursor = mysql.connection.cursor()
        query = """
            UPDATE job_data_update 
            SET 
                job_title = %s,
                job_type = %s,
                skills_required = %s,
                education_required = %s,
                company_name = %s,
                min_salary = %s,
                max_salary = %s,
                job_posting_link = %s,
                timestamp = %s
            WHERE id = %s
        """
        values = (
            fields['job_title'],
            fields['job_type'],
            fields['skills_required'],
            fields['education_required'],
            fields['company_name'],
            fields['min_salary'],
            fields['max_salary'],
            fields['job_posting_link'],
            datetime.now(),
            job_id
        )
        cursor.execute(query, values)
        mysql.connection.commit()
        cursor.close()
        return jsonify(success=True)
    except Exception as e:
        print(f"[ERROR] Job update failed: {e}")
        return jsonify(success=False)

@app.route('/delete_all', methods=['POST'])
def delete_all_jobs():
    try:
        cursor = mysql.connection.cursor()

        # Copy to deleted_jobs
        cursor.execute("INSERT INTO deleted_jobs SELECT * FROM job_data_update")

        # Delete from job_data_update
        cursor.execute("DELETE FROM job_data_update")
        mysql.connection.commit()
        cursor.close()
        flash('All jobs deleted and moved to Trash.', 'success')
    except Exception as e:
        print("[ERROR]", e)
        flash('Failed to delete all jobs.', 'danger')

    return redirect(url_for('search_jobs'))

@app.route('/delete_job', methods=['POST'])
def delete_job():
    data = request.get_json()
    job_id = data['id']

    try:
        cursor = mysql.connection.cursor()

        # Copy row to deleted_jobs
        cursor.execute("INSERT INTO deleted_jobs SELECT * FROM job_data_update WHERE id = %s", (job_id,))

        # Delete from original table
        cursor.execute("DELETE FROM job_data_update WHERE id = %s", (job_id,))
        mysql.connection.commit()
        cursor.close()
        return jsonify(success=True)
    except Exception as e:
        print("[ERROR] Row delete failed:", e)
        return jsonify(success=False)

# ---------------------------------------------------------------------------------------------------------

@app.route('/trash')
def view_trash():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM deleted_jobs ORDER BY timestamp DESC")
    trashed_jobs = cursor.fetchall()
    return render_template('trash.html', trashed_jobs=trashed_jobs)

@app.route('/recover_job/<int:job_id>', methods=['POST'])
def recover_job(job_id):
    cursor = mysql.connection.cursor()
    cursor.execute("""
        INSERT INTO job_data_update (
            job_title, company_name, job_type, company_website, social_media_link,
            skills_required, education_required, job_posting_link, min_salary, max_salary, timestamp
        )
        SELECT job_title, company_name, job_type, company_website, social_media_link,
               skills_required, education_required, job_posting_link, min_salary, max_salary, NOW()
        FROM deleted_jobs WHERE id = %s
    """, (job_id,))
    cursor.execute("DELETE FROM deleted_jobs WHERE id = %s", (job_id,))
    mysql.connection.commit()
    flash("Job recovered successfully!", "success")
    return redirect(url_for('view_trash'))

@app.route('/delete_forever/<int:job_id>', methods=['POST'])
def delete_forever(job_id):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM deleted_jobs WHERE id = %s", (job_id,))
    mysql.connection.commit()
    flash("Job permanently deleted!", "danger")
    return redirect(url_for('view_trash'))

@app.route('/admin/trash/recover_all', methods=['POST'])
def recover_all_jobs():
    cursor = mysql.connection.cursor()

    # Fetch all deleted jobs
    cursor.execute("SELECT * FROM deleted_jobs")
    deleted_jobs = cursor.fetchall()

    if deleted_jobs:
        for job in deleted_jobs:
            cursor.execute("""
                INSERT INTO job_data_update (
                    id, job_title, company_name, job_type, company_website,
                    social_media_link, skills_required, education_required,
                    job_posting_link, min_salary, max_salary, timestamp
                )
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, job)

        # Delete all from deleted_jobs after moving
        cursor.execute("DELETE FROM deleted_jobs")
        mysql.connection.commit()
        flash("All jobs recovered successfully.", "success")
    else:
        flash("No deleted jobs to recover.", "info")

    return redirect(url_for('view_trash'))


@app.route('/admin/trash/delete_all', methods=['POST'])
def delete_all_forever():
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM deleted_jobs")
    mysql.connection.commit()
    flash("All deleted jobs permanently removed.", "danger")
    return redirect(url_for('view_trash')) 

# ---------------------------------------------------------------------------------------------------------

@app.route('/admin/analytics')
def admin_analytics():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    # Job Type Distribution
    cursor.execute("SELECT job_type, COUNT(*) AS count FROM job_data_update GROUP BY job_type")
    job_type_data = cursor.fetchall()

    # Skill-Based Analysis
    cursor.execute("SELECT skills_required FROM job_data_update")
    skills_raw = cursor.fetchall()
    skill_counts = {}
    for row in skills_raw:
        skills = row['skills_required'].split(',')
        for skill in skills:
            cleaned_skill = skill.strip().lower()
            if cleaned_skill:
                skill_counts[cleaned_skill] = skill_counts.get(cleaned_skill, 0) + 1

    # Education Analysis
    cursor.execute("SELECT education_required, COUNT(*) AS count FROM job_data_update GROUP BY education_required")
    education_data = cursor.fetchall()

    # Salary Analysis (bucketed)
    cursor.execute("SELECT min_salary, max_salary FROM job_data_update")
    salaries = cursor.fetchall()
    salary_buckets = {
        '0-25K': 0,
        '25K-50K': 0,
        '50K-75K': 0,
        '75K-100K': 0,
        '100K+': 0
    }
    for row in salaries:
        try:
            min_salary = int(row['min_salary'] or 0)
            max_salary = int(row['max_salary'] or 0)
            avg_salary = (min_salary + max_salary) // 2
        except:
            continue

        if avg_salary < 25000:
            salary_buckets['0-25K'] += 1
        elif avg_salary < 50000:
            salary_buckets['25K-50K'] += 1
        elif avg_salary < 75000:
            salary_buckets['50K-75K'] += 1
        elif avg_salary < 100000:
            salary_buckets['75K-100K'] += 1
        else:
            salary_buckets['100K+'] += 1

    cursor.close()

    return render_template('admin_analytics.html',
                           job_type_data=job_type_data,
                           skill_counts=skill_counts,
                           education_data=education_data,
                           salary_buckets=salary_buckets)

# ---------------------------------------------------------------------------------------------------------

from flask import send_file
import io
import csv

@app.route('/admin/report', methods=['GET'])
def admin_report():
    return render_template('admin_report.html')

@app.route('/admin/report/export', methods=['POST'])
def export_report():
    start_date = request.form.get('start_date')
    end_date = request.form.get('end_date')

    cursor = mysql.connection.cursor()
    query = """
        SELECT id, job_title, company_name, job_type, company_website, social_media_link,
               skills_required, education_required, job_posting_link, min_salary, max_salary, timestamp
        FROM job_data_update
        WHERE DATE(timestamp) BETWEEN %s AND %s
    """
    cursor.execute(query, (start_date, end_date))
    rows = cursor.fetchall()
    cursor.close()

    # Create CSV in memory
    output = io.StringIO()
    writer = csv.writer(output)
    
    # Header
    writer.writerow([
        'ID', 'Job Title', 'Company Name', 'Job Type', 'Company Website',
        'Social Media', 'Skills Required', 'Education', 'Job Link',
        'Min Salary', 'Max Salary', 'Timestamp'
    ])

    for row in rows:
        writer.writerow(row)

    output.seek(0)

    # Send as downloadable file
    return send_file(
        io.BytesIO(output.getvalue().encode()),
        mimetype='text/csv',
        as_attachment=True,
        download_name=f'job_data_report_{start_date}_to_{end_date}.csv'
    )


if __name__ == '__main__':
    app.run(debug=True)