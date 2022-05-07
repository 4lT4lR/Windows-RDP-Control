tzutil /s "SE Asia Standard Time"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters\ /v AllowEncryptionOracle /t REG_DWORD /d 2
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections  /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp  /t REG_DWORD /d 0 /f

certutil -urlcache -split -f https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/7z.exe
certutil -urlcache -split -f https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/dcontrol.zip
certutil -urlcache -split -f https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/curl.exe
certutil -urlcache -split -f https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/7z.dll
certutil -urlcache -split -f https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/nircmd.exe
curl -LJOk https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/ngrok.exe

cd C:\Users\Administrator\Desktop
curl -LJOk https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/chromesetup.exe
curl -LJOk https://raw.githubusercontent.com/4lT4lR/RDP-Control/main/firefox.exe
start chromesetup.exe
cls
@echo off
set /p id="Paste Your NGROK AUTHTOKEN (Ctrl+V): "
ngrok authtoken %id%
start ngrok tcp 3389
net start audiosrv
taskkill /f /im sqlservr.exe
taskkill /f /im Batch.exe
taskkill /f /im w3wp.exe
taskkill /f /im explorer.exe
start explorer.exe
SET IP=x.x.x.xSET USERNAME=myuser
SET PASSWORD=mypass
SET DOMAIN=my.domain
cmd /c cmdkey /add:TERMSRV/server.%IP% /user:%DOMAIN%\%USERNAME% /pass:%PASSWORD%
cmd /c "cmdkey /generic:TERMSRV/%IP% /user:%USERNAME% /pass:%PASSWORD%"
cmd /c "mstsc /f /v:%IP%"
cmd /c "timeout /t 0 /nobreak"
cmd /c "cmdkey /delete:TERMSRV/%IP%"
exit