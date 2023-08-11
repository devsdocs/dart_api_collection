part of '../../streamtape.dart';

extension Downloader on DownloadLink {
  Future<bool> download([String? destinationFolderDir]) async {
    if (result == null) return false;
    final dio = Dio();
    final destFolder = destinationFolderDir == null
        ? Directory.current
        : await Directory(destinationFolderDir).check;
    final uri = result!.url!.toUri;
    final fileNameAndExt = uri.fileNameAndExt;
    final saveDestinaton = [destFolder.path, fileNameAndExt].joinToPath;

    return dio
        .downloadUri(
          uri,
          saveDestinaton,
          onReceiveProgress: (current, total) => fileTransferProgress.add(
            FileTransferProgress(
              'streamtape_$uri',
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
