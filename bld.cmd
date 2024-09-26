SetLocal

mkdir arm64
mkdir arm64ec_ok
mkdir arm64ec_bad

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd %~dp0\arm64
call :F1 %~dp0 arm64 middle.exp || goto :eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd %~dp0arm64ec_bad
set _CL_=/arm64EC
call :F1 %~dp0 arm64ec middle.exp || goto :eof

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd %~dp0arm64ec_ok
call :F1 %~dp0 arm64ec /def:%~dp0middle.def || goto :eof

goto :eof

:F1
echo.>middle.c
call \clarm64 link /lib /def:%1\middle.def /out:middle.lib /machine:%2 || goto :eof
call \clarm64 cl /Z7 /MD /LD %1\leaf.c /link /noentry msvcrt.lib ucrt.lib vcruntime.lib kernel32.lib || goto :eof
call \clarm64 cl /Z7 /MD /LD middle.c /link /noentry %3 leaf.lib /delayload:leaf.dll delayimp.lib msvcrt.lib ucrt.lib kernel32.lib || goto :eof
call \clarm64 cl /Z7 /MD     %1\exe.c /link middle.lib || goto :eof
