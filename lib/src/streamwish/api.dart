part of '../streamwish.dart';

class StreamwishApi {
  StreamwishApi(String apiKey) : _rawApi = _StreamwishRawApi(apiKey);

  final _StreamwishRawApi _rawApi;

  _StreamwishRawApi get rawApi => _rawApi;

  Future<StreamwishAccountInfo?> accountInfo() async {
    final str = await _rawApi.accountInfo();
    return str == null ? null : StreamwishAccountInfo.fromJson(str);
  }

  Future<StreamwishAccountStat?> accountReports({
    int? lastXDaysReport,
  }) async {
    final str = await _rawApi.accountReports(lastXDaysReport: lastXDaysReport);
    return str == null ? null : StreamwishAccountStat.fromJson(str);
  }

  Future<StreamwishGetUploadServer?> getUploadServer() async {
    final str = await _rawApi.getUploadServer();
    return str == null ? null : StreamwishGetUploadServer.fromJson(str);
  }

  Future<StreamwishLocalUpload?> localUpload(
    File file, {
    required String uploadServer,
    String? fileTitle,
    String? fileDescription,
    File? fileThumbnail,
    int? folderId,
    int? categoryId,
    List<String>? tags,
    bool? isPublic,
    bool? isAdult,
  }) async {
    final str = await _rawApi.localUpload(
      file,
      uploadServer: uploadServer,
      fileTitle: fileTitle,
      categoryId: categoryId,
      fileDescription: fileDescription,
      fileThumbnail: fileThumbnail,
      folderId: folderId,
      isAdult: isAdult,
      isPublic: isPublic,
      tags: tags,
    );
    return str == null ? null : StreamwishLocalUpload.fromJson(str);
  }

  Future<StreamwishRemoteUpload?> remoteUpload(
    String url, {
    int? folderId,
    int? categoryId,
    bool? isPublic,
    bool? isAdult,
    List<String>? tags,
  }) async {
    final tryUri = url.toUriNull;
    if (tryUri == null) return null;
    final str = await _rawApi.remoteUpload(
      tryUri,
      categoryId: categoryId,
      folderId: folderId,
      isAdult: isAdult,
      isPublic: isPublic,
      tags: tags,
    );
    return str == null ? null : StreamwishRemoteUpload.fromJson(str);
  }

  Future<StreamwishFileInfo?> fileInfo(List<String> filesCode) async {
    final str = await _rawApi.fileInfo(filesCode);
    return str == null ? null : StreamwishFileInfo.fromJson(str);
  }

  Future<StreamwishFileEdit?> fileEdit(
    List<String> filesCode, {
    String? fileTitle,
    String? fileDescription,
    int? categoryId,
    int? folderId,
    bool? isPublic,
    bool? isAdult,
    List<String>? tags,
  }) async {
    final str = await _rawApi.fileEdit(
      filesCode,
      categoryId: categoryId,
      fileDescription: fileDescription,
      fileTitle: fileTitle,
      folderId: folderId,
      isAdult: isAdult,
      isPublic: isPublic,
      tags: tags,
    );
    return str == null ? null : StreamwishFileEdit.fromJson(str);
  }

  Future<StreamwishFileList?> fileList({
    int? folderId,
    String? title,
    bool? isPublic,
    bool? isAdult,
    int? resultPerPage,
    int? pageNumber,
    DateTime? time,
  }) async {
    final str = await _rawApi.fileList(
      folderId: folderId,
      isAdult: isAdult,
      isPublic: isPublic,
      pageNumber: pageNumber,
      resultPerPage: resultPerPage,
      time: time,
      title: title,
    );
    return str == null ? null : StreamwishFileList.fromJson(str);
  }

  Future<StreamwishFileDirectLink?> fileDirectLink(
    String fileCode, {
    StreamwishQuality? quality,
    bool? hls,
  }) async {
    final str = await _rawApi.fileDirectLink(
      fileCode,
      hls: hls,
      quality: quality,
    );
    return str == null ? null : StreamwishFileDirectLink.fromJson(str);
  }

  Future<StreamwishFileClone?> fileClone(
    String fileCode, {
    String? newFileTitle,
    int? destinationFolderId,
  }) async {
    final str = await _rawApi.fileClone(
      fileCode,
      destinationFolderId: destinationFolderId,
      newFileTitle: newFileTitle,
    );
    return str == null ? null : StreamwishFileClone.fromJson(str);
  }

  Future<StreamwishFileDelete?> fileDelete(
    String fileCode,
  ) async {
    final str = await _rawApi.fileDelete(fileCode);
    return str == null ? null : StreamwishFileDelete.fromJson(str);
  }

  Future<StreamwishFileDeletedList?> fileDeletedList({
    int? deletedInLastNumberOfHours,
  }) async {
    final str = await _rawApi.fileDeletedList(
      deletedInLastNumberOfHours: deletedInLastNumberOfHours,
    );
    return str == null ? null : StreamwishFileDeletedList.fromJson(str);
  }

  Future<StreamwishFileDmca?> fileDmcaList({
    int? reportedInLastNumberOfHours,
  }) async {
    final str = await _rawApi.fileDmcaList(
      reportedInLastNumberOfHours: reportedInLastNumberOfHours,
    );
    return str == null ? null : StreamwishFileDmca.fromJson(str);
  }

  Future<StreamwishFileEncodings?> fileEncodings(
    String fileCode,
  ) async {
    final str = await _rawApi.fileEncodings(fileCode);
    return str == null ? null : StreamwishFileEncodings.fromJson(str);
  }

  Future<StreamwishRemoteUploadStatus?> fileRemoteUploadStatus({
    String? fileCode,
  }) async {
    final str = await _rawApi.fileRemoteUploadStatus(fileCode: fileCode);
    return str == null ? null : StreamwishRemoteUploadStatus.fromJson(str);
  }

  Future<StreamwishRemoteUploadAction?> fileRemoteUploadAction({
    bool? restartErrors,
    bool? deleteErrors,
    bool? deleteAll,
    String? toBeDeletedRemoteUploadFileCode,
  }) async {
    final str = await _rawApi.fileRemoteUploadAction(
      deleteAll: deleteAll,
      deleteErrors: deleteErrors,
      restartErrors: restartErrors,
      toBeDeletedRemoteUploadFileCode: toBeDeletedRemoteUploadFileCode,
    );
    return str == null ? null : StreamwishRemoteUploadAction.fromJson(str);
  }

  Future<StreamwishFolderCreate?> folderCreate(
    String folderName, {
    int? parentFolderId,
    String? folderDescription,
  }) async {
    final str = await _rawApi.folderCreate(
      folderName,
      folderDescription: folderDescription,
      parentFolderId: parentFolderId,
    );
    return str == null ? null : StreamwishFolderCreate.fromJson(str);
  }

  Future<StreamwishFolderList?> folderList({
    int? folderId,
    int? showNuberOfFiles,
  }) async {
    final str = await _rawApi.folderList(
      folderId: folderId,
      showNuberOfFiles: showNuberOfFiles,
    );
    return str == null ? null : StreamwishFolderList.fromJson(str);
  }

  Future<StreamwishFolderEdit?> folderEdit(
    int folderId, {
    int? parentFolderId,
    String? folderName,
    String? folderDescription,
  }) async {
    final str = await _rawApi.folderEdit(
      folderId,
      folderDescription: folderDescription,
      folderName: folderName,
      parentFolderId: parentFolderId,
    );
    return str == null ? null : StreamwishFolderEdit.fromJson(str);
  }
}
