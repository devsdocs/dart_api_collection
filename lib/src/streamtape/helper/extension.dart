part of '../../streamtape.dart';

extension StreamtapeApiExt on StreamtapeApi {}

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
          onReceiveProgress: (current, total) => transferProgress.add(
            FileTransferProgress(
              '$uri',
              type: ServiceType.streamtape,
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
