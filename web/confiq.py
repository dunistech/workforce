
from os import environ

from dotenv import load_dotenv
load_dotenv()

TESTING = environ.get('TESTING') 
DEBUG = environ.get('DEBUG') 
FLASK_ENV = environ.get('FLASK_ENV')

# email config
MAIL_DEBUG = 1
#MAIL_USE_SSL = environ.get('MAIL_USE_SSL')
DEFAULT_MAIL_SENDER = environ.get('MAIL_USERNAME')
SECRET_KEY = environ.get('SECRET_KEY') or 'you-will-never-guess-usssss'

# Set the SQLALCHEMY_DATABASE_ENGINE option
SQLALCHEMY_DATABASE_ENGINE = {
    'rollback_on_exception': True,
}

SQLALCHEMY_DATABASE_URI = environ.get('SQLALCHEMY_DATABASE_URI')
# SQLALCHEMY_DATABASE_URI="mysql+mysqlconnector://root@localhost:3306/dunis_attendance_system_db?collation=utf8mba_general_ci"
# SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://user:password@localhost/db_name?charset=utf8mb4&collation=utf8mb4_general_ci'

SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_POOL_SIZE = 50   # Increase the pool size if necessary
SQLALCHEMY_POOL_TIMEOUT = 30  # Increase the pool timeout if necessary
SQLALCHEMY_MAX_OVERFLOW = 20  # Allow up to 20 additional connections beyond the pool size
SQLALCHEMY_POOL_RECYCLE = 3600  # Recycle connections every hour
 
LOG_TO_STDOUT = environ.get('LOG_TO_STDOUT')
MAIL_SERVER = environ.get('MAIL_SERVER')
MAIL_PORT = int(environ.get('MAIL_PORT') or 25)
MAIL_USE_TLS = environ.get('MAIL_USE_TLS') is not None
MAIL_USERNAME = environ.get('MAIL_USERNAME')
MAIL_PASSWORD = environ.get('MAIL_PASSWORD')
ADMINS = ['jameschristo962@gmail.com', 'chrisjsmez@gmail.com']
LANGUAGES = ['en', 'es']
MS_TRANSLATOR_KEY = environ.get('MS_TRANSLATOR_KEY')
ELASTICSEARCH_URL = environ.get('ELASTICSEARCH_URL')
POSTS_PER_PAGE = 25

UPLOAD_FOLDER = environ.get('UPLOAD_FOLDER')
#Specifies the maximum size (in bytes) of the files to be uploaded
MAX_CONTENT_PATH = environ.get('MAX_CONTENT_PATH')
ALLOWED_EXTENSIONS = environ.get('ALLOWED_EXTENSIONS')
UPLOAD_EXTENSIONS = ['.jpg', '.png', '.gif']
MAX_CONTENT_LENGTH = 1024 * 1024

#prevents Shared Session Cookies
SESSION_COOKIE_HTTPONLY = True
SESSION_COOKIE_SECURE = True  # If using HTTPS
SESSION_TYPE = 'filesystem'

LOGO = {
        'favicon': './images/logo/dunistech.png',
        'navlogo': './images/logo/dunistech.png',
        'academy_logo': './images/logo/dunistech_academy.png',
        'main_logo': './images/logo/dunistech.png',
        'footer_logo': './images/logo/dunistech.png',
        'mobile_logo': './images/logo/dunistech.png'
    }