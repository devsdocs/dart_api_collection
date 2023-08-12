part of '../../mixdrop.dart';

extension MixdropApiExt on MixdropApi {
  bool get printLog => _MixdropLog.log;
  set printLog(bool value) => _MixdropLog.log = value;
}

class _MixdropLog {
  static bool get log => _log ?? false;
  static set log(bool value) => _log = value;
  static bool? _log;
}
