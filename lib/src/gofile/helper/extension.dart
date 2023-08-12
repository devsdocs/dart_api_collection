part of '../../gofile.dart';

extension GofileApiExt on GofileApi {
  bool get printLog => _GofileLog.log;
  set printLog(bool value) => _GofileLog.log = value;
}

class _GofileLog {
  static bool get log => _log ?? false;
  static set log(bool value) => _log = value;
  static bool? _log;
}
