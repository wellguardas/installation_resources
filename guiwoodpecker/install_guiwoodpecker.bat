@echo off
set installation_path="%USERPROFILE%\WellGuardGUI\"
set miniconda_path="%USERPROFILE%\miniconda3\"


::---------------------------------------------------------------------::
rem Ensure git and miniconda is installed (Cando should not be a requirement)
::---------------------------------------------------------------------::
if exist %miniconda_path% (
  echo Conda path found
) else (
  echo Ensure that Miniconda is installed!
  goto:end_of_file
)
call git | findstr "usage: git"
if %errorlevel%==1 (
  echo Ensure that Git is installed!
  goto:end_of_file
)


::---------------------------------------------------------------------::
rem Ask for permission to install at %USERPROFILE%\WellGuardGUI\ folder
::---------------------------------------------------------------------::
cls
echo Installing WoodPecker GUI (guiwoodpecker) at %installation_path%
set /p continue_installation=Ok? (y/n):
echo You answered %continue_installation%
if %continue_installation% neq y goto:end_of_file 


::---------------------------------------------------------------------::
rem Ensure that %USERPROFILE%\WellGuardGUI folder exists and set cwd
::---------------------------------------------------------------------::
if exist %installation_path% (
  echo Folder "WellGuardGUI" already exists...
) else (
  echo Folder "WellGuardGUI" does not exists, creating it
  mkdir %installation_path%
  if exist %installation_path% (
	echo Folder creation complete
  ) else (
	echo Failed to create folder...
	goto:end_of_file
  )
)
cd %installation_path%


::---------------------------------------------------------------------::
rem Clone repository from GitLab
::---------------------------------------------------------------------::
Echo Cloning GUI for Woodpecker Tool from GitLab
::@(  Echo enduser
::    Echo wQpeuvb9erNB3S4Bj_x_
::) | call git clone "https://gitlab.com/WellGuard_AS/guiwoodpecker.git"
call git clone "https://gitlab.com/WellGuard_AS/guiwoodpecker.git"


::---------------------------------------------------------------------::
rem Create Conda environment
::---------------------------------------------------------------------::
echo:
set path_conda_bat="%USERPROFILE%\miniconda3\condabin\conda.bat"
ECHO Creating environment
call %path_conda_bat% env create -f "%USERPROFILE%\WellGuardGUI\guiwoodpecker\environment.yml"
call shell_scripts\update_wxbuild_package.bat
:: call "%repo_shell_scripts_path%\update_wxbuild_package.bat"


::---------------------------------------------------------------------::
rem Activate conda environment
::---------------------------------------------------------------------::
echo:
::set conda_activate_path="%USERPROFILE%\miniconda3\Scripts\activate"
::call %conda_activate_path% "guiwoodpecker
call %path_conda_bat% activate "guiwoodpecker"
::call conda list


::---------------------------------------------------------------------::
rem Install wxbuild package
::---------------------------------------------------------------------::
echo:
call pip | findstr "Usage:"
if %errorlevel%==0 (goto:pip_is_fine) else (goto:pip_install)
:pip_install
echo Reinstalling pip
call %path_conda_bat% uninstall pip -force -y
call %path_conda_bat% install pip -y

:pip_is_fine
echo Pip is fine now, installing wxbuild from GitHub
call pip install "git+https://github.com/mkkb/wxbuild@linux_compatibility"


echo:
echo:
echo WoodPecker GUI successfully installed
echo:
:end_of_file
pause