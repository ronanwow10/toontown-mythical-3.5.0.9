@echo off
cd.. desktop
title Toontown Mythical Game Launcher

echo Choose your connection method!
echo.
echo #1 - Localhost
echo #2 - Dev Server
echo #3 - Custom
echo #4 - Local RemoteDB
echo #5 - Prod Server
echo selection:
echo loading...

set INPUT=-1
set /P INPUT=Selection: 

if %INPUT%==1 (
    set TTR_GAMESERVER=127.0.0.1
) else if %INPUT%==2 (
    set TTR_GAMESERVER=167.114.220.172
) else if %INPUT%==4 (
    set TTR_GAMESERVER=127.0.0.1
) else if %INPUT%==5 (
    SET TTR_GAMESERVER=lw2.ez-webz.com:7198
) else if %INPUT%==3 (
    echo.
    set /P TTR_GAMESERVER=Gameserver: 
) else (
	goto selection
)

echo.

if %INPUT%==2 (
    set /P ttrUsername="Username: "
    set /P ttrPassword="Password: "
) else if %INPUT%==4 (
    set /P ttrUsername="Username: "
    set /P ttrPassword="Password: "
) else (
    set /P TT_PLAYCOOKIE=Username: 
)

echo.

echo ===============================
echo Starting Toontown Mythical...
echo ppython: "C:\Panda3D-1.10.0\python\ppython.exe"

if %INPUT%==2 (
    echo Username: %ttrUsername%
) else if %INPUT%==4 (
    echo Username: %ttrUsername%
) else (
    echo Username: %TTR_PLAYCOOKIE%
)

echo Gameserver: %TTR_GAMESERVER%
echo ===============================

cd ../../

:main
if %INPUT%==2 (
    "C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStartRemoteDB
) else if %INPUT%==4 (
    "C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStartRemoteDB
) else (
    "C:\Panda3D-1.10.0\python\ppython.exe" -m toontown.toonbase.ToontownStart
)

set TTR_GAMESERVER=127.0.0.1
set TTR_PLAYCOOKIE=%ttrUsername%
set TTR_Password=password
set TTR_Username=username
pause

goto server
