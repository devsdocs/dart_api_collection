part of '../../doodstream.dart';

extension DoodstreamApiExt on DoodstreamApi {
  bool get printLog => _DoodstreamLog.log;
  set printLog(bool value) => _DoodstreamLog.log = value;
}

class _DoodstreamLog {
  static bool get log => _log ?? false;
  static set log(bool value) => _log = value;
  static bool? _log;
}
