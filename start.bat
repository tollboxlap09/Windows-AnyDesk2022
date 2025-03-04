@echo off

:START_ANYDESK
anydesk --start
powershell -Command "Start-Sleep -Seconds 5"
for /f "delims=" %%i in ('"C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --get-id') do (
    set ID=%%i
)
if "%ID%"=="" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)
if "%ID%"=="0" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)

echo toolboxlap | anydesk.exe --set-password _full_access
start "" /MAX "C:\Users\Public\Desktop\VMQuickConfig"
python -c "import pyautogui as pag; pag.click(147, 489, duration=2)"
python -c "import pyautogui as pag; pag.click(156, 552, duration=2)"
python -c "import pyautogui as pag; pag.click(587, 14, duration=2)"
python -c "import pyautogui as pag; pag.click(916, 17, duration=2)"
python -c "import pyautogui as pag; pag.click(897, 64, duration=2)"

echo Script By (TOOLBOXLAP) :

echo " Follow us on social media "

echo Blog : https://www.toolboxlap.xyz

echo Youtube : https://www.youtube.com/@TOOLBOXLAP-u1c

echo Facebook : echo FaceBook : https://www.facebook.com/profile.php?id=61567896692994
echo ..................................................
echo AnyDesk ID is: %ID%
echo AnyDesk Password: toolboxlap
echo You can login now!
