\
    @ECHO OFF
    SET DIR=%~dp0
    IF "%JAVA_HOME%"=="" (
      SET JAVA_EXE=java.exe
    ) ELSE (
      SET JAVA_EXE=%JAVA_HOME%\bin\java.exe
    )
    "%JAVA_EXE%" %JAVA_OPTS% %GRADLE_OPTS% -classpath "%DIR%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
