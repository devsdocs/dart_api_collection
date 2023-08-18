part of '../doodstream.dart';

class DoodstreamApi {
  DoodstreamApi(String apiKey) : _rawApi = _DoodstreamRawApi(apiKey);

  final _DoodstreamRawApi _rawApi;

  _DoodstreamRawApi get rawApi => _rawApi;

  ///{@macro devsdocs.api_collection.doodstream.rawApi.accounInfo}
  Future<DoodstreamAccountInfo?> accountInfo() async {
    final str = await _rawApi.accountInfo();
    return str != null ? DoodstreamAccountInfo.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.accountReports}
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

  ///{@macro devsdocs.api_collection.doodstream.rawApi.dmcaList}
  Future<DoodstreamDmcaList?> dmcaList() async {
    final str = await _rawApi.dmcaList();
    return str != null ? DoodstreamDmcaList.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.getUploadServer}
  Future<DoodstreamUploadServer?> getUploadServer() async {
    final str = await _rawApi.getUploadServer();
    return str != null ? DoodstreamUploadServer.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.localUpload}
  Future<DoodstreamLocalUpload?> localUpload(
    File file,
    String uploadServer,
  ) async {
    final str = await _rawApi.localUpload(file, uploadServer);
    return str != null ? DoodstreamLocalUpload.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.clone}
  Future<DoodstreamCloneFile?> clone(
    String fileCode, {
    int? folderId,
  }) async {
    final str = await _rawApi.clone(fileCode, folderId: folderId);
    return str != null ? DoodstreamCloneFile.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.remoteUpload}
  Future<DoodstreamRemoteUpload?> remoteUpload(
    String url, {
    String? newTitle,
    int? folderId,
  }) async {
    final str =
        await _rawApi.remoteUpload(url, folderId: folderId, newTitle: newTitle);
    return str != null ? DoodstreamRemoteUpload.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.remoteUploadList}
  Future<DoodstreamRemoteUploadList?> remoteUploadList() async {
    final str = await _rawApi.remoteUploadList();
    return str != null ? DoodstreamRemoteUploadList.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.remoteUploadStatus}
  Future<DoodstreamRemoteUploadStatus?> remoteUploadStatus(
    String fileCode,
  ) async {
    final str = await _rawApi.remoteUploadStatus(
      fileCode,
    );
    return str != null ? DoodstreamRemoteUploadStatus.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.remoteUploadSlot}
  Future<DoodstreamRemoteUploadSlot?> remoteUploadSlot() async {
    final str = await _rawApi.remoteUploadSlot();
    return str != null ? DoodstreamRemoteUploadSlot.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.remoteUploadAction}
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

  ///{@macro devsdocs.api_collection.doodstream.rawApi.createFolder}
  Future<DoodstreamCreateFolder?> createFolder(
    String folderName, {
    String? parentId,
  }) async {
    final str = await _rawApi.createFolder(folderName, parentId: parentId);
    return str != null ? DoodstreamCreateFolder.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.renameFolder}
  Future<DoodstreamRenameFolder?> renameFolder(
    String newName, {
    required int folderId,
  }) async {
    final str = await _rawApi.renameFolder(newName, folderId: folderId);
    return str != null ? DoodstreamRenameFolder.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.listFiles}
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

  ///{@macro devsdocs.api_collection.doodstream.rawApi.fileStatus}
  Future<DoodstreamFileStatus?> fileStatus(
    String fileCode,
  ) async {
    final str = await _rawApi.fileStatus(fileCode);
    return str != null ? DoodstreamFileStatus.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.fileInfo}
  Future<DoodstreamFileInfo?> fileInfo(
    String fileCode,
  ) async {
    final str = await _rawApi.fileInfo(fileCode);
    return str != null ? DoodstreamFileInfo.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.fileImage}
  Future<DoodstreamFileImage?> fileImage(
    String fileCode,
  ) async {
    final str = await _rawApi.fileImage(fileCode);
    return str != null ? DoodstreamFileImage.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.fileRename}
  Future<DoodstreamFileRename?> fileRename(
    String newName, {
    required String fileCode,
  }) async {
    final str = await _rawApi.fileRename(newName, fileCode: fileCode);
    return str != null ? DoodstreamFileRename.fromJson(str) : null;
  }

  ///{@macro devsdocs.api_collection.doodstream.rawApi.fileSearch}
  Future<DoodstreamFileSearch?> fileSearch(String query) async {
    final str = await _rawApi.fileSearch(query);
    return str != null ? DoodstreamFileSearch.fromJson(str) : null;
  }
}
