# BoostGaurdian release build

## 1. Generate a release keystore

Keep the keystore outside the source tree and back it up securely.

Example:

    keytool -genkeypair -v \
      -keystore boostgaurdian-release.jks \
      -alias boostgaurdian \
      -keyalg RSA -keysize 4096 \
      -validity 10000

## 2. Configure signing environment variables

Linux/macOS:

    export BOOSTGUARDIAN_KEYSTORE="/absolute/path/boostgaurdian-release.jks"
    export BOOSTGUARDIAN_KEYSTORE_PASSWORD="your-keystore-password"
    export BOOSTGUARDIAN_KEY_ALIAS="boostgaurdian"
    export BOOSTGUARDIAN_KEY_PASSWORD="your-key-password"

Windows PowerShell:

    $env:BOOSTGUARDIAN_KEYSTORE="C:\path\boostgaurdian-release.jks"
    $env:BOOSTGUARDIAN_KEYSTORE_PASSWORD="your-keystore-password"
    $env:BOOSTGUARDIAN_KEY_ALIAS="boostgaurdian"
    $env:BOOSTGUARDIAN_KEY_PASSWORD="your-key-password"

## 3. Build

    ./gradlew assembleRelease

Windows:

    gradlew.bat assembleRelease

APK:

    app/build/outputs/apk/release/app-release.apk

## Security

Never commit the `.jks` file or signing passwords. The build script intentionally reads
signing credentials from environment variables instead of putting secrets in source control.

The Gradle wrapper uses Gradle 8.10.2, compatible with the Android Gradle Plugin version
used by this project.

## Wrapper note

`gradle-wrapper.properties` and launcher scripts are included. The binary
`gradle-wrapper.jar` is not fabricated or embedded by this generated project; Android
Studio/Gradle can generate it with `gradle wrapper`, or an existing Gradle installation
can be used once to populate `gradle/wrapper/gradle-wrapper.jar`.
