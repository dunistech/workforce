@REM @echo off
@REM cd C:\_\workforce_v0 
@REM call env\Scripts\activate
::python app.py
@REM set FLASK_APP=app.py
@REM set FLASK_ENV=development
@REM flask run --host=0.0.0.0 --port=5000 debug=1
@REM python -m flask run --host=0.0.0.0 --port=5000
::flask run
::@echo off
::cd C:\_\workforce_v0
::call env\Scripts\activate
::gunicorn --bind 0.0.0.0:8000 app:app

@echo off
cd C:\_\workforce_v0
call env\Scripts\activate
set FLASK_APP=app.py
set FLASK_ENV=development
set FLASK_DEBUG=True
flask run --host=0.0.0.0 --port=5000
