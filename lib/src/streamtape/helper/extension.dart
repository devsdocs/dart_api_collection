part of '../../streamtape.dart';

extension StreamtapeApiExt on StreamtapeApi {
  bool get printLog => _StreamtapeLog.log;
  set printLog(bool value) => _StreamtapeLog.log = value;
}

class _StreamtapeLog {
  static bool get log => _log ?? false;
  static set log(bool value) => _log = value;
  static bool? _log;
}

extension StreamtapeApiComponentExt on StreamtapeDownloadLink {
  Future<bool> download([String? destinationFolderDir]) async {
    if (result == null) return false;
    final dio = Dio();
    final destFolder = destinationFolderDir == null
        ? Directory.current
        : await Directory(destinationFolderDir).check;
    final uri = result!.url!.toUri;
    final fileNameAndExt = uri.fileNameAndExt;
    final saveDestinaton = [destFolder.path, fileNameAndExt].joinPath;

    return dio
        .downloadUri(
          uri,
          saveDestinaton,
          onReceiveProgress: (current, total) =>
              streamtapeFileTransferProgress.add(
            _StreamTapeFileTransferProgress(
              '$uri',
              name: fileNameAndExt,
              current: current,
              total: total,
              isUpload: false,
            ),
          ),
        )
        .then((_) async => File(saveDestinaton).exists());
  }
}
