part of '../../streamwish.dart';

extension StreamwishApiExt on StreamwishApi {
  Future<StreamwishLocalUpload?> getUploadServerAndUploadFile(
    File file, {
    String? fileTitle,
    String? fileDescription,
    File? fileThumbnail,
    int? folderId,
    int? categoryId,
    List<String>? tags,
    bool? isPublic,
    bool? isAdult,
  }) async {
    final uploadServer = await getUploadServer();
    if (uploadServer == null) return null;
    if (uploadServer.result == null) return null;
    final upload = await localUpload(
      file,
      uploadServer: uploadServer.result!,
      categoryId: categoryId,
      fileDescription: fileDescription,
      fileThumbnail: fileThumbnail,
      fileTitle: fileTitle,
      folderId: folderId,
      isAdult: isAdult,
      isPublic: isPublic,
      tags: tags,
    );
    if (upload == null) return null;
    return upload;
  }
}

extension StreamwishApiComponentExt on StreamwishFileDirectLink {
  Future<bool> download([String? destinationFolderDir]) async {
    if (result == null) return false;
    final client = RawHttp();
    final destFolder = destinationFolderDir == null
        ? Directory.current
        : await Directory(destinationFolderDir).check;
    final files = result!.versions!
      ..sort(
        (a, b) => b.size!.compareTo(a.size!),
      );
    final selected = files.first.url!.toUri;
    final fileNameAndExt = result!.fileName!.endsWith('.mp4')
        ? result!.fileName!
        : [result!.fileName, '.mp4'].join();
    final saveDestinaton = [destFolder.path, fileNameAndExt].joinPath;

    return client
        .downloadUri(
          selected,
          saveDestinaton,
          fileTransferProgress: FileTransferProgress(
            '$files',
            type: ServiceType.streamwish,
            name: fileNameAndExt,
            isUpload: false,
          ),
        )
        .then((_) async => File(saveDestinaton).exists());
  }
}
