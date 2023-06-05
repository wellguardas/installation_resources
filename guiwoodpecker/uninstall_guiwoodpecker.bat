@echo OFF

set installation_path="%USERPROFILE%\WellGuardGUI\"
set repo_path="%USERPROFILE%\WellGuardGUI\guiwoodpecker\"

::---------------------------------------------------------------------::
rem Set cwd to %USERPROFILE%\WellGuardGUI
::---------------------------------------------------------------------::
if exist %installation_path% (
	cd %installation_path%
)


::---------------------------------------------------------------------::
rem Delete repository
::---------------------------------------------------------------------::
if exist %repo_path% (
  echo Deleting repository (%repo_path%)
  echo:
  @RD /S /Q "guiwoodpecker"
)


::---------------------------------------------------------------------::
rem Remove Conda environment
::---------------------------------------------------------------------::
echo Removing Conda environment
set path_conda_bat="%USERPROFILE%\miniconda3\condabin\conda.bat"
call echo y | %path_conda_bat% remove --name guiwoodpecker --all


echo:
echo:
echo Successfully uninstalled WoodPecker GUI (guiwoodpecker)
echo:

:end_of_file
pause