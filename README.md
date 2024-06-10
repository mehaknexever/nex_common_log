<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

The AppLogs library provides a utility class for logging messages with different severity levels. This class supports logging messages, errors, warnings, and successes with customizable color formatting. It also respects logging flags and conditions to control when and what to log.

## Features

- Conditional Logging: Control logging based on enabled flags and screen names.
- Color-Coded Logs: Customize the color of log messages for better readability.
- Extension Methods: Convenient methods for logging directly from any object.

## Getting started

Prerequisites
- Dart
- Flutter

Installation
Add the following dependency to your pubspec.yaml file:

```dart
dependencies:
flutter:
sdk: flutter
your_package_name: ^1.0.0

```


## Usage

```dart
import 'package:flutter/foundation.dart';
import 'path_to_log_color/log_color.dart';
import 'path_to_app_logs/app_logs.dart';

void main() {
  // Enable logging
  AppLogs.printHandle = false;

  // Log a message
  AppLogs.logMessage(
    fileName: "example.dart",
    text: "This is a log message.",
    msgColor: LogColors.green,
    textColor: LogColors.blue,
    fileNameColor: LogColors.yellow,
  );

  // Log an error
  AppLogs.logError(
    fileName: "example.dart",
    error: "An unexpected error occurred.",
    stackTrace: StackTrace.current,
    text: "This is additional information.",
    msgColor: LogColors.red,
    textColor: LogColors.blue,
    fileNameColor: LogColors.green,
    errorColor: LogColors.yellow,
    stackTraceColor: LogColors.cyan,
  );

  // Log a warning
  AppLogs.logWarning(
    fileName: "example.dart",
    error: "This is a warning message.",
    stackTrace: StackTrace.current,
    text: "This is additional information.",
    msgColor: LogColors.orange,
    textColor: LogColors.blue,
    fileNameColor: LogColors.green,
    errorColor: LogColors.yellow,
    stackTraceColor: LogColors.cyan,
  );

  // Log a success message
  AppLogs.logSuccess(
    fileName: "example.dart",
    text: "Operation completed successfully.",
    msgColor: LogColors.magenta,
    textColor: LogColors.green,
    fileNameColor: LogColors.blue,
  );
}
```


```dart
class MyClass {
  void performAction() {
    this.logMessage(text: "Performing an action.");
    try {
      // Simulate an error
      throw Exception("An error occurred.");
    } catch (e, stackTrace) {
      this.logError(error: e.toString(), stackTrace: stackTrace);
    }
    this.logWarning(text: "This is a warning.");
    this.logSuccess(text: "Action performed successfully.");
  }
}

void main() {
  final myObject = MyClass();
  myObject.performAction();
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
