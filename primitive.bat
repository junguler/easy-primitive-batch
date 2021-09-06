@echo off 
pushd "%~dp0"

set /p outExt="Output extension (jpg, png, svg, gif): "
set /p numShapes="Number of shapes: "
set /p setMode="Convert to (0=combo,1=triangle,2=rect,3=ellipse,4=circle,5=rotatedrect,6=beziers,7=rotatedellipse,8=polygon): "
set /p extraArgs="Extra arguments? (skip with inter): "

echo;
for %%G in ("in\*.*") do (
    echo Encoding "%%~G" ...
    primitive.exe -i "%%~G" -o "out\%%~nG.%outExt%" -n %numShapes% -m %setMode% %extraArgs% >nul 2>&1
)

echo;
echo Done! Press any key to continue ...
popd
exit >nul 2>&1