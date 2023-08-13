part of '../gofile.dart';

///The Gofile system operates using accounts, files, and folders. With this API, you can manage an efficient file storage system. All files are organized within folders, and each folder is associated with an account. Every account has at least one root folder, which cannot be deleted.
///
///If you upload a file without specifying any parameters, a guest account and a root folder will be created, and the file will be uploaded to a new folder within the root folder. If you wish to upload multiple files, you must first upload the initial file, then obtain the folderId from the response of the request. You can then upload the remaining files one at a time, specifying the folderId as a parameter.
class GofileApi {
  GofileApi([this._token]) : _rawApi = _GofileRawApi(_token);

  _GofileRawApi get rawApi => _rawApi;

  final _GofileRawApi _rawApi;

  final String? _token;

  ///Retrieving specific account information
  Future<GofileGetAccount?> accountInfo() async {
    final str = await _rawApi.accountInfo();
    return str != null ? GofileGetAccount.fromJson(str) : null;
  }

  ///Returns the best server available to receive files.
  ///
  ///Example response:
  ///```json
  ///{
  ///  "status": "ok",
  ///  "data": {
  ///    "server": "store1"
  ///  }
  ///}
  ///```
  Future<GofileUploadServer?> _getUploadServer() async {
    final str = await _rawApi.getUploadServer();
    return str != null ? GofileUploadServer.fromJson(str) : null;
  }

  ///Upload one file on a specific server.
  ///
  ///If you specify a [folderId], the [file] will be added to this folder.
  ///
  ///Must contain one [file].
  ///
  ///If you want to upload multiple files, call [uploadFile] again and specify the [folderId] of the `first` [file] uploaded.
  ///
  ///[folderId] `The ID of a folder`.
  ///
  ///If valid, the file will be added to this folder.
  ///
  ///If undefined, a new folder will be created to receive the file.
  ///
  ///When using the folderId, you must pass the account [_token] when constructing [GofileApi].
  Future<GofileLocalUpload?> uploadFile(File file, [String? folderId]) async {
    if (_token == null && folderId != null) {
      return GofileLocalUpload(
        status: 'Token must not be null when passing folderId',
      );
    }

    final uploadServer = (await _getUploadServer())?.data?.server;

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
