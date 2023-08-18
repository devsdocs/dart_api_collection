part of '../../doodstream.dart';

extension DoodstreamApiExt on DoodstreamApi {
  Future<DoodstreamLocalUpload?> getUploadServerAndUploadFile(File file) async {
    final uploadServer = await getUploadServer();
    if (uploadServer == null) return null;
    if (uploadServer.result == null) return null;
    final upload = await localUpload(file, uploadServer.result!);
    if (upload == null) return null;
    return upload;
  }
}
