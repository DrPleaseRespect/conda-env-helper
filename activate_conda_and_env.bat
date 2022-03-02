@echo off
REM ANACONDA3 Environment Helper | Created By DrPleaseRespect

REM VARIABLES

REM Change Variable to Environment Name
set c_env=

REM Change Variable to Conda Activate Thing
set c_path="F:\Programs\Anaconda3\Scripts\activate.bat"

REM CLI or GUI? (cli or gui)
set mode=

REM If GUI call (you can leave it blank if cli)
set gui_file=



REM DO NOT TOUCH (If you don't know what you are doing)
REM STARTUP
set script_location="%~f0"
set startup_command=call cmd.exe /k "set bootup_complete=true & call %script_location%"
set title=%c_env% Anaconda3 Environment Helper

REM IF BOOTUP IS COMPLETE GOTO START
IF defined bootup_complete goto start

REM CHECK FOR /c Parameter
cls
echo If Execution Stopped Here, run in clean cmd.exe environment.
for %%x in (%cmdcmdline%) do if /i "%%~x"=="/c" set DOUBLECLICKED=1
cls

if defined DOUBLECLICKED (goto double_click) else (goto from_shell)


:double_click
echo --STANDALONE MODE --
echo.
if not defined bootup_complete %startup_command% & exit

:from_shell
echo --CMD SHELL MODE --
echo.
if not defined bootup_complete %startup_command%
goto exit_line


REM Main
:start
title %title%
color 4A
echo -- STARTUP SEQUENCE --
echo CALLING ANACONDA3
call %c_path%
echo ANACONDA3 ACTIVATED
echo ACTIVATING %c_env% ENVIRONMENT
call conda activate %c_env%
echo ACTIVATED %c_env% ENVIRONMENT
echo -- STARTUP SEQUENCE COMPLETE --
echo.
color 0F


if %mode%==cli goto cli
if %mode%==gui goto gui


:gui
echo -- RUNNING AS GUI MODE --
echo Running GUI File
call %gui_file%
echo GUI File has Exited
exit

:cli
echo -- RUNNING AS CLI MODE --
goto exit_line

:exit_line