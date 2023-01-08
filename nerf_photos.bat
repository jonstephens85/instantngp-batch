@echo off

rem Get the folder path of the dropped folder
set folderpath=%~1

rem Get parent folder of the images folder
for %%i in ("%~dp1") do set "parent_folder=%%~fi"

rem Call the colmap2nerf python script, passing the folder path as an argument
rem Modify --colmap_matcher to "sequential" if you images are taken in spatial sequence
python "%~dp0\scripts\colmap2nerf.py" --colmap_matcher exhaustive --run_colmap --aabb_scale 16 --images "%folderpath%"

rem Call the instant-ngp GUI and pass the transforms file for dataset training
%~dp0\instant-ngp.exe %parent_folder%\transforms.json

rem keep the command window open
cmd /k