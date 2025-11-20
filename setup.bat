@echo off
set /p REPOSITORY_PATH="Please enter the path to the transformer directory at tag v4.57.0: "

if not exist "%REPOSITORY_PATH%" (
    echo Error: Directory '%REPOSITORY_PATH%' does not exist!
    exit /b 1
)

if exist ".venv\Scripts\activate.bat" (
    call .venv\Scripts\activate
    echo Virtual environment activated
) else (
    echo No python venv found in the directory
)

echo Repository path set to: %REPOSITORY_PATH%
echo Now run: jupyter notebook