@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  spartak startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and SPARTAK_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\spartak-1.0-DEVELOPMENT.jar;%APP_HOME%\lib\ktor-server-tomcat-jvm-2.2.2.jar;%APP_HOME%\lib\exposed-dao-0.40.1.jar;%APP_HOME%\lib\exposed-jdbc-0.40.1.jar;%APP_HOME%\lib\ktor-client-cio-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-client-jackson-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-client-json-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-client-core-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-server-content-negotiation-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-server-cors-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-server-servlet-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-server-host-common-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-server-core-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-serialization-gson-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-serialization-kotlinx-json-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-events-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-websocket-serialization-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-http-cio-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-serialization-kotlinx-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-serialization-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-websockets-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-http-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-network-tls-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-network-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-utils-jvm-2.2.2.jar;%APP_HOME%\lib\ktor-io-jvm-2.2.2.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.6.4.jar;%APP_HOME%\lib\exposed-core-0.40.1.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.6.4.jar;%APP_HOME%\lib\kotlinx-coroutines-slf4j-1.6.4.jar;%APP_HOME%\lib\kotlinx-serialization-json-jvm-1.4.1.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.4.1.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.8.0.jar;%APP_HOME%\lib\postgresql-42.1.4.jar;%APP_HOME%\lib\HikariCP-5.0.1.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.8.0.jar;%APP_HOME%\lib\jackson-databind-2.14.1.jar;%APP_HOME%\lib\jackson-annotations-2.14.1.jar;%APP_HOME%\lib\jackson-core-2.14.1.jar;%APP_HOME%\lib\jackson-module-kotlin-2.14.1.jar;%APP_HOME%\lib\kotlin-reflect-1.7.22.jar;%APP_HOME%\lib\kotlin-stdlib-1.8.0.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\tomcat-catalina-9.0.70.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.70.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.8.0.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\config-1.4.2.jar;%APP_HOME%\lib\jansi-2.4.0.jar;%APP_HOME%\lib\gson-2.10.jar;%APP_HOME%\lib\tomcat-jsp-api-9.0.70.jar;%APP_HOME%\lib\tomcat-util-scan-9.0.70.jar;%APP_HOME%\lib\tomcat-api-9.0.70.jar;%APP_HOME%\lib\tomcat-coyote-9.0.70.jar;%APP_HOME%\lib\tomcat-servlet-api-9.0.70.jar;%APP_HOME%\lib\tomcat-util-9.0.70.jar;%APP_HOME%\lib\tomcat-juli-9.0.70.jar;%APP_HOME%\lib\tomcat-annotations-api-9.0.70.jar;%APP_HOME%\lib\tomcat-jni-9.0.70.jar;%APP_HOME%\lib\tomcat-jaspic-api-9.0.70.jar;%APP_HOME%\lib\tomcat-el-api-9.0.70.jar


@rem Execute spartak
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SPARTAK_OPTS%  -classpath "%CLASSPATH%" io.ktor.server.tomcat.EngineMain %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable SPARTAK_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%SPARTAK_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
