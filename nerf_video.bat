@echo off

rem Get the file path of the dropped file
set filepath=%~1

rem Set the root_folder variable as the root folder of the dropped file
set root_folder=%~dp1

rem Prompt the user for the FPS value
set /p fps=Enter FPS value: 

rem Call the Python script, passing the file path as an argument
python "%~dp0\scripts\colmap2nerf.py" --video_in "%filepath%" --video_fps %fps% --run_colmap --aabb_scale 16

rem Call the instant-ngp GUI and pass the transforms file for dataset training
%~dp0\instant-ngp.exe %root_folder%\transforms.json

rem keep the command window open
cmd /k