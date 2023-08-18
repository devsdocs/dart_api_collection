part of '../streamtape.dart';

class StreamtapeApi {
  StreamtapeApi(String user, String apiKey)
      : _rawApi = _StreamtapeRawApi(user, apiKey);

  final _StreamtapeRawApi _rawApi;

  _StreamtapeRawApi get rawApi => _rawApi;

  Future<StreamtapeAccountInfo?> accountInfo() async {
    final fetch = await _rawApi.accountInfo();
    return fetch != null ? StreamtapeAccountInfo.fromJson(fetch) : null;
  }

  Future<StreamtapeDownloadTicket?> getDownloadTicket(String fileId) async {
    final fetchTicket = await _rawApi.getDownloadTicket(fileId);

    return fetchTicket != null
        ? StreamtapeDownloadTicket.fromJson(fetchTicket)
        : null;
  }

  Future<StreamtapeDownloadLink?> getDownloadLink(
    String fileId,
    String ticket,
    int waitTime,
  ) async {
    final getDlLink = await _rawApi.getDownloadLink(fileId, ticket, waitTime);
    return getDlLink != null
        ? StreamtapeDownloadLink.fromJson(getDlLink)
        : null;
  }

  Future<StreamtapeFileInfo?> getFileInfo(List<String> iDs) async {
    final fetch = await _rawApi.getFileInfo(iDs);

    return fetch != null ? StreamtapeFileInfo.fromJson(fetch) : null;
  }

  Future<StreamtapeUploadLink?> getUploadLink([String? folderId]) async {
    final fetch = await _rawApi.getUploadLink(folderId);
    return fetch != null ? StreamtapeUploadLink.fromJson(fetch) : null;
  }

  Future<StreamtapeUploadResult?> localUpload(
    File file,
    String url,
  ) async {
    final upload = await _rawApi.localUpload(file, url: url);
    return upload != null ? StreamtapeUploadResult.fromJson(upload) : null;
  }

  Future<StreamtapeRemoteUploadAdd?> remoteUploadAdd(
    String url, {
    String? folderId,
    String? customName,
  }) async {
    final fetch = await _rawApi.remoteUploadAdd(
      url,
      customName: customName,
      folderId: folderId,
    );

    return fetch != null ? StreamtapeRemoteUploadAdd.fromJson(fetch) : null;
  }

//! If remoteUploadId is null, remove all current remote upload task
  Future<StreamtapeCommonResult?> remoteUploadRemove([
    String? id,
  ]) async {
    final fetch = await _rawApi.remoteUploadRemove(id);

    return fetch != null ? StreamtapeCommonResult.fromJson(fetch) : null;
  }

//! If remoteUploadId is null or non exist, returning all remote upload status
  Future<StreamtapeRemoteUploadCheck?> remoteUploadCheck([
    String? remoteUploadId,
  ]) async {
    final fetch = await _rawApi.remoteUploadCheck(remoteUploadId);

    return fetch != null ? StreamtapeRemoteUploadCheck.fromJson(fetch) : null;
  }

  Future<StreamtapeFileAndFolderList?> fileAndFolderList([
    String? folderId,
  ]) async {
    final fetch = await _rawApi.fileAndFolderList(folderId);
    return fetch != null ? StreamtapeFileAndFolderList.fromJson(fetch) : null;
  }

  Future<StreamtapeFolderCreate?> folderCreate(
    String name, [
    String? parentFoolderId,
  ]) async {
    final fetch = await _rawApi.folderCreate(name, parentFoolderId);
    return fetch != null ? StreamtapeFolderCreate.fromJson(fetch) : null;
  }

  //TODO: rename folder not working somehow
  Future<StreamtapeCommonResult?> renameFolder(
    String folderId,
    String newName,
  ) async {
    final fetch = await _rawApi.renameFolder(folderId, newName);
    return fetch != null ? StreamtapeCommonResult.fromJson(fetch) : null;
  }

  //TODO: delete folder not working somehow
  Future<StreamtapeCommonResult?> deleteFolder(String folderId) async {
    final fetch = await _rawApi.deleteFolder(folderId);
    return fetch != null ? StreamtapeCommonResult.fromJson(fetch) : null;
  }

  Future<StreamtapeFileThumbnail?> fileThumbnail(String fileId) async {
    final fetch = await _rawApi.fileThumbnail(fileId);

    return fetch != null ? StreamtapeFileThumbnail.fromJson(fetch) : null;
  }

  Future<StreamtapeCommonResult?> fileRename(
    String fileId,
    String newName,
  ) async {
    final fetch = await _rawApi.fileRename(fileId, newName);
    return fetch != null ? StreamtapeCommonResult.fromJson(fetch) : null;
  }

  Future<StreamtapeCommonResult?> fileMove(
    String fileId,
    String destinationFolderId,
  ) async {
    final fetch = await _rawApi.fileMove(fileId, destinationFolderId);
    return fetch != null ? StreamtapeCommonResult.fromJson(fetch) : null;
  }

  Future<StreamtapeCommonResult?> fileDelete(String fileId) async {
    final fetch = await _rawApi.fileDelete(fileId);
    return fetch != null ? StreamtapeCommonResult.fromJson(fetch) : null;
  }

  Future<StreamtapeConvertRunning?> convertRunning() async {
    final fetch = await _rawApi.convertRunning();

    return fetch != null ? StreamtapeConvertRunning.fromJson(fetch) : null;
  }

  Future<StreamtapeConvertFailed?> convertFailed() async {
    final fetch = await _rawApi.convertFailed();

    return fetch != null ? StreamtapeConvertFailed.fromJson(fetch) : null;
  }
}
