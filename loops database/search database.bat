@echo off
chcp 65001
title Loops Tools
setlocal enabledelayedexpansion
color 4

:menu
cls
echo            ██╗      ██████╗  ██████╗ ██████╗ ███████╗
echo            ██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
echo            ██║     ██║   ██║██║   ██║██████╔╝███████╗
echo            ██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
echo            ███████╗╚██████╔╝╚██████╔╝██║     ███████║
echo            ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝

echo.
echo [1] Option 1: Tools Info
echo [2] Option 2: Search in DataBase

set /p choice="───(%COMPUTERNAME%@loops)──$"

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2

:option1
cls
echo            ██╗      ██████╗  ██████╗ ██████╗ ███████╗
echo            ██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
echo            ██║     ██║   ██║██║   ██║██████╔╝███████╗
echo            ██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
echo            ███████╗╚██████╔╝╚██████╔╝██║     ███████║
echo            ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝
echo.
echo Ce tools est conçu par la Loops. Il y a plusieurs fonctions sur ce tools.
echo Si des bugs ou autres problèmes surviennent, veuillez les signaler sur notre Discord:
echo https://discord.gg/zbfrPxpfy8
echo.
echo Appuyez sur Entrée pour retourner au menu principal...
pause >nul
goto menu

:option2
cls
echo            ██╗      ██████╗  ██████╗ ██████╗ ███████╗
echo            ██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔════╝
echo            ██║     ██║   ██║██║   ██║██████╔╝███████╗
echo            ██║     ██║   ██║██║   ██║██╔═══╝ ╚════██║
echo            ███████╗╚██████╔╝╚██████╔╝██║     ███████║
echo            ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝
echo.
set /p keyword="Entrez le mot clé à rechercher dans la database: "
set "filename=database\database.txt"

:: Check if the file exists
if not exist "%filename%" (
    echo Fichier non trouvé: %filename%
    echo Appuyez sur Entrée pour retourner au menu principal...
    pause >nul
    goto menu
)

:: Check if the file is empty
for %%A in ("%filename%") do set "size=%%~zA"
if %size% equ 0 (
    echo ERREUR: Vous devez ajouter une database à %filename%
    echo Appuyez sur Entrée pour retourner au menu principal...
    pause >nul
    goto menu
)

:: Search for the keyword in the file and display matching lines
echo Recherche de "%keyword%" dans %filename%...
findstr /i /c:"%keyword%" "%filename%"

if errorlevel 1 (
    echo Aucune correspondance trouvée.
) else (
    echo Correspondances trouvées.
)

echo.
echo Appuyez sur Entrée pour retourner au menu principal...
pause >nul
goto menu

:quit
exit
