@echo off
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Python not found. Please install Python first.
    echo Download: https://www.python.org/downloads/
    echo Or use VS Code "Live Server" extension instead.
    pause
    exit /b
)

echo Starting local server on http://localhost:8000 ...
start "Birthday Server" cmd /c "python -m http.server 8000"

timeout /t 2 /nobreak >nul
start "" "http://localhost:8000/birthday.html"

echo.
echo Server is running. Keep the "Birthday Server" window open.
echo Close that window to stop the server.
pause