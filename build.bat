@echo off

:=====================================================
:環境設定
:=====================================================
:文字修飾
set R=[31;1m
set Y=[33;1m
set BACK_B=[44m
set BACK_C=[46m
set DEF=[0m

:ビルド用環境変数設定
set GOPATH=%CD%

:=====================================================
:ビルド開始
:=====================================================
cd %GOPATH%\src\main
go install
echo.
if not %errorlevel% == 0 (
  echo %R%Build Error%DEF%
  goto 終了
) else (
  echo %Y%Build Success%DEF%
)

:=====================================================
:実行
:=====================================================
echo.
echo %BACK_C%             ---- program start ----                     %BACK_B%
%GOPATH%\bin\main.exe
echo %DEF%
echo %BACK_C%             ---- program end   ----                     %DEF%

:=====================================================
:終了
:=====================================================
echo.
echo.

:質問
setlocal
set /p answer="再実行しますか？ (Y/n/f:整形) : %answer%"
if /I "%answer%" == "N" (
  exit 0
) else if /I "%answer%" == "F" (
  endlocal
  go fmt
  goto 質問
) else (
  endlocal
  cls
  goto ビルド開始
)
