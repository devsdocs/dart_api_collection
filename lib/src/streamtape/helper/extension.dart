part of '../../streamtape.dart';

extension StreamtapeApiExt on StreamtapeApi {
  Future<StreamtapeUploadResult?> getUploadServerAndUploadFile(
    File file, [
    String? folderId,
  ]) async {
    final uploadServer = await getUploadLink(folderId);
    if (uploadServer == null) return null;
    if (uploadServer.result == null) return null;
    final upload = await localUpload(file, uploadServer.result!.url!);
    if (upload == null) return null;
    return upload;
  }

  Future<StreamtapeDownloadLink?> getDownloadTicketAndDownloadLink(
    String fileId,
  ) async {
    final ticket = await getDownloadTicket(fileId);
    if (ticket == null) return null;
    if (ticket.result == null) return null;
    final downloadLink = await getDownloadLink(
      fileId,
      ticket.result!.ticket!,
      ticket.result!.waitTime!,
    );

    if (downloadLink == null) return null;
    return downloadLink;
  }
}

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
