import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nex_common_logs/logcolor/log_color.dart';
import 'package:nex_common_logs/log/app_logs.dart';

void main() {
  test('adds one to input values', () {

    print("[${LogColors.magenta.value} LOG MESSAGE ${LogColors.reset.value}] ${LogColors.yellow.value} SIMPLE MESSAGE PRINT ${LogColors.reset.value}");
    AppLogs.logMessage(text: 'SIMPLE MESSAGE',fileName: 'TEST CASE',msgColor: LogColors.backGroundCyan);
    AppLogs.logError(text: 'SIMPLE ERROR MESSAGE',fileName: 'FILENAME',error: 'ERROR TEXT');
    AppLogs.logWarning(text: 'SIMPLE ERROR MESSAGE',fileName: 'FILENAME',error: 'ERROR TEXT');
    AppLogs.logSuccess(text: 'SIMPLE MESSAGE',fileName: 'TEST CASE');
    "TESTING".logWarning(text: 'TEXT',fileName: 'FILE NAME',error: 'ERROR');
  });
}

class data extends StatefulWidget {
  const data({super.key});

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {

  @override
  void initState() {
    AppLogs.screens.add(runtimeType.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }
}

