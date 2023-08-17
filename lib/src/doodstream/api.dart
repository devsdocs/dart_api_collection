part of '../doodstream.dart';

class DoodstreamApi {
  DoodstreamApi(String apiKey) : _rawApi = _DoodstreamRawApi(apiKey);

  final _DoodstreamRawApi _rawApi;

  _DoodstreamRawApi get rawApi => _rawApi;

  Future<DoodstreamAccountInfo?> accountInfo() async {
    final str = await _rawApi.accountInfo();
    return str != null ? DoodstreamAccountInfo.fromJson(str) : null;
  }

  Future<DoodstreamAccountReport?> accountReports({
    int? lastXDaysReport,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    final str = await _rawApi.accountReports(
      fromDate: fromDate,
      lastXDaysReport: lastXDaysReport,
      toDate: toDate,
    );
    return str != null ? DoodstreamAccountReport.fromJson(str) : null;
  }

  Future<DoodstreamDmcaList?> dmcaList() async {
    final str = await _rawApi.dmcaList();
    return str != null ? DoodstreamDmcaList.fromJson(str) : null;
  }

  Future<DoodstreamLocalUpload?> localUpload(File file) async {
    final getUploadLink = await _rawApi.getUploadServer();

    if (getUploadLink == null) return null;

    // ignore: avoid_dynamic_calls
    final uploadServer = getUploadLink.toJsonObject['result'] as String;

    final str = await _rawApi.localUpload(file, uploadServer);
    return str != null ? DoodstreamLocalUpload.fromJson(str) : null;
  }

  Future<DoodstreamCloneFile?> clone(
    String fileCode, {
    int? folderId,
  }) async {
    final str = await _rawApi.clone(fileCode, folderId: folderId);
    return str != null ? DoodstreamCloneFile.fromJson(str) : null;
  }

  Future<DoodstreamRemoteUpload?> remoteUpload(
    String url, {
    String? newTitle,
    int? folderId,
  }) async {
    final str =
        await _rawApi.remoteUpload(url, folderId: folderId, newTitle: newTitle);
    return str != null ? DoodstreamRemoteUpload.fromJson(str) : null;
  }

  Future<DoodstreamRemoteUploadList?> remoteUploadList() async {
    final str = await _rawApi.remoteUploadList();
    return str != null ? DoodstreamRemoteUploadList.fromJson(str) : null;
  }

  Future<DoodstreamRemoteUploadStatus?> remoteUploadStatus(
    String fileCode,
  ) async {
    final str = await _rawApi.remoteUploadStatus(
      fileCode,
    );
    return str != null ? DoodstreamRemoteUploadStatus.fromJson(str) : null;
  }

  Future<DoodstreamRemoteUploadSlot?> remoteUploadSlot() async {
    final str = await _rawApi.remoteUploadSlot();
    return str != null ? DoodstreamRemoteUploadSlot.fromJson(str) : null;
  }

  Future<DoodstreamRemoteUploadAction?> remoteUploadAction({
    required bool isRestartErrors,
    required bool isClearErrors,
    required bool isClearAll,
    String? toBeDeletedRemoteUploadFileCode,
  }) async {
    final str = await _rawApi.remoteUploadAction(
      isRestartErrors: isRestartErrors,
      isClearErrors: isClearErrors,
      isClearAll: isClearAll,
      toBeDeletedRemoteUploadFileCode: toBeDeletedRemoteUploadFileCode,
    );
    return str != null ? DoodstreamRemoteUploadAction.fromJson(str) : null;
  }

  Future<DoodstreamCreateFolder?> createFolder(
    String folderName, {
    String? parentId,
  }) async {
    final str = await _rawApi.createFolder(folderName, parentId: parentId);
    return str != null ? DoodstreamCreateFolder.fromJson(str) : null;
  }

  Future<DoodstreamRenameFolder?> renameFolder(
    String newName, {
    required int folderId,
  }) async {
    final str = await _rawApi.renameFolder(newName, folderId: folderId);
    return str != null ? DoodstreamRenameFolder.fromJson(str) : null;
  }

  Future<DoodstreamListFile?> listFiles({
    String? page,
    String? videosPerPage,
    int? folderId,
  }) async {
    final str = await _rawApi.listFiles(
      page: page,
      videosPerPage: videosPerPage,
      folderId: folderId,
    );
    return str != null ? DoodstreamListFile.fromJson(str) : null;
  }

  Future<DoodstreamFileStatus?> fileStatus(
    String fileCode,
  ) async {
    final str = await _rawApi.fileStatus(fileCode);
    return str != null ? DoodstreamFileStatus.fromJson(str) : null;
  }

  Future<DoodstreamFileInfo?> fileInfo(
    String fileCode,
  ) async {
    final str = await _rawApi.fileInfo(fileCode);
    return str != null ? DoodstreamFileInfo.fromJson(str) : null;
  }

  Future<DoodstreamFileImage?> fileImage(
    String fileCode,
  ) async {
    final str = await _rawApi.fileImage(fileCode);
    return str != null ? DoodstreamFileImage.fromJson(str) : null;
  }

  Future<DoodstreamFileRename?> fileRename(
    String newName, {
    required String fileCode,
  }) async {
    final str = await _rawApi.fileRename(newName, fileCode: fileCode);
    return str != null ? DoodstreamFileRename.fromJson(str) : null;
  }

  Future<DoodstreamFileSearch?> fileSearch(String query) async {
    final str = await _rawApi.fileSearch(query);
    return str != null ? DoodstreamFileSearch.fromJson(str) : null;
  }
}
