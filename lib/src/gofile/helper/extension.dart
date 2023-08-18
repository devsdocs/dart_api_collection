part of '../../gofile.dart';

extension GofileApiExt on GofileApi {
  Future<GofileLocalUpload?> getUploadServerAndUploadFile(
    File file, [
    String? folderId,
  ]) async {
    final uploadServer = await getUploadServer();
    if (uploadServer == null) return null;
    if (uploadServer.data == null) return null;
    final upload = await uploadFile(file, uploadServer.data!.server!, folderId);
    if (upload == null) return null;
    return upload;
  }
}
