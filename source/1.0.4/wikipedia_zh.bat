@echo off
title ά���ٿ�
color 0A

::��ʾkiwix server��ַ
echo �������� ά���ٿ�... ...
echo.
echo �������������������������µ�ַ����ά���ٿƣ�
for /f "tokens=2 delims=:(" %%s in ('ipconfig /all ^| findstr /i "ipv4"') do @echo Kiwix��ַ:%%s
echo.
echo ����رմ˴��ڣ�����

::ȡ��data�ļ���������zim�ļ����ļ���
setlocal enabledelayedexpansion
for %%j in (data\*.zim) do set k=!k! %%j
setlocal disabledelayedexpansion

::����Ĭ�������
start http://localhost

::����û������������kiwix-serve���񲢰󶨵��û����������
::���û��ر��������kiwix-serve���񴰿ڻ��Զ��ر�
for %%i in (360se,360chrome,chrome,firefox,msedge,iexplore) do (
	for /f "tokens=2" %%a in ('tasklist /FI "imagename EQ %%i.exe" /NH') do (
	echo %%a | findstr "[0-9]">nul && bin\kiwix-serve.exe -a %%a -d -i 0.0.0.0 %k% && goto END
)
)
:END