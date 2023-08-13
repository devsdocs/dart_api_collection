part of '../doodstream.dart';

class _DoodstreamRawApi {
  _DoodstreamRawApi(this._apiKey) {
    if (ApiConfig.printLog) {
      _client.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  final String _apiKey;
  final String _base = 'doodapi.com';

  final _client = RawHttp();

  Uri _apiUri(String unencodedPath, [Map<String, dynamic>? queryParameters]) =>
      Uri.https(
        _base,
        '/api/$unencodedPath',
        <String, dynamic>{'key': _apiKey}
          ..addAll(queryParameters ?? {})
          ..removeWhere((_, v) => v == null),
      );

  ///Get basic info of your account
  Future<String?> accountInfo() async =>
      _client.getUri(_apiUri('account/info'));

  ///Get reports of your account (default last 7 days)
  Future<String?> accountReports({
    int? lastXDaysReport,
    DateTime? fromDate,
    DateTime? toDate,
  }) async =>
      _client.getUri(
        _apiUri('account/stats', {
          'last': '$lastXDaysReport',
          'from_date': fromDate?.toJiffy.toYYYYMMDD,
          'to_date': toDate?.toJiffy.toYYYYMMDD,
        }),
      );

  ///Get DMCA reported files list (500 results per page)
  Future<String?> dmcaList() async => _client.getUri(_apiUri('dmca/list'));

  ///Get upload server for [localUpload]
  Future<String?> getUploadServer() async =>
      _client.getUri(_apiUri('upload/server'));

  ///Upload local files using API with [getUploadServer] result
  Future<String?> localUpload(File file, String uploadServer) async {
    final id = await file.id;
    final name = file.fileNameAndExt;

    final files = [MapEntry('file', await file.toMultipart)];
    final fields = [MapEntry('api_key', _apiKey)];

    return _client.post(
      '$uploadServer?$_apiKey',
      fields: fields,
      files: files,
      fileTransferProgress: FileTransferProgress(
        id,
        type: ServiceType.doodstream,
        name: name,
        isUpload: true,
      ),
    );
  }

  ///Copy / Clone your's or other's file
  Future<String?> clone(
    String fileCode, {
    String? folderId,
  }) async =>
      _client.getUri(
        _apiUri('file/clone', {
          'file_code': fileCode,
          'fld_id': folderId,
        }),
      );

  ///Upload files using direct links
  Future<String?> remoteUpload(
    String url, {
    String? newTitle,
    String? folderId,
  }) async =>
      _client.getUri(
        _apiUri('upload/url', {
          'url': url,
          'new_title': newTitle,
          'fld_id': folderId,
        }),
      );

  ///Remote Upload List & Status
  Future<String?> remoteUploadList() async =>
      _client.getUri(_apiUri('urlupload/list'));

  ///Remote Upload Status
  Future<String?> remoteUploadStatus(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('urlupload/status', {
          'file_code': fileCode,
        }),
      );

  ///Get total & used remote upload slots
  Future<String?> remoteUploadSlot() async =>
      _client.getUri(_apiUri('urlupload/slots'));

  ///Perform various actions on remote upload
  Future<String?> remoteUploadAction({
    required bool isRestartErrors,
    bool? isClearErrors,
    bool? isClearAll,
    String? toBeDeletedRemoteUploadFileCode,
  }) async =>
      _client.getUri(
        _apiUri('urlupload/actions', {
          'restart_errors': isRestartErrors.toStringFlag,
          'clear_errors': isClearErrors.toStringFlagOrNull,
          'clear_all': isClearAll.toStringFlagOrNull,
          'delete_code': toBeDeletedRemoteUploadFileCode,
        }),
      );

  ///Create a folder
  Future<String?> createFolder(
    String folderName, {
    String? parentId,
  }) async =>
      _client.getUri(
        _apiUri('folder/create', {
          'name': folderName,
          'parent_id': parentId,
        }),
      );

  ///Rename a folder
  Future<String?> renameFolder(
    String newName, {
    required String folderId,
  }) async =>
      _client.getUri(
        _apiUri('folder/rename', {
          'name': newName,
          'fld_id': folderId,
        }),
      );

  ///List all files
  Future<String?> listFiles({
    String? page,
    String? videosPerPage,
    String? folderId,
  }) async =>
      _client.getUri(
        _apiUri('file/list', {
          'page': page,
          'per_page': videosPerPage,
          'fld_id': folderId,
        }),
      );

  ///Check status of your file
  Future<String?> fileStatus(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('file/check', {
          'file_code': fileCode,
        }),
      );

  ///Get file info
  Future<String?> fileInfo(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('file/info', {
          'file_code': fileCode,
        }),
      );

  ///Get file splash, single or thumbnail image
  Future<String?> fileImage(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('file/image', {
          'file_code': fileCode,
        }),
      );

  ///Rename your file
  Future<String?> fileRename(
    String newName, {
    required String fileCode,
  }) async =>
      _client.getUri(
        _apiUri('file/rename', {
          'title': newName,
          'file_code': fileCode,
        }),
      );

  ///Search your files
  Future<String?> fileSearch(String query) async => _client.getUri(
        _apiUri('search/videos', {
          'search_term': query,
        }),
      );
}
