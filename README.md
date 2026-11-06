![xcodebuild](https://github.com/TUM-Dev/campus_flutter/actions/workflows/deploy_beta.yml/badge.svg?branch=development)
![xcodebuild](https://github.com/TUM-Dev/campus_flutter/actions/workflows/deploy_web.yml/badge.svg?branch=development)
<a href="https://testflight.apple.com/join/4Ddi6f2f">
<img src="https://developer.apple.com/assets/elements/icons/testflight/testflight-64x64_2x.png" height="42" align="right">
</a>
<!---
<a href="https://itunes.apple.com/us/app/tum-campus-app/id1217412716?mt=8">
<img src="https://devimages-cdn.apple.com/app-store/marketing/guidelines/images/badge-download-on-the-app-store.svg" height="42" align="right">
</a>
--->

# TUM Campus App - An Unofficial Guide Through University Life

The TUM Campus App (TCA) is an open source project, developed by volunteers. This repository is dedicated to the development and transition to Flutter. 

The application mostly targets phones, but can also be used on tablet and Macs. We currently support iOS, iPadOS, macOS and Android.

## Features

- [x] Calendar Access
- [x] Lecture Details
- [x] Grades
- [x] Tuition Fees Information
- [x] Study Room Availability
- [x] Cafeteria Menus
- [x] Room Maps
- [x] Universal Search: Room
- [x] [TUM.sexy](https://tum.sexy) Redirects

<!--
## Screenshots

| | | | |
|-|-|-|-|
|![Simulator Screen Shot - iPhone 12 Pro Max - 2021-01-11 at 03 07 47](https://user-images.githubusercontent.com/7985149/107104416-d9125980-6821-11eb-8c06-bc26512e65fb.png)|![Simulator Screen Shot - iPhone 12 Pro Max - 2021-01-11 at 03 08 14](https://user-images.githubusercontent.com/7985149/107104419-da438680-6821-11eb-83ad-d0cd16c3fe33.png)|![Simulator Screen Shot - iPhone 12 Pro Max - 2021-01-11 at 03 09 44](https://user-images.githubusercontent.com/7985149/107104428-e3345800-6821-11eb-9169-7e76459a096c.png)|![Simulator Screen Shot - iPhone 12 Pro Max - 2021-01-11 at 03 09 51](https://user-images.githubusercontent.com/7985149/107104433-e7f90c00-6821-11eb-8e2b-42d21b2ced66.png)|
-->

<!--
## Contributing
You're welcome to contribute to this app!
Check out our detailed information at [CONTRIBUTING.md](https://github.com/TCA-Team/iOS/blob/master/CONTRIBUTING.md)!
-->

## Beta
If you want to participate in the beta of this app, enter your details [here](https://testflight.apple.com/join/4Ddi6f2f) to get invited via TestFlight or [here](https://play.google.com/store/apps/details?id=de.tum.in.tumcampus) on your Android device or [here](https://play.google.com/apps/testing/de.tum.in.tumcampus) in your browser to get invited via the Google Play Beta Program. We would appreciate your feedback regarding bugs and improvement suggestions!

## Policies
- [Privacy policy](https://app.tum.de/landing/privacy/)

## Support
You can reach us on [GitHub](https://github.com/TUM-Dev/campus_flutter) or via E-Mail [app@tum.de](mailto:app@tum.de)

## Development

This project uses Flutter **3.47.7** with Dart **3.13.5**, matching CI. Android CI uses **JDK 21** (AGP 9.3.1 / Gradle 9.7.0 / Kotlin 2.4.21, using built-in Kotlin). The Runner iOS target requires **iOS 18.0**. All native iOS plugins use Swift Package Manager; CocoaPods is no longer required.

To develop this project, you need these dependencies installed. If you have any problems with any of the steps below, please open an issue.
Please refer to the respective installation instructions:

| Dependency                               | Usage                                    | where to download it                         |
|------------------------------------------|------------------------------------------|----------------------------------------------|
| `Flutter` (includes the `Dart` compiler) | SDK to develop this app                  | https://docs.flutter.dev/get-started/install |

### Installing and upgrading dependencies

```bash
flutter pub get
dart run build_runner build
flutter analyze
flutter test
```

For iOS, open `ios/Runner.xcworkspace`. After a clean checkout, run
`flutter build ios --config-only --no-codesign` before building directly in
Xcode or Fastlane so Flutter configures Swift packages for the app's deployment
target. `flutter build ios` handles this configuration automatically.

For Android on macOS, install the versioned Homebrew JDK and select it in Flutter:

```bash
brew install openjdk@21
export JAVA_HOME="$(brew --prefix openjdk@21)/libexec/openjdk.jdk/Contents/Home"
flutter config --jdk-dir="$JAVA_HOME"
(cd android && ./gradlew --version)
```

The project pins the Gradle daemon and Kotlin/Java compiler toolchain to Java 21;
CI installs Java 21 as well. In Android Studio, use the same JDK for **Gradle JDK**.
The app's Java/Kotlin bytecode target is 21. Gradle's reported embedded Kotlin
version is separate from the Android Kotlin plugin version in
`android/settings.gradle.kts`.

Use the checked-in `android/gradlew` wrapper; a global Homebrew Gradle installation
is not required. The wrapper pins Gradle and verifies its distribution checksum.
Check `flutter doctor -v` and `(cd android && ./gradlew --version)` when diagnosing
Java mismatches. After changing Java versions, `(cd android && ./gradlew --stop)`
can stop old daemons before rebuilding.

Keep Gradle, AGP, Kotlin, and Java compatible when upgrading:
[Kotlin compatibility matrix](https://kotlinlang.org/docs/gradle-configure-project.html),
[AGP compatibility](https://developer.android.com/build/releases/about-agp), and
[Gradle Java compatibility](https://docs.gradle.org/current/userguide/compatibility.html).
Flutter 3.47 still needs `android.newDsl=false`; retain this compatibility setting
until the Flutter SDK and all plugins support the new AGP DSL.

When upgrading Flutter, update the SDK constraints in `pubspec.yaml` and the
Flutter version in all three CI workflows together. Run `flutter pub outdated`
to distinguish compatible updates from versions blocked by the SDK or forks.
The `meta` override remains necessary because the caching gRPC fork pins an
older version. Remove it when the fork relaxes its constraint.

### Updating the `.proto` files

To update the generated stubs for the Campus, you need protoc installed, then activte it in dart and then you can generate the new client

```bash
dart pub global activate protoc_plugin
export PATH="$PATH:$HOME/.pub-cache/bin"
curl -o protos/tumdev/campus_backend.proto https://raw.githubusercontent.com/TUM-Dev/Campus-Backend/main/server/api/tumdev/campus_backend.proto
protoc --dart_out=grpc:lib/base/networking/apis -I./protos google/protobuf/timestamp.proto google/protobuf/empty.proto tumdev/campus_backend.proto 
```

### Currently needed Forks

To ensure that campus_flutter runs on every supported platform, we need to make some modifications to packages.

| Package         | Reason                              | Link                                            |
|-----------------|-------------------------------------|-------------------------------------------------|
| gRPC            | Caching                             | https://github.com/jakobkoerber/grpc-dart       |
| Xml2Json        | Fix Parsing of XML to JSON          | https://github.com/jakobkoerber/xml2json        |
| flutter_linkify | Fix Selection Menu and Text Scaling | https://github.com/jakobkoerber/flutter_linkify |
| device_calendar | Swift Package Manager support | https://github.com/jakobkoerber/device_calendar |



