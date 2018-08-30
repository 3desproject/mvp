@echo off
setlocal
mv build.env .env
findstr /c:"LOGIN=" .env >nul
if %errorlevel%==1 (
goto insert_login
) else (
goto check_pass
)

:insert_login
set /p login=Enter 3DES login:
echo LOGIN=%login%>> ./.env
goto check_pass

:check_pass
findstr /c:"PASS=" .env >nul
if %errorlevel%==1 (
goto insert_pass
) else (
goto end
)

:insert_pass
set /p pass=Enter 3DES password:
echo PASS=%pass%>> ./.env
goto end

:end
echo [OK]
echo Running 3DES Worker...
docker-compose up -d
endlocal
