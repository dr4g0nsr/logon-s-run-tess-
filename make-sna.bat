echo DUMMY >output\tess2C00.pck
echo DUMMY >output\tessC000.pck

tools\sjasmplus.exe --lst=output\tess.lst --sym=output\tess.sym tess.z80
if %errorlevel% neq 0 pause
rem exit /b %errorlevel%

copy /B /Y output\tessC000.bin tools\a.bin
cd tools
exomizer raw a.bin
exoopt a.out a.pck
cd ..
copy /B /Y tools\a.pck output\tessC000.pck

copy /B /Y output\tess2C00.bin tools\a.bin
cd tools
exomizer raw a.bin
exoopt a.out a.pck
cd ..
copy /B /Y tools\a.pck output\tess2C00.pck

tools\sjasmplus.exe --lst=output\tess.lst --sym=output\tess.sym tess.z80
if %errorlevel% neq 0 pause

tools\createsnapshot.exe tess.sna -c tess.cfg