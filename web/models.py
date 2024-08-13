from datetime import datetime
import jwt, time
from flask_login import UserMixin
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import func
from flask import current_app

db = SQLAlchemy()
#s_manager = LoginManager()

usr_role = db.Table(
    'usr_role',
    db.Column('uid', db.Integer, db.ForeignKey('user.id')),
    db.Column('rid', db.Integer, db.ForeignKey('role.id')),
    keep_existing=True
)

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), index=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False, index=True)
    phone = db.Column(db.String(20), unique=True, index=True)
    password = db.Column(db.String(500), nullable=False)
    photo = db.Column(db.String(1000))
    admin = db.Column(db.Boolean(), default=False)
    gender = db.Column(db.String(50))
    city = db.Column(db.String(50))
    address = db.Column(db.String(50))
    about = db.Column(db.String(5000))
    acct_no = db.Column(db.String(50))
    bank = db.Column(db.String(50))
    socials = db.Column(db.JSON, default={})
    src = db.Column(db.String(50))
    category = db.Column(db.String(50))
    online = db.Column(db.Boolean(), default=False)
    status = db.Column(db.Boolean(), default=False)
    verified = db.Column(db.Boolean(), default=False)
    ip = db.Column(db.String(50))
    dob = db.Column(db.Date)
    
    # Additional fields from UpdateMeForm
    designation = db.Column(db.String(100))
    academic_qualification = db.Column(db.String(50))
    experience_years = db.Column(db.Integer)
    experience_level = db.Column(db.String(50))
    refferee_type = db.Column(db.String(50))
    refferee_email = db.Column(db.String(100))
    refferee_phone = db.Column(db.String(20))
    refferee_address = db.Column(db.String(200))
    reg_num = db.Column(db.String(50))
    course = db.Column(db.String(100))
    cert_status = db.Column(db.String(50))
    completion_status = db.Column(db.String(50))

    notifications = db.relationship('Notification', backref='user', lazy=True)
    queries = db.relationship('Query', backref='user', lazy=True)
    assigned_tasks = db.relationship('Assigned_Task', back_populates='user', lazy=True)
    tasks = db.relationship('Task', back_populates='user', lazy=True)
    attendance = db.relationship('Attendance', backref='user', lazy=True)
    role = db.relationship('Role', secondary=usr_role, back_populates='user', lazy='dynamic')
    
    created = db.Column(db.DateTime(timezone=True), default=func.now())
    updated = db.Column(db.DateTime(timezone=True), default=func.now())
    deleted = db.Column(db.Boolean(), default=False)

    def get_id(self):
        return str(self.id)

    def is_admin(self):
        return any(role.type == 'admin' for role in self.role)

    def permit(self):
        return [r.type for r in self.role]

    def generate_token(self, exp=600, type='reset'):
        payload = {'uid': self.id, 'exp': time.time() + exp, 'type': type }
        secret_key = current_app.config['SECRET_KEY']
        return jwt.encode(payload, secret_key, algorithm='HS256')

    @staticmethod
    def verify_token(token):
        try:
            secret_key = current_app.config['SECRET_KEY']
            uid = jwt.decode(token, secret_key, algorithms=['HS256'])['uid']
            user = User.query.get(uid)
            type = jwt.decode(token, current_app.config['SECRET_KEY'], algorithms=['HS256'])['type']
        except:
            return
        return user, type

    def __repr__(self):
        return f"User('{self.name}', '{self.email}', '{self.photo}')"


class Query(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    file_path = db.Column(db.String(200), nullable=False)
    message = db.Column(db.Text, nullable=True)
    created_at = db.Column(db.DateTime, default=func.now())

class Notification(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    title = db.Column(db.String(128), index=True)
    image = db.Column(db.String(128), index=True)
    message = db.Column(db.String(255), nullable=False)
    file_path = db.Column(db.String(255), nullable=False)
    is_read = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=func.now())
    deleted = db.Column(db.Boolean(), default=False)
    created = db.Column(db.DateTime(timezone=True), default=func.now())
    updated = db.Column(db.DateTime(timezone=True), default=func.now())


class Attendance(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    timestamp = db.Column(db.Date, nullable=False, default=func.now() )
    status = db.Column(db.String(10), nullable=False)  # 'Present ✓' or 'Absent 〤' or Excused 〥 
    comment = db.Column(db.Text)
    sign_in_time = db.Column(db.DateTime, nullable=True)
    sign_out_time = db.Column(db.DateTime, nullable=True)
    
    created = db.Column(db.DateTime(timezone=True), default=func.now())
    updated = db.Column(db.DateTime(timezone=True), default=func.now())
    deleted = db.Column(db.Boolean(), default=False)  # 0-deleted, 1-not-deleted

class Assigned_Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    detail = db.Column(db.String(500), nullable=False)
    # duration = db.Column(db.DateTime(timezone=True), nullable=False, default=func.now())
    duration = db.Column(db.Time)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    user = db.relationship('User', back_populates='assigned_tasks')
    created = db.Column(db.DateTime(timezone=True), default=func.now())
    updated = db.Column(db.DateTime(timezone=True), default=func.now(), onupdate=func.now())
    deleted = db.Column(db.Boolean(), default=False)  # 0-deleted, 1-not-deleted
    
class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(500), nullable=False)
    status = db.Column(db.String(50), nullable=False, default='pending')  # pending, completed, stucked, ongoing, cancelled
    timestamp = db.Column(db.DateTime(timezone=True), nullable=False, default=func.now())
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
     # Optional: If you want to access tasks by user_id easily
    user = db.relationship('User', back_populates='tasks')
    
    created = db.Column(db.DateTime(timezone=True), default=func.now())
    updated = db.Column(db.DateTime(timezone=True), default=func.now(), onupdate=func.now())
    deleted = db.Column(db.Boolean(), default=False)  # 0-deleted, 1-not-deleted

#class Role(db.Model, RoleMixin):
class Role(db.Model):
    '''Role Table'''
    __tablename__ = 'role'
    id = db.Column(db.Integer, primary_key = True)
    type = db.Column(db.String(100), unique=True)
    user = db.relationship('User', secondary=usr_role, back_populates='role', lazy='dynamic')

class Payment(db.Model):
    __tablename__ = 'payment'
    id = db.Column(db.Integer, unique=True, primary_key=True, nullable=False)
    usr_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=True)  # Orderinfo->User->foreign-key
    
    txn_ref = db.Column(db.String(100)) #['dollar, naira etc]
    txn_amt = db.Column(db.Integer())
    txn_desc = db.Column(db.String(100)) 
    txn_status = db.Column(db.String(100), default='pending') #['pending','successful', 'cancelled', 'reversed']
    currency_code = db.Column(db.String(100)) #['dollar, naira, cedis etc]
    provider = db.Column(db.String(100)) #['paypal','stripe', 'visa', 'mastercard', paystack']

    created = db.Column(db.DateTime(timezone=True), default=func.now())
    updated = db.Column(db.DateTime(timezone=True), default=func.now())
    deleted = db.Column(db.Boolean(), default=False)  # 0-deleted, 1-not-deleted
