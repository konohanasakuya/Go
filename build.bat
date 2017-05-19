@echo off

:=====================================================
:ŠÂ‹«İ’è
:=====================================================
:•¶šCü
set R=[31;1m
set Y=[33;1m
set BACK_B=[44m
set BACK_C=[46m
set DEF=[0m

:ƒrƒ‹ƒh—pŠÂ‹«•Ï”İ’è
set GOPATH=%CD%

:=====================================================
:ƒrƒ‹ƒhŠJn
:=====================================================
cd %GOPATH%\src\main
go build
echo.
if not %errorlevel% == 0 (
  echo %R%Build Error%DEF%
  goto I—¹
) else (
  echo %Y%Build Success%DEF%
)

:=====================================================
:®Œ`•ƒCƒ“ƒXƒg[ƒ‹
:=====================================================
go install

:=====================================================
:Às
:=====================================================
echo.
echo %BACK_C%             ---- run result start ----                     %BACK_B%
%GOPATH%\bin\main.exe
echo %DEF%
echo %BACK_C%             ---- run result end   ----                     %DEF%

:=====================================================
:I—¹
:=====================================================
echo.
echo.

:¿–â
setlocal
set /p answer="ÄÀs‚µ‚Ü‚·‚©H (Y/n/f:®Œ`) : %answer%"
if /I "%answer%" == "N" (
  exit 0
) else if /I "%answer%" == "F" (
  endlocal
  go fmt
  goto ¿–â
) else (
  endlocal
  cls
  goto ƒrƒ‹ƒhŠJn
)
