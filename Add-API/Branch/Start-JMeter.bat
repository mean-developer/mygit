echo off
set JVM_ARGS=-Xmx1536m -Xms1024m -XX:MaxMetaspaceSize=128m

REM DO NOT use this script directly for performance testing, it is designed to be included into other scripts using Include Controller. 

REM Listed below are default properties for Login reusable script

REM Environment Properties - Start
SET JMETER_PROP=
REM SET JMETER_PROP=%JMETER_PROP% -Djmeter.protocol=https
REM SET JMETER_PROP=%JMETER_PROP% -Djmeter.serverName=www.bijib.in
REM SET JMETER_PROP=%JMETER_PROP% -Djmeter.serverPort=443
SET JMETER_PROP=%JMETER_PROP% -Djmeter.protocol=http
SET JMETER_PROP=%JMETER_PROP% -Djmeter.serverName=192.168.0.206
SET JMETER_PROP=%JMETER_PROP% -Djmeter.serverPort=80
SET JMETER_PROP=%JMETER_PROP% -Djmeter.dataFile=..\data\master-data.csv
SET JMETER_PROP=%JMETER_PROP% -Djmeter.loginPath=..\Login\scripts\instant-token.jmx
REM Environment Properties - End

REM Performance Properties - Start
SET JMETER_PROP=%JMETER_PROP% -Djmeter.users=1
SET JMETER_PROP=%JMETER_PROP% -Djmeter.duration=1
SET JMETER_PROP=%JMETER_PROP% -Djmeter.startupDelay=1
SET JMETER_PROP=%JMETER_PROP% -Djmeter.rampup=1
SET JMETER_PROP=%JMETER_PROP% -Djmeter.randomDelay=0
SET JMETER_PROP=%JMETER_PROP% -Djmeter.constantDelay=0
SET JMETER_PROP=%JMETER_PROP% -Djmeter.basedir=../../..
SET JMETER_PROP=%JMETER_PROP% -Djmeter.loopCount=1
REM SET JMETER_PROP=%JMETER_PROP% -Djmeter.dataFile=..\data\master-data.csv
SET JMETER_PROP=%JMETER_PROP% -Djmeter.debug=false
REM Performance Properties - End

REM Application Properties - Start
SET JMETER_PROP=%JMETER_PROP% -Djmeter.userSessionLoopCount=1
REM Application Properties - End

echo %JMETER_PROP% 

call %JMETER_HOME%\bin\jmeter.bat -t "scripts\add-branch.jmx" %JMETER_PROP%