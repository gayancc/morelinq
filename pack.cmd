@echo off
setlocal
chcp 1252 > nul
for %%i in (NuGet.exe) do set nuget=%%~dpnx$PATH:i
if "%nuget%"=="" goto :nonuget
pushd "%~dp0"
if not exist dist md dist
if not %errorlevel%==0 exit /b %errorlevel%
call build /v:m && for %%i in (pkg\*.nuspec) do NuGet pack %%i -OutputDirectory dist -BasePath .
goto :EOF

:nonuget
echo NuGet executable not found in PATH
echo For more on NuGet, see http://nuget.codeplex.com
exit /b 2
