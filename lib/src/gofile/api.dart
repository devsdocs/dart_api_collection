part of '../gofile.dart';

class GofileApi {
  GofileApi([this._token]) : _rawApi = _GofileRawApi(_token);

  _GofileRawApi get rawApi => _rawApi;

  final _GofileRawApi _rawApi;

  final String? _token;

  Future<GofileGetAccount?> accountInfo() async {
    final str = await _rawApi.accountInfo();
    return str != null ? GofileGetAccount.fromJson(str) : null;
  }

  Future<GofileUploadServer?> getUploadServer() async {
    final str = await _rawApi.getUploadServer();
    return str != null ? GofileUploadServer.fromJson(str) : null;
  }

  Future<GofileLocalUpload?> uploadFile(File file, [String? folderId]) async {
    if (_token == null && folderId != null) {
      return GofileLocalUpload(
        status: 'Token must not be null when passing folderId',
      );
    }

    final uploadServer = (await getUploadServer())?.data?.server;

    if (uploadServer == null) {
      return GofileLocalUpload(status: 'Error retrieving upload server');
    }

    final str = await _rawApi.uploadFile(file, uploadServer, folderId);

    return str != null ? GofileLocalUpload.fromJson(str) : null;
  }

  Future<GofileGetContent?> getContent(String contentId) async {
    final str = await _rawApi.getContent(contentId);
    return str != null ? GofileGetContent.fromJson(str) : null;
  }

  Future<GofileCommonResult?> createFolder(
    String folderName,
    String parentFolderId,
  ) async {
    if (_token == null) {
      return GofileCommonResult(status: 'Token must not be null');
    }

    final str = await _rawApi.createFolder(folderName, parentFolderId);

    return str != null ? GofileCommonResult.fromJson(str) : null;
  }

  Future<GofileCommonResult?> setOption(
    String contentId,
    _GofileOption gofileOption,
  ) async {
    if (_token == null) {
      return GofileCommonResult(status: 'Token must not be null');
    }

    final type = (await getContent(contentId))?.data?.type;

    if (type == null) {
      return GofileCommonResult(status: 'Filed to check contentId type');
    }

    final isFolder = type == 'folder';

    if (isFolder && gofileOption is GofileDirectLinkOption) {
      return GofileCommonResult(status: 'Content id must be a file');
    }

    if (!isFolder && gofileOption is! GofileDirectLinkOption) {
      return GofileCommonResult(status: 'Content id must be a folder');
    }

    final str = await _rawApi.setOption(contentId, gofileOption);

    return str != null ? GofileCommonResult.fromJson(str) : null;
  }

  Future<GofileCommonResult?> copyContent(
    List<String> contentsIds,
    String destinationFolderId,
  ) async {
    if (_token == null) {
      return GofileCommonResult(status: 'Token must not be null');
    }

    final str = await _rawApi.copyContent(contentsIds, destinationFolderId);

    return str != null ? GofileCommonResult.fromJson(str) : null;
  }

  Future<GofileCommonResult?> deleteContent(List<String> contentsIds) async {
    if (_token == null) {
      return GofileCommonResult(status: 'Token must not be null');
    }

    final str = await _rawApi.deleteContent(contentsIds);

    return str != null ? GofileCommonResult.fromJson(str) : null;
  }
}
