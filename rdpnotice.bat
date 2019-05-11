@echo off
for /f "tokens=2 delims=\" %%i in ('whoami') do set curuser=%%i
for /f "tokens=15" %%i in ('ipconfig /all ^| find /i "IP Address"') do set ip3=%%i
for /f "tokens=16 delims=( " %%i in ('ipconfig /all ^| find /i "IPv4"') do set ip=%%i
for /f "tokens=4 delims=: " %%i in ('netstat -n^|find ":16109"') do set cip=%%i
ECHO NameSpace = "http://schemas.microsoft.com/cdo/configuration/" >rdpnotice.vbs
ECHO Set Email = CreateObject("CDO.Message") >>rdpnotice.vbs
ECHO Email.From = "seclogininfo@163.com" >>rdpnotice.vbs
ECHO Email.To = "hdlbrjho@qq.com" >>rdpnotice.vbs
ECHO Email.Subject = "9号服务器有人登陆！！！" >>rdpnotice.vbs
ECHO Email.Textbody = "机器I P：%ip%%ip3%，登陆日期：%date:~0,10% %time:~0,-3%,客户端IP：%cip%" >>rdpnotice.vbs
ECHO With Email.Configuration.Fields >>rdpnotice.vbs
ECHO .Item(NameSpace^&"sendusing") = 2 >>rdpnotice.vbs
ECHO .Item(NameSpace^&"smtpserver") = "smtp.163.com" >>rdpnotice.vbs
ECHO .Item(NameSpace^&"smtpserverport") =25 >>rdpnotice.vbs
ECHO .Item(NameSpace^&"smtpauthenticate") = 1 >>rdpnotice.vbs
ECHO .Item(NameSpace^&"sendusername") = "seclogininfo@163.com"  >>rdpnotice.vbs
ECHO .Item(NameSpace^&"sendpassword") = "seclogininfo1!" >>rdpnotice.vbs
ECHO .Update >>rdpnotice.vbs
ECHO End With >>rdpnotice.vbs
ECHO Email.Send >>rdpnotice.vbs
wscript rdpnotice.vbs&&del /s /q rdpnotice.vbs>nul
