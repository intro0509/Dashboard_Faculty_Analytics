@echo off
title Dashboard Upload

set GIT="C:\Program Files\Git\cmd\git.exe"
set REPO_PATH=%USERPROFILE%\Dashbaord-Test

if not exist "%REPO_PATH%" (
    echo ERROR: Dashbaord-Test folder not found.
    pause
    exit /b
)

cd /d "%REPO_PATH%"

echo Step 1: Pulling latest files...
%GIT% pull

echo Step 2: Adding files...
%GIT% add .

echo Step 3: Committing...
%GIT% commit -m "update"

echo Step 4: Pushing to GitHub...
%GIT% push

echo.
echo Done!
echo https://intro0509.github.io/Dashbaord-Test/dashboard.html
echo.
pause
