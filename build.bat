@echo off

:=====================================================
:���ݒ�
:=====================================================
:�����C��
set R=[31;1m
set Y=[33;1m
set BACK_B=[44m
set BACK_C=[46m
set DEF=[0m

:�r���h�p���ϐ��ݒ�
set GOPATH=%CD%

:=====================================================
:�r���h�J�n
:=====================================================
cd %GOPATH%\src\main
go build
echo.
if not %errorlevel% == 0 (
  echo %R%Build Error%DEF%
  goto �I��
) else (
  echo %Y%Build Success%DEF%
)

:=====================================================
:���`���C���X�g�[��
:=====================================================
go install

:=====================================================
:���s
:=====================================================
echo.
echo %BACK_C%             ---- run result start ----                     %BACK_B%
%GOPATH%\bin\main.exe
echo %DEF%
echo %BACK_C%             ---- run result end   ----                     %DEF%

:=====================================================
:�I��
:=====================================================
echo.
echo.

:����
setlocal
set /p answer="�Ď��s���܂����H (Y/n/f:���`) : %answer%"
if /I "%answer%" == "N" (
  exit 0
) else if /I "%answer%" == "F" (
  endlocal
  go fmt
  goto ����
) else (
  endlocal
  cls
  goto �r���h�J�n
)
