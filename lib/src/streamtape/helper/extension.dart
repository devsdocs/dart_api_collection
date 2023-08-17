part of '../../streamtape.dart';

extension StreamtapeApiExt on StreamtapeApi {}

extension StreamtapeApiComponentExt on StreamtapeDownloadLink {
  Future<bool> download([String? destinationFolderDir]) async {
    if (result == null) return false;
    final client = RawHttp();
    final destFolder = destinationFolderDir == null
        ? Directory.current
        : await Directory(destinationFolderDir).check;
    final uri = result!.url!.toUri;
    final fileNameAndExt = uri.fileNameAndExt;
    final saveDestinaton = [destFolder.path, fileNameAndExt].joinPath;

    return client
        .downloadUri(
          uri,
          saveDestinaton,
          fileTransferProgress: FileTransferProgress(
            '$uri',
            type: ServiceType.streamtape,
            name: fileNameAndExt,
            isUpload: false,
          ),
        )
        .then((_) async => File(saveDestinaton).exists());
  }
}
