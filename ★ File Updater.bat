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

echo Step 1: Adding files...
%GIT% add .

echo Step 2: Committing...
%GIT% commit -m "update"

echo Step 3: Syncing with GitHub...
%GIT% fetch origin
%GIT% pull origin main --rebase
if errorlevel 1 (
    echo WARNING: Rebase conflict detected. Aborting rebase and force pushing...
    %GIT% rebase --abort
)

echo Step 4: Pushing to GitHub...
%GIT% push --force origin main

echo.
echo Done!
echo https://intro0509.github.io/Dashbaord-Test/dashboard.html
echo.
pause
