@echo off
title Dashboard Upload

set GIT="C:\Program Files\Git\cmd\git.exe"
set REPO_PATH=%~dp0

cd /d "%REPO_PATH%"

if not exist "%REPO_PATH%.git" (
    echo ERROR: %REPO_PATH% is not a git repository.
    pause
    exit /b
)

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
if errorlevel 1 (
    echo.
    echo FAILED: git push did not succeed. Nothing new was published.
    echo.
    pause
    exit /b
)

echo.
echo Done!
echo [Overview]     https://intro0509.github.io/Dashbaord-Test/Dashboard_Overview.html
echo [Recruitment]  https://intro0509.github.io/Dashbaord-Test/Dashboard_Recruitment.html
echo [Main]         https://intro0509.github.io/Dashbaord-Test/index.html
echo.
pause
