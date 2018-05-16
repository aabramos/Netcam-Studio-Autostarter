@echo off
mode con: cols=180 lines=50

@echo Netcam Script Autostarter for Windows
@echo.

ping 127.0.0.1 -n 1 > nul

sc start NetcamStudioSvc
sc query "NetcamStudioSvc" | find "RUNNING"
cls
@echo Verifying Netcam service intialization...

ping 127.0.0.1 -n 3 > nul

if "%ERRORLEVEL%"=="0" (
	@echo Initialization successful.
) else (
	@echo Failed to initialize Netcam Studio service. Please try again.
)
