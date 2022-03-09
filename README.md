# A WordPress client for Flutter 

For help getting started with Flutter, view Flutter online [documentation](https://flutter.io/).

To configure to build iOS apps follow instructions [here](https://docs.flutter.dev/deployment/ios).

## Steps

Clone repository.

Update `urWebsiteUrl` in `lib/src/config.dart` to your WordPress URL.

Open Terminal.

Run `flutter packages get` in your project folder.

Go to `ios/`.

Run `pod install`.

Run `open Runner.workspace` to open Xcode to configure your provisioning profile and build your app. See [here](https://docs.flutter.dev/deployment/ios).