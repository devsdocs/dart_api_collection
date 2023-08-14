part of '../gofile.dart';

class _GofileRawApi {
  _GofileRawApi([this.token]) {
    final logConfig = ApiConfig.logConfig;
    if (logConfig.enableLog) {
      _client.interceptors.add(
        LogInterceptor(
          requestBody: logConfig.showRequestBody,
          responseBody: logConfig.showResponseBody,
          error: logConfig.showError,
          request: logConfig.showRequest,
          requestHeader: logConfig.showRequestHeader,
          responseHeader: logConfig.showResponseHeader,
        ),
      );
    }
  }

  final String? token;
  final String _base = 'gofile.io';

  final _client = RawHttp();

  Uri _apiUri(
    String unencodedPath, {
    Map<String, dynamic>? queryParameters,
    String server = 'api',
    bool isNeedTokenInParameters = false,
  }) =>
      Uri.https(
        [server, _base].joinDot,
        '/$unencodedPath',
        (isNeedTokenInParameters ? <String, dynamic>{'token': token} : {})
          ..addAll(queryParameters ?? {})
          ..removeWhere((_, v) => v == null),
      );

  /// Retrieving specific account information
  ///
  /// [token] must be provided
  Future<String?> accountInfo() => _client.getUri(
        _apiUri('getAccountDetails', isNeedTokenInParameters: true),
      );

  ///Returns the best server available to receive files for [uploadFile]
  Future<String?> getUploadServer() =>
      _client.getUri(_apiUri('getServer', isNeedTokenInParameters: true));

  ///Upload one [file] on a specific server from [getUploadServer] result
  ///
  ///If you specify a [folderId], the [file] will be added to this folder.
  ///
  ///Must contain one [file].
  ///
  ///If you want to upload multiple files, call [uploadFile] again and specify the [folderId] of the `first` [file] uploaded.
  ///
  ///If [token] valid, the [file] will be added to this account.
  ///
  ///If [token] undefined, a guest account will be created to receive the file.
  ///
  ///If [folderId] valid, the file will be added to this folder.
  ///
  /// If [folderId] undefined, a new folder will be created to receive the file.
  ///
  ///When using the [folderId], you must pass the account [token].
  Future<String?> uploadFile(
    File file,
    String uploadServer, [
    String? folderId,
  ]) async {
    final id = await file.id;

    final files = [MapEntry('file', await file.toMultipart)];

    final fields = [
      if (token != null) MapEntry('token', token!),
      if (token != null && folderId != null) MapEntry('folderId', folderId),
    ];

    return _client.postUri(
      _apiUri(
        'uploadFile',
        server: uploadServer,
      ),
      fields: fields,
      files: files,
      fileTransferProgress: FileTransferProgress(
        id,
        type: ServiceType.gofile,
        name: file.fileNameAndExt,
        isUpload: true,
      ),
    );
  }

  ///Get a specific content details
  ///
  /// [contentId] of file/folder
  ///
  /// [token] must be provided
  Future<String?> getContent(String contentId) => _client.getUri(
        _apiUri(
          'getContent',
          queryParameters: {'contentId': contentId},
          isNeedTokenInParameters: true,
        ),
      );

  ///Create a new folder
  ///
  ///[parentFolderId] is The parent folder ID.
  ///
  /// [token] must be provided
  Future<String?> createFolder(
    String folderName,
    String parentFolderId,
  ) async {
    final data = <String, dynamic>{
      'token': token,
      'folderName': folderName,
      'parentFolderId': parentFolderId,
    }.toJsonString;

    return _client.putUri(
      _apiUri('createFolder'),
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// [token] must be provided
  ///
  /// [contentId] is file/folder id
  ///
  /// [gofileOption] can be:
  ///
  /// "public" [GofilePublicOption] : can be "true" or "false". The [contentId] must be a folder.,
  ///
  /// "password" [GofilePasswordOption] : must be the password. The [contentId] must be a folder.,
  ///
  /// "description" [GofileDescriptionOption] : must be the description. The [contentId] must be a folder.,
  ///
  /// "expire" [GofileExpireOption] : must be the expiration date. The [contentId] must be a folder.,
  ///
  /// "tags" [GofileTagsOption] : must be a list of tags. The contentId must be a folder.,
  ///
  /// "directLink" [GofileDirectLinkOption] : can be "true" or "false". The contentId must be a file.
  Future<String?> setOption(
    String contentId,
    _GofileOption gofileOption,
  ) async {
    final option = gofileOption.name!;

    final value = gofileOption.value!;

    final data = <String, dynamic>{
      'token': token,
      'contentId': contentId,
      'option': option,
      'value': value,
    }.toJsonString;

    return _client.putUri(
      _apiUri('setOption'),
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  /// [contentsIds] is list of `contentId` to copy (files or folders)
  ///
  /// [destinationFolderId] is the destination folder
  ///
  /// [token] must be provided
  Future<String?> copyContent(
    List<String> contentsIds,
    String destinationFolderId,
  ) async {
    final joinContentIds = contentsIds.joinComma;

    final data = <String, dynamic>{
      'token': token,
      'folderIdDest': destinationFolderId,
      'contentsId': joinContentIds,
    }.toJsonString;

    return _client.putUri(
      _apiUri('copyContent'),
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  ///Delete one or multiple files/folders
  ///
  /// [contentsIds] is list of `contentId` to delete (files or folders)
  ///
  /// [token] must be provided
  Future<String?> deleteContent(List<String> contentsIds) async {
    final joinContentIds = contentsIds.joinComma;

    final data = <String, dynamic>{
      'token': token,
      'contentsId': joinContentIds,
    }.toJsonString;

    return _client.deleteUri(
      _apiUri('deleteContent'),
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
