# BoostGaurdian

Package/application ID: `io.boostgaurdian`

This is a transparent Android starter project for a user-authorized remote-administration utility.

## Included

- Persistent foreground-service notification.
- Local settings for Telegram bot token and authorized user/chat ID.
- Start-at-boot setting.
- Enable/disable setting.
- Android notification-listener access entry point.
- Basic device status collection (battery and active network).
- Telegram client foundation.
- Boot receiver.

## Deliberately excluded

This starter does **not** implement remote acquisition of:

- SMS/MMS/RCS contents
- Call logs
- Screenshots
- Screen recordings
- Camera images/video
- Microphone recordings

Those capabilities can create a covert-surveillance tool when remotely triggered through a bot. A production implementation should keep any sensitive capture explicitly user-mediated and use Android's own authorization/indicator mechanisms.

## Build

Open the project in Android Studio with a current Android SDK and allow Gradle to sync.

The project targets SDK 35 and uses:
- Android Gradle Plugin 8.6.1
- Kotlin 2.0.21

Before production use, add secure secret storage rather than keeping the Telegram bot token in ordinary SharedPreferences, and implement Telegram update polling with strict allow-list validation, replay protection, rate limiting, and an auditable local event log.

## Telegram command boundary

The intended initial command surface is:

- `/help`
- `/status`

Sensitive commands should require a visible local confirmation workflow rather than silently executing from Telegram.
