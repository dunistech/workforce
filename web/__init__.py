from flask import (
    Flask
)
from flask_wtf.csrf import CSRFProtect
from flask_migrate import Migrate
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_mail import Mail
from flask_moment import Moment
from flask_session import Session
# from flask_oauthlib.client import OAuth
from web.models import db, User

from dotenv import load_dotenv
from web.utils import activelink, slug
load_dotenv()

csrf = CSRFProtect()
f_session = Session()
bcrypt = Bcrypt()
s_manager = LoginManager()
mail = Mail()
migrate = Migrate()
moment = Moment()
# oauth = OAuth()

from authlib.integrations.flask_client import OAuth  # New
oauth = OAuth()

@s_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

s_manager.login_view = 'auth.signin'
#s_manager.login_view = 'auth.signin'

def configure_extensions(app):
    db.init_app(app)
    csrf.init_app(app)
    f_session.init_app(app)
    bcrypt.init_app(app)
    s_manager.init_app(app)
    mail.init_app(app)
    migrate.init_app(app, db)
    moment.init_app(app)
    oauth.init_app(app)

def create_app():
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_pyfile('confiq.py')  # Load configuration from a separate file
    #db = SQLAlchemy(app)
    #s_manager = LoginManager(app)
    configure_extensions(app)
    
    # Register blueprints
    from web.apis.attendance import attendance_bp
    app.register_blueprint(attendance_bp)
    
    from web.apis.assigned_task import assigned_task_bp
    app.register_blueprint(assigned_task_bp)
    
    from web.apis.tasks import task_bp
    app.register_blueprint(task_bp)
    
    from web.auth.routes import auth
    app.register_blueprint(auth)
    
    from web.main.routes import main
    app.register_blueprint(main)
    
    from web.errors.handlers import errors_bp
    app.register_blueprint(errors_bp)
    
    from web.utils.user_role import has_role
    # Register the filter with Flask/Jinja
    app.jinja_env.filters['has_role'] = has_role

    app.jinja_env.filters['slugify'] = slug.slugify
    app.jinja_env.globals.update(is_active=activelink.is_active)

    return app
