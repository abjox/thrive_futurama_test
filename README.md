# Project Name: Thrive Futurama Test

This is a Flutter mobile application developed as code challenge for Thrive.

## Flutter Requirements

- Flutter: >=2.19.6 <3.0.0
- Android: >= Android 7 (API 24)
- iOS: >= 11.0

### How to build the app

1. Clone or download the project from the [GitHub](https://github.com/abjox/thrive_futurama_test.git).
2. Open the terminal or command prompt and navigate to the project directory.
3. Run the command `flutter pub get` to install the dependencies.
4. For iOS run command `flutter run ios -t lib/main_production.dart -d <your-device-id> --debug`.
5. For Android run command `flutter run -t lib/main_production.dart -d <your-device-id> --debug`.

### App Architecture

- For the majority of its functionality, the app adheres to *Redux* state management principles.
- The Quiz section of the app utilizes *ChangeNotifier* in conjunction with *Redux*, which serves as a demonstration of how the logic and layout code can be separated according to the requirements.

### Features
- Supports light/dark mode.
- Works in either screen orientation and handles screen rotation.
- Supports both phone and tablet screen sizes.
- Supports screen reader through Semantics.


