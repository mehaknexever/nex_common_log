import '../logcolor/log_color.dart';

class AppLogs {
  static bool printHandle = false;

  static logMessage({
    String? fileName,
    String? text,
  }) {
    if(printHandle){
      return;
    }
    print(
      "[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${text.toString()}",
    );
    print(
      "[${LogColors.magenta.value} LOG FILE NAME MESSAGE ${LogColors.reset.value}] ${fileName ?? ""}",
    );
  }

  static logError({
    String? fileName,
    String? error,
    StackTrace? stackTrace,
    String? text,
  }) {
    if(printHandle){
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

  static logWarning({
    String? fileName,
    String? error,
    StackTrace? stackTrace,
    String? text,
  }) {
    if(printHandle){
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

  static logSuccess({
    String? fileName,
    String? text,
  }) {
    if(printHandle){
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
