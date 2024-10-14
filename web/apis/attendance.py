
from flask_login import current_user, login_required
from datetime import date, datetime, timedelta
from flask import stream_template, Blueprint, request, jsonify
from flask_login import current_user, login_required
from sqlalchemy import func
import traceback
from web.models import (
    Attendance, User, Attendance
)

from web import db, csrf
from web.utils.user_role import has_role

def handle_response(message=None, alert=None, data=None):
    """ only success response should have data and be set to True. And  """
    response_data = {
        'message': message,
    }
    if data:
        response_data['alert'] = alert

    if data:
        response_data['data'] = data

    return response_data

attendance_bp = Blueprint('attendance_api', __name__)


@attendance_bp.route('/create_attendance', methods=['POST'])
@csrf.exempt
@login_required
def attendance():
    try:
        
        if not db.session.is_active:
            db.session.begin()
    
        data = request.get_json()
        #print(data)
        
        user_id = data.get('user_id', current_user.id)
        action = data.get('action')
        today = data.get('today', datetime.utcnow() )
        comment = data.get('comment', None )
        #print(action == 'signin')
        user = User.query.get(user_id)
        
        if not user:
            return jsonify({"error": "User not found"}), 404

        if (action == 'signin'):
            attendance = Attendance(user_id=user_id, timestamp=today, status='p')
            db.session.add(attendance)
            attendance.sign_in_time = today
            attendance.comment = comment if comment is not None else 'resumed for the day'
            db.session.commit()
            # Refresh the session and query for the latest attendance record
            db.session.refresh(attendance)
            #return jsonify({"message":f"Signed in | {attendance.sign_in_time} "}), 200
        
            #formatted_sign_in_time = attendance.sign_out_time.strftime("%B %d, %Y at %I:%M %p")
            formatted_sign_in_time = today.strftime("%B %d, %Y at %I:%M %p")
            return jsonify({"message": f"signed in at {formatted_sign_in_time}"}), 200
        
        elif (action == 'signout'):
            #attendance = Attendance.query.filter_by(user_id=user_id, timestamp=today).first()
            # filter where weather a user has logged that day first, b/4 trying to cloc-out
            from sqlalchemy import and_, func
            attendance = Attendance.query.filter(
                and_(
                    Attendance.user_id == user_id,
                    func.date(Attendance.sign_in_time) == func.date(today),
                    Attendance.sign_out_time == None
                )
            ).order_by(Attendance.timestamp.desc()).first()

            if not attendance or not attendance.sign_in_time:
                return jsonify({"message": "Cannot sign out without signing in first"}), 400

            if attendance.sign_in_time and attendance.status == 'p':
                
                attendance.comment = comment if comment is not None else 'closed for the day'
                
                attendance.sign_out_time = today
                #attendance.status = 'a'
                db.session.commit()
                #return jsonify({"message": f"Signed-out at {attendance.sign_out_time}" }), 200
                formatted_sign_out_time = today.strftime("%B %d, %Y at %I:%M %p")
                return jsonify({"message": f"signed-out at {formatted_sign_out_time}"}), 200

        return jsonify({"message": "Invalid action"}), 400

    except Exception as ex:
        print(traceback.print_exc())
        print(ex)
        return jsonify({"message": f"{ex}"})
    
@attendance_bp.route('/total_attendance', methods=['GET'])
@login_required
def total_attendance():
    """ Evaluating total monthly attendance for the month """
    user_id = current_user.id

    # Get the current date
    current_date = datetime.now()

    # Calculate the start date of the current month
    start_date = datetime(current_date.year, current_date.month, 1)

    # Calculate the end date of the current month
    next_month = current_date.replace(day=28) + timedelta(days=4)
    end_date = next_month - timedelta(days=next_month.day)

    # Query to retrieve the unique dates on which the user clocked in within the month
    unique_dates = db.session.query(func.date(Attendance.timestamp)).filter(
        Attendance.user_id == user_id,
        Attendance.timestamp >= start_date,
        Attendance.timestamp <= end_date
    ).distinct()

    # Count the number of unique dates
    total_attendance = unique_dates.count()

    return jsonify({"total_attendance": total_attendance}), 200

@attendance_bp.route('/attendance_status', methods=['GET'])
@login_required
def get_status():
    
    user_id = current_user.id
    today = date.today()
    #attendance = Attendance.query.filter_by(user_id=user_id, timestamp=today).first()
    
    from sqlalchemy import and_, func
    # filter weather a user has logged-in atleast for that day to know the status of a user for the day.
    attendance = Attendance.query.filter(
        and_(
            Attendance.user_id == user_id,
            #func.date(Attendance.timestamp) == func.date(today)
            Attendance.timestamp == func.date(today)
        )
    ).order_by(Attendance.created.desc()).first()

    if attendance:
        #if attendance.sign_in_time and not attendance.sign_out_time:
        if attendance.sign_in_time and attendance.sign_out_time is None:
        #if attendance.sign_in_time and attendance.status == 'p':
            
            return jsonify({"status": "signed_in"}), 200

        return jsonify({"status": "signed_out"}), 200
    
    return jsonify({"status": "not_signed_in"}), 200


# fetch/get attendances
@attendance_bp.route('/fetch_attendance_one', methods=['GET'])
@login_required
@csrf.exempt
def fetch_attendance_one():
    try:
        user_id = current_user.id
        attendances = Attendance.query.filter_by(user_id=user_id).order_by(Attendance.time_in.desc()).all()

        attendance_list = []
        for attendance in attendances:
            attendance_list.append({
                'id': attendance.id, 
                'sign_in_time': attendance.sign_in_time.strftime('%d %b %Y %H:%M:%S'),
                'sign_out_time': attendance.sign_out_time.strftime('%d %b %Y %H:%M:%S') if attendance.sign_out_time else 'N/A'
            })
        print(attendance_list)
        return jsonify({"attendances": attendance_list}), 200
    except Exception as e:
        return jsonify({"success": False, "error": f"{e}"}), 200

# fetch/get all attendances
@attendance_bp.route('/fetch_attendance_all', methods=['GET'])
@login_required
@csrf.exempt
def fetch_attendance_all():
    try:
        # attendances = Attendance.query.order_by(Attendance.sign_in_time.desc()).all()
        # Exclude deleted records (assuming there's an 'is_deleted' boolean field)
        attendances = Attendance.query.filter_by(deleted=False).order_by(Attendance.sign_in_time.desc()).all()
        attendance_list = []
        for attendance in attendances:
            attendance_list.append({
                'id': attendance.id,
                'user_id': attendance.user_id,
                'user_info': attendance.user.name,
                'username': attendance.user.username,  # Assuming there is a relationship to fetch the username
                'sign_in_time': attendance.sign_in_time.strftime('%I:%M %p'), 
                'sign_out_time': attendance.sign_out_time.strftime('%I:%M %p') if attendance.sign_out_time else 'N/A',
                # 'date': attendance.timestamp.strftime('%d %b %Y %H:%M:%S') 
                'date': attendance.timestamp.strftime('%a, %b %d'),  # Date in the format: fri, Jun 21
            })
        # print(attendance_list)
        return jsonify({"attendances": attendance_list}), 200
    except Exception as e:
        return jsonify({"success": False, "error": f"{e}"})


# updating
@attendance_bp.route('/update_attendance/<int:task_id>', methods=['PUT'])
@login_required
@csrf.exempt
def update_assigned_task(task_id):
    try:
        data = request.get_json()
        task = Attendance.query.get(task_id)
        
        if not task or task.user_id != current_user.id:
            return jsonify({"error": "Assigned Task not found"}), 404

        task.detail = data['detail']
        task.duration = data['duration']
        
        db.session.commit()
        return jsonify({"success": True, "message":"Assigned Task updated successfully"}), 200
    except Exception as e:
        return jsonify({"success": False, "error":f"{e}"}), 200

# Deletion of attendance
@attendance_bp.route('/delete-attendance/<int:attendance_id>', methods=['DELETE'])
@login_required
@csrf.exempt
def delete_attendance(attendance_id):
    try:
        attendance = Attendance.query.get(attendance_id)
        
        if not attendance:
            return jsonify({"success": False, "error": "Attendance not found"})
        
        # Check if the user is either the owner of the attendance or has the 'admin' role
        if attendance.user_id != current_user.id and not has_role(current_user, ['admin', 'hr', 'md', 'dev']):
            return jsonify({"success": False, "error": f"Permission denied. You can't delete {attendance.user.name}'s attendance."})

        # Delete the attendance record
        db.session.delete(attendance)
        db.session.commit()
        
        return jsonify({"success": True, "message": "Attendance deleted successfully"}), 200

    except Exception as e:
        db.session.rollback()  # Rollback the session in case of an error
        return jsonify({"success": False, "error": f"{e}"})


# Deletion of all attendance records
@attendance_bp.route('/delete-all-attendance', methods=['DELETE'])
@login_required
@csrf.exempt
def delete_all_attendance():
    try:
        # Check if the user is an admin
        if not has_role(current_user, ['admin', 'hr', 'md', 'dev']):
            return jsonify({"success": False, "error": "Permission denied. You can't delete all attendance records"})

        # Delete all attendance records
        Attendance.query.delete()  # Deletes all records in the Attendance table
        db.session.commit()

        return jsonify({"success": True, "message": "All attendance records deleted successfully"}), 200

    except Exception as e:
        db.session.rollback()  # Rollback in case of an error
        return jsonify({"success": False, "error": f"{e}"}), 500

@attendance_bp.route('/delete-attendance_0/<int:attendance_id>', methods=['DELETE'])
@login_required
@csrf.exempt
def delete_attendance_0(attendance_id):
    try:
        
        attendance = Attendance.query.get(attendance_id)
        
        if not attendance or attendance.user_id != current_user.id:
            return jsonify({"error": "Attendance not found"}), 404

        db.session.delete(attendance)
        db.session.commit()
        # return jsonify({"success": True}), 200
        return jsonify({"success": True, "message":"Attendance deleted successfully"}), 200
    
    except Exception as e:
        return jsonify({"success": False, "error":f"{e}"}), 200


from flask import Response
import csv
from io import StringIO
from datetime import datetime
# from your_model_file import Attendance  # Assuming the model and relationships are in place

# Download attendance records as CSV
@attendance_bp.route('/download_csv-attendance', methods=['GET'])
@login_required
@csrf.exempt
def download_csv_attendance():
    try:
        # Fetch attendance records, excluding deleted ones
        attendances = Attendance.query.filter_by(deleted=False).order_by(Attendance.sign_in_time.desc()).all()

        # Create CSV in memory
        si = StringIO()
        cw = csv.writer(si)

        # Write headers to CSV
        cw.writerow(['S/N', 'User ID', 'Username', 'Name', 'Sign-in Time', 'Sign-out Time', 'Date'])

        # Write attendance data
        for i, attendance in enumerate(attendances, 1):
            cw.writerow([
                i,  # Serial number
                attendance.user_id,
                attendance.user.username,  
                attendance.user.name,
                attendance.sign_in_time.strftime('%I:%M %p'),
                attendance.sign_out_time.strftime('%I:%M %p') if attendance.sign_out_time else 'N/A',
                attendance.timestamp.strftime('%a, %b %d')
            ])

        # Get CSV data as a string
        output = si.getvalue()
        si.close()

        # Get current date and time to include in the filename
        current_datetime = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')

        # Return CSV response with dynamically generated filename
        return Response(output, mimetype="text/csv",
                        headers={"Content-Disposition": f"attachment;filename=attendance_records_{current_datetime}.csv"})

    except Exception as e:
        return jsonify({"success": False, "error": f"{e}"}), 500

