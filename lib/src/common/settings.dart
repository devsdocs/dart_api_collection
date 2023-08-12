part of '../common.dart';

class ApiConfig {
  static bool get printLog => _printLog ??= false;

  static set printLog(bool value) => _printLog = value;

  static bool? _printLog;
}
