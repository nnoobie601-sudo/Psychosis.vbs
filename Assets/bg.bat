@echo off
set "teal_rgb=18 114 117"

:loop
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Colors" /v Background') do (
    if "%%a" neq "%teal_rgb%" (
        reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "%teal_rgb%" /f
        reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
        RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
    )
)
timeout /t 5 /nobreak >nul
goto loop