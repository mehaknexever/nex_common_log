import 'package:flutter/foundation.dart';

import '../logcolor/log_color.dart';

/// A utility class for logging messages with different severity levels.
class AppLogs {
  /// A list of screen names for which logs should be printed.
  /// If this list is not empty, only logs for the specified screens will be printed.
  static List<String> screens = [];

  /// A flag indicating whether logging is enabled or not.
  /// If true, no log messages will be printed.
  static bool printHandle = false;

  /// Logs a message with the specified [text] and [fileName].
  ///
  /// This method handles logging of messages with optional color formatting for the text and file name.
  /// It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [fileName] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [text] (`String?`): The text of the log message. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is white.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is white.
  ///
  /// The method will:
  /// - Return immediately if [printHandle] is true, meaning no logging will occur.
  /// - Check if [AppLogs.screens] is not empty and if [fileName] is not included in [AppLogs.screens], it will return without logging.
  /// - Print the log message and file name with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// logMessage(
  ///   fileName: "example.dart",
  ///   text: "This is a log message.",
  ///   msgColor: LogColors.green,
  ///   textColor: LogColors.blue,
  ///   fileNameColor: LogColors.yellow,
  /// );
  /// ```
  ///
  /// This will print:
  /// ```
  /// [32 LOG MESSAGE 0] 34 This is a log message. 0
  /// [32 LOG FILE NAME MESSAGE 0] 33 example.dart 0
  /// ```
  /// Where `32` represents the color code for green, `34` for blue, `33` for yellow, and `0` for reset.
  ///
  /// Notes:
  /// - The [LogColors] enum should be predefined with appropriate color codes for use in log messages.
  /// - The [printHandle] variable should be a boolean value indicating whether to handle print operations.
  /// - The [AppLogs.screens] should be a collection (e.g., a list) that may contain specific file names to be included in the logs.
  static void logMessage({
    String? fileName,
    String? text,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(fileName)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${msgColor?.value ?? LogColors.white.value} ${text.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${fileNameColor?.value ?? LogColors.white.value} ${fileName ?? ""} ${LogColors.reset.value}",
      );
    }
  }

  /// Logs an error message with the specified [error], [text], [fileName], and [stackTrace].
  ///
  /// This method handles logging of error messages with optional color formatting for the text, error message,
  /// file name, and stack trace. It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [fileName] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [error] (`String?`): The error message to log. This parameter is optional.
  /// - [stackTrace] (`StackTrace?`): The stack trace associated with the error. This parameter is optional.
  /// - [text] (`String?`): Additional text to include in the log message. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is yellow.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is blue.
  /// - [errorColor] (`LogColors?`): The color to use for the error message part of the log message. If not provided, the default color is yellow.
  /// - [stackTraceColor] (`LogColors?`): The color to use for the stack trace part of the log message. If not provided, the default color is yellow.
  ///
  /// The method will:
  /// - Return immediately if [printHandle] is true, meaning no logging will occur.
  /// - Check if [AppLogs.screens] is not empty and if [fileName] is not included in [AppLogs.screens], it will return without logging.
  /// - Print the log message, error message, file name, and stack trace with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// logError(
  ///   fileName: "example.dart",
  ///   error: "An unexpected error occurred.",
  ///   stackTrace: StackTrace.current,
  ///   text: "This is additional information.",
  ///   msgColor: LogColors.red,
  ///   textColor: LogColors.blue,
  ///   fileNameColor: LogColors.green,
  ///   errorColor: LogColors.yellow,
  ///   stackTraceColor: LogColors.cyan,
  /// );
  /// ```
  ///
  /// This will print:
  /// ```
  /// [31 LOG FILE NAME MESSAGE 0] 32 example.dart 0
  /// [31 LOG MESSAGE 0] 34 This is additional information. 0
  /// [31 LOG ERROR MESSAGE 0] 33 An unexpected error occurred. 0
  /// [31 LOG STACKTRACE MESSAGE 0] 36 #0 ...
  /// ```
  /// Where `31` represents the color code for red, `32` for green, `34` for blue, `33` for yellow, `36` for cyan, and `0` for reset.
  ///
  /// Notes:
  /// - The [LogColors] enum should be predefined with appropriate color codes for use in log messages.
  /// - The [printHandle] variable should be a boolean value indicating whether to handle print operations.
  /// - The [AppLogs.screens] should be a collection (e.g., a list) that may contain specific file names to be included in the logs.
  static void logError({
    String? fileName,
    String? error,
    StackTrace? stackTrace,
    String? text,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
    LogColors? errorColor,
    LogColors? stackTraceColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(fileName)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${fileNameColor?.value ?? LogColors.blue.value} ${fileName ?? ""} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${textColor?.value ?? LogColors.yellow.value} ${text.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG ERROR MESSAGE ${LogColors.reset.value}] ${errorColor?.value ?? LogColors.yellow.value} ${error.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG STACKTRACE MESSAGE ${LogColors.reset.value}] ${stackTraceColor?.value ?? LogColors.yellow.value} ${stackTrace.toString()} ${LogColors.reset.value}",
      );
    }
  }

  /// Logs a warning message with the specified [error], [text], [fileName], and [stackTrace].
  ///
  /// This method handles logging of warning messages with optional color formatting for the text, error message,
  /// file name, and stack trace. It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [fileName] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [error] (`String?`): The error message to log. This parameter is optional.
  /// - [stackTrace] (`StackTrace?`): The stack trace associated with the error. This parameter is optional.
  /// - [text] (`String?`): Additional text to include in the log message. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is red.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is blue.
  /// - [errorColor] (`LogColors?`): The color to use for the error message part of the log message. If not provided, the default color is red.
  /// - [stackTraceColor] (`LogColors?`): The color to use for the stack trace part of the log message. If not provided, the default color is red.
  ///
  /// The method will:
  /// - Return immediately if [printHandle] is true, meaning no logging will occur.
  /// - Check if [AppLogs.screens] is not empty and if [fileName] is not included in [AppLogs.screens], it will return without logging.
  /// - Print the log message, error message, file name, and stack trace with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// logWarning(
  ///   fileName: "example.dart",
  ///   error: "This is a warning message.",
  ///   stackTrace: StackTrace.current,
  ///   text: "This is additional information.",
  ///   msgColor: LogColors.orange,
  ///   textColor: LogColors.blue,
  ///   fileNameColor: LogColors.green,
  ///   errorColor: LogColors.yellow,
  ///   stackTraceColor: LogColors.cyan,
  /// );
  /// ```
  ///
  /// This will print:
  /// ```
  /// [35 LOG FILE NAME MESSAGE 0] 32 example.dart 0
  /// [35 LOG MESSAGE 0] 31 This is additional information. 0
  /// [35 LOG ERROR MESSAGE 0] 31 This is a warning message. 0
  /// [35 LOG STACKTRACE MESSAGE 0] 31 #0 ...
  /// ```
  /// Where `35` represents the color code for orange, `32` for green, `31` for red, and `0` for reset.
  ///
  /// Notes:
  /// - The [LogColors] enum should be predefined with appropriate color codes for use in log messages.
  /// - The [printHandle] variable should be a boolean value indicating whether to handle print operations.
  /// - The [AppLogs.screens] should be a collection (e.g., a list) that may contain specific file names to be included in the logs.
  static void logWarning({
    String? fileName,
    String? error,
    StackTrace? stackTrace,
    String? text,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
    LogColors? errorColor,
    LogColors? stackTraceColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(fileName)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${fileNameColor?.value ?? LogColors.blue.value} ${fileName ?? ""} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${textColor?.value ?? LogColors.red.value} ${text.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG ERROR MESSAGE ${LogColors.reset.value}] ${errorColor?.value ?? LogColors.red.value} ${error.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG STACKTRACE MESSAGE ${LogColors.reset.value}] ${stackTraceColor?.value ?? LogColors.red.value} ${stackTrace.toString()} ${LogColors.reset.value}",
      );
    }
  }

  /// Logs a success message with the specified [text] and [fileName].
  ///
  /// This method handles logging of success messages with optional color formatting for the text and file name.
  /// It respects the [printHandle] flag and only logs messages if certain conditions are met.
  ///
  /// Parameters:
  /// - [fileName] (`String?`): The name of the file to include in the log message. This parameter is optional.
  /// - [text] (`String?`): The text of the log message. This parameter is optional.
  /// - [msgColor] (`LogColors?`): The color to use for the main log message. If not provided, the default color is magenta.
  /// - [textColor] (`LogColors?`): The color to use for the text part of the log message. If not provided, the default color is green.
  /// - [fileNameColor] (`LogColors?`): The color to use for the file name part of the log message. If not provided, the default color is blue.
  ///
  /// The method will:
  /// - Return immediately if [printHandle] is true, meaning no logging will occur.
  /// - Check if [AppLogs.screens] is not empty and if [fileName] is not included in [AppLogs.screens], it will return without logging.
  /// - Print the log message and file name with specified or default colors.
  ///
  /// Example:
  /// ```dart
  /// logSuccess(
  ///   fileName: "example.dart",
  ///   text: "Operation completed successfully.",
  ///   msgColor: LogColors.magenta,
  ///   textColor: LogColors.green,
  ///   fileNameColor: LogColors.blue,
  /// );
  /// ```
  ///
  /// This will print:
  /// ```
  /// [35 LOG MESSAGE 0] 32 Operation completed successfully. 0
  /// [35 LOG FILE NAME MESSAGE 0] 34 example.dart 0
  /// ```
  /// Where `35` represents the color code for magenta, `32` for green, `34` for blue, and `0` for reset.
  ///
  /// Notes:
  /// - The [LogColors] enum should be predefined with appropriate color codes for use in log messages.
  /// - The [printHandle] variable should be a boolean value indicating whether to handle print operations.
  /// - The [AppLogs.screens] should be a collection (e.g., a list) that may contain specific file names to be included in the logs.
  static void logSuccess({
    String? fileName,
    String? text,
    LogColors? msgColor,
    LogColors? textColor,
    LogColors? fileNameColor,
  }) {
    if (printHandle) {
      return;
    }
    if (AppLogs.screens.isNotEmpty) {
      if (!AppLogs.screens.contains(fileName)) {
        return;
      }
    }
    if (kDebugMode) {
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${textColor?.value ?? LogColors.green.value} ${text.toString()} ${LogColors.reset.value}",
      );
      print(
        "[${msgColor?.value ?? LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${fileNameColor?.value ?? LogColors.blue.value} ${fileName ?? ""} ${LogColors.reset.value}",
      );
    }
  }
}

/// An extension on [Object] to add logging methods for convenience.
extension ErrorLogs on Object {
  /// Logs a message with the specified [text] and [fileName].
  ///
  /// The log message is associated with the runtime type of the object.
  void logMessage({String? text, String? fileName}) {
    AppLogs.logMessage(fileName: fileName, text: text);
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
    AppLogs.logError(
      fileName: fileName,
      error: error,
      stackTrace: stackTrace,
      text: text,
    );
  }

  /// Logs a success message with the specified [text] and [fileName].
  ///
  /// The success message is associated with the runtime type of the object.
  void logSuccess({String? text, String? fileName}) {
    AppLogs.logMessage(fileName: fileName, text: text);
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
    AppLogs.logWarning(
      fileName: fileName,
      error: error,
      stackTrace: stackTrace,
      text: text,
    );
  }
}
