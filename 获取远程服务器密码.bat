@echo off
cd C:\Program Files (x86)\WinSCP
for /f "delims=" %%i in ('Winscppwd WinSCP.ini') do echo get %%i
pause
@echo on