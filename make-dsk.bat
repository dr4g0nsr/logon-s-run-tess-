echo DUMMY >output\tess2C00.pck
echo DUMMY >output\tessC000.pck

tools\sjasmplus.exe --lst=output\tess.lst --sym=output\tess.sym tess.z80
if %errorlevel% neq 0 pause

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

copy /B /Y output\tess0000.bin+output\tess8000.bin+output\tessE000.bin tools\a.bin
cd tools
exomizer raw a.bin
exoopt a.out a.pck
cd ..
copy /B /Y tools\a.pck output\tess.pck

tools\sjasmplus.exe --lst=output\dsk.lst --sym=output\dsk.sym dsk.z80
if %errorlevel% neq 0  pause

cd output
..\tools\cpcfs.exe "..\tess.dsk" d "229:logon's.bak"
..\tools\cpcfs.exe "..\tess.dsk" d "229:logon's."
..\tools\cpcfs.exe "..\tess.dsk" d "logon's."
..\tools\cpcfs.exe "..\tess.dsk" p "logon's." -b
cd ..
