# GitHub Actions build instructions

The repository now contains two workflows:

- `.github/workflows/android-build.yml` — builds a debug APK on pushes, pull requests, and manual runs.
- `.github/workflows/android-release.yml` — builds a signed release APK on a version tag or manual run.

## Debug APK

Push the repository to GitHub. The **Android Build** workflow will run automatically.

The resulting `app-debug.apk` is uploaded as a workflow artifact.

## Release signing secrets

For signed releases, add these repository Actions secrets under:

`Settings -> Secrets and variables -> Actions`

Required secrets:

- `BOOSTGUARDIAN_KEYSTORE_B64`
- `BOOSTGUARDIAN_KEYSTORE_PASSWORD`
- `BOOSTGUARDIAN_KEY_ALIAS`
- `BOOSTGUARDIAN_KEY_PASSWORD`

`BOOSTGUARDIAN_KEYSTORE_B64` should contain the Base64 representation of your `.jks`
file. Do not commit the keystore itself.

Example on Linux/macOS:

    base64 -w 0 boostgaurdian-release.jks > keystore.b64

On macOS, if `-w` is unavailable:

    base64 boostgaurdian-release.jks | tr -d '\n' > keystore.b64

Copy the resulting single-line value into the GitHub secret.

## Create a release

After configuring the secrets, create and push a version tag, for example:

    git tag v0.1.0
    git push origin v0.1.0

GitHub Actions will build the signed APK and attach it to the GitHub Release.

You can also start `Android Release` manually from the Actions tab.

## Security

Signing credentials are supplied to Gradle only through GitHub Actions secrets.
The keystore is decoded into the runner's temporary directory and is not committed
to the repository.

The Telegram bot token is application configuration and should not be hard-coded
into source code. Configure it through the application's local settings.
