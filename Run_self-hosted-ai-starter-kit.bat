@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
::: ___  ________   ________  _________  ________  ___       ___       _______   ________     
::: |\  \|\   ___  \|\   ____\|\___   ___\\   __  \|\  \     |\  \     |\  ___ \ |\   __  \    
::: \ \  \ \  \\ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \|\  \   
:::  \ \  \ \  \\ \  \ \_____  \   \ \  \ \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \   _  _\  
:::   \ \  \ \  \\ \  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \\  \| 
:::    \ \__\ \__\\ \__\____\_\  \   \ \__\ \ \__\ \__\ \_______\ \_______\ \_______\ \__\\ _\ 
:::     \|__|\|__| \|__|\_________\   \|__|  \|__|\|__|\|_______|\|_______|\|_______|\|__|\|__|
:::                    \|_________|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:: Play soundbyte from audio
if not exist audio\ mkdir audio
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

timeout /t 3

:: Download the repo code if its not downloaded.
echo As-salamu alaykum!!
echo detecting presence of repo, git cloning if not detected...
echo ---------------------------------------------------------------
if exist docs\ goto Menu1
git clone https://github.com/BenevolenceMessiah/self-hosted-ai-starter-kit.git
cd self-hosted-ai-starter-kit
git pull
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------

:Menu1
echo ---------------------------------------------------------------
echo Please choose from the following options:
echo Note: These options are all case sensitive.
echo Press Ctrl+c to exit at any time!
echo ---------------------------------------------------------------
echo 1) Install self-hosted-ai-starter-kit for Nvidia GPU
echo 2) Install self-hosted-ai-starter-kit for CPU
echo 3) Run self-hosted-ai-starter-kit for Nvidia GPU
echo 4) Run self-hosted-ai-starter-kit for CPU
echo C) Exit
echo U) Update repo.
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 1 goto InstallGPU
if %option% == 2 goto InstallCPU
if %option% == 3 goto RunGPU
if %option% == 4 goto RunCPU
if %option% == C goto End
if %option% == U goto Updater

:InstallGPU
echo ---------------------------------------------------------------
echo Creating virtual environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo --------------------------------------------------------------
pip install docker
start call docker compose --profile gpu-nvidia up
start start http://localhost:5678/
start start http://localhost:5678/workflow/srOnR8PAY3u4RSwb
goto Menu1

:InstallCPU
echo ---------------------------------------------------------------
echo Creating virtual environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo --------------------------------------------------------------
pip install docker
start call docker compose --profile cpu up
start start http://localhost:5678/
start start http://localhost:5678/workflow/srOnR8PAY3u4RSwb
goto Menu1

:RunGPU
echo ---------------------------------------------------------------
echo Firing up the server...
echo And
echo Firing up the CLI!
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
start call docker compose --profile gpu-nvidia up
start start http://localhost:5678/
goto Menu1

:RunCPU
echo ---------------------------------------------------------------
echo Firing up the server...
echo And
echo Firing up the CLI!
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
start call docker compose --profile cpu up
start start http://localhost:5678/
goto Menu1

:Updater
echo ---------------------------------------------------------------
echo Updating repo...
echo ---------------------------------------------------------------
ls | xargs -I{} git -C {} pull
echo Complete!
echo ---------------------------------------------------------------
:: Docker Update/RebuildOptions. Uncomment and run option 'U' edpending on your system   
:: docker compose --profile gpu-nvidia pull
:: docker compose create && docker compose up
:: docker compose --profile cpu pull
:: docker compose create && docker compose up
goto Menu1

:End 
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo ---------------------------------------------------------------
pause