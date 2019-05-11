@echo off
for /f "tokens=2 delims=\" %%i in ('whoami') do set curuser=%%i
for /f "tokens=15" %%i in ('ipconfig /all ^| find /i "IP Address"') do set ip3=%%i
for /f "tokens=16 delims=( " %%i in ('ipconfig /all ^| find /i "IPv4"') do set ip=%%i
for /f "tokens=4 delims=: " %%i in ('netstat -n^|find ":3389"') do set cip=%%i
ECHO NameSpace = "http://schemas.microsoft.com/cdo/configuration/" >logininfo.vbs
ECHO Set Email = CreateObject("CDO.Message") >>logininfo.vbs
ECHO Email.From = "mailaccount@163.com" >>logininfo.vbs
ECHO Email.To = "receive@qq.com" >>logininfo.vbs
ECHO Email.Subject = "9号服务器有人登陆，请注意！！！" >>logininfo.vbs
ECHO Email.Textbody = "机器I P：%ip%%ip3%，登陆日期：%date:~0,10% %time:~0,-3%,客户端IP：%cip%" >>logininfo.vbs
ECHO With Email.Configuration.Fields >>logininfo.vbs
ECHO .Item(NameSpace^&"sendusing") = 2 >>logininfo.vbs
ECHO .Item(NameSpace^&"smtpserver") = "smtp.163.com" >>logininfo.vbs
ECHO .Item(NameSpace^&"smtpserverport") =25 >>logininfo.vbs
ECHO .Item(NameSpace^&"smtpauthenticate") = 1 >>logininfo.vbs
ECHO .Item(NameSpace^&"sendusername") = "mailaccount@163.com"  >>logininfo.vbs
ECHO .Item(NameSpace^&"sendpassword") = "mailpassword" >>logininfo.vbs
ECHO .Update >>logininfo.vbs
ECHO End With >>logininfo.vbs
ECHO Email.Send >>logininfo.vbs
wscript logininfo.vbs&&del /s /q logininfo.vbs>nul

