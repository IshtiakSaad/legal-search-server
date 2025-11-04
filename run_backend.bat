@ECHO OFF
TITLE Backend Server

ECHO --- Backend Setup Starting ---

IF NOT EXIST venv (
    ECHO Creating Python 3.11 virtual environment...

    py -3.11 -m venv venv
    
    IF %ERRORLEVEL% NEQ 0 (
        ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ECHO ERROR: Failed to cfreate venv
        ECHO Make sure Python 3.11 is installed
        ECHO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        EXIT /B
    )
) ELSE (
    ECHO Virtual environment 'venv' already exists.
)

ECHO Activating Virtual Env.
CALL venv\Scripts\activate.bat

:: Install Dependencies
ECHO Installing Dependencies from requirement.txt
pip install -r requirements.txt
IF %ERRORLEVEL% NEQ 0 (
    ECHO ERROR: Failed to install dependencies.
    PAUSE
    EXIT /B
)

:: Run the server.
ECHO .
ECHO ---Starting FastAPI Server ---
ECHO access the server at: http://127.0.0.1:8000
ECHO Press CTRL+C to stop the server.
ECHO .
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload