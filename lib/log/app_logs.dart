import '../logcolor/log_color.dart';

/// A utility class for logging messages with different severity levels.
class AppLogs {
  /// A flag indicating whether logging is enabled or not.
  static bool printHandle = false;

  /// Logs a message with the specified [text] and [fileName].
  ///
  /// If [printHandle] is true, no log message is printed.
  /// Otherwise, the message is printed in magenta color.
  ///
  /// If [fileName] is provided, it is printed as part of the log message.
  static void logMessage({
    String? fileName,
    String? text,
  }) {
    if (printHandle) {
      return;
    }
    print(
      "[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${text.toString()}",
    );
    print(
      "[${LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${fileName ?? ""}",
    );
  }

  /// Logs an error message with the specified [error], [stackTrace], [text], and [fileName].
  ///
  /// If [printHandle] is true, no log message is printed.
  /// Otherwise, the message is printed in magenta color, error in yellow, and stack trace in yellow.
  ///
  /// If [fileName] is provided, it is printed as part of the log message.
  static void logError({
    String? fileName,
    String? error,
    StackTrace? stackTrace,
    String? text,
  }) {
    if (printHandle) {
      return;
    }
    print(
      "[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${LogColors.yellow.value} ${text.toString()} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${LogColors.blue.value} ${fileName ?? ""} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG ERROR MESSAGE ${LogColors.reset.value}] ${LogColors.yellow.value} ${error.toString()} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG STACKTRACE MESSAGE ${LogColors.reset.value}] ${LogColors.yellow.value} ${stackTrace.toString()} ${LogColors.reset.value}",
    );
  }

  /// Logs a warning message with the specified [error], [stackTrace], [text], and [fileName].
  ///
  /// If [printHandle] is true, no log message is printed.
  /// Otherwise, the message is printed in magenta color, warning in red, and stack trace in red.
  ///
  /// If [fileName] is provided, it is printed as part of the log message.
  static void logWarning({
    String? fileName,
    String? error,
    StackTrace? stackTrace,
    String? text,
  }) {
    if (printHandle) {
      return;
    }
    print(
      "[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${LogColors.red.value} ${text.toString()} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${LogColors.blue.value} ${fileName ?? ""} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG ERROR MESSAGE ${LogColors.reset.value}] ${LogColors.red.value} ${error.toString()} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG STACKTRACE MESSAGE ${LogColors.reset.value}] ${LogColors.red.value} ${stackTrace.toString()} ${LogColors.reset.value}",
    );
  }

  /// Logs a success message with the specified [text] and [fileName].
  ///
  /// If [printHandle] is true, no log message is printed.
  /// Otherwise, the message is printed in magenta color, success in green.
  ///
  /// If [fileName] is provided, it is printed as part of the log message.
  static void logSuccess({
    String? fileName,
    String? text,
  }) {
    if (printHandle) {
      return;
    }
    print(
      "[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${LogColors.green.value} ${text.toString()} ${LogColors.reset.value}",
    );
    print(
      "[${LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${LogColors.blue.value} ${fileName ?? ""} ${LogColors.reset.value}",
    );
  }
}


/// An extension on [Object] to add logging methods for convenience.
extension ErrorLogs on Object {
  /// Logs a message with the specified [text] and [fileName].
  ///
  /// The log message is associated with the runtime type of the object.
  void logMessage({String? text, String? fileName}) {
    AppLogs().logMessage(fileName: runtimeType.toString(), text: text);
  }

  /// Logs an error with the specified [error], [text], [stackTrace], and [fileName].
  ///
  /// The error message is associated with the runtime type of the object.
  void logError({
    String? error,
    String? text,
    StackTrace? stackTrace,
    String? fileName,
  }) {
    AppLogs().logError(
      fileName: runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
      text: text,
    );
  }

  /// Logs a success message with the specified [text] and [fileName].
  ///
  /// The success message is associated with the runtime type of the object.
  void logSuccess({String? text, String? fileName}) {
    AppLogs().logMessage(fileName: runtimeType.toString(), text: text);
  }

  /// Logs a warning with the specified [error], [text], [stackTrace], and [fileName].
  ///
  /// The warning message is associated with the runtime type of the object.
  void logWarning({
    String? error,
    String? text,
    StackTrace? stackTrace,
    String? fileName,
  }) {
    AppLogs().logWarning(
      fileName: runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
      text: text,
    );
  }
}