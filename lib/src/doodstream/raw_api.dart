part of '../doodstream.dart';

class _DoodstreamRawApi {
  _DoodstreamRawApi(this._apiKey) {
    initLog(_client);
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
          ..removeWhere((_, v) => v == null || v == 'null'),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.accountInfo}
  ///Get basic info of your account
  /// {@endtemplate}
  Future<String?> accountInfo() async =>
      _client.getUri(_apiUri('account/info'));

  /// {@template devsdocs.api_collection.doodstream.rawApi.accountReports}
  ///Get reports of your account (default last 7 days)
  /// {@endtemplate}
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

  /// {@template devsdocs.api_collection.doodstream.rawApi.dmcaList}
  ///Get DMCA reported files list (500 results per page)
  /// {@endtemplate}
  Future<String?> dmcaList() async => _client.getUri(_apiUri('dmca/list'));

  /// {@template devsdocs.api_collection.doodstream.rawApi.getUploadServer}
  ///Get upload server for [localUpload]
  /// {@endtemplate}
  Future<String?> getUploadServer() async =>
      _client.getUri(_apiUri('upload/server'));

  /// {@template devsdocs.api_collection.doodstream.rawApi.localUpload}
  ///Upload local files using API with [getUploadServer] result
  /// {@endtemplate}
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

  /// {@template devsdocs.api_collection.doodstream.rawApi.clone}
  ///Copy / Clone your's or other's file
  /// {@endtemplate}
  Future<String?> clone(
    String fileCode, {
    int? folderId,
  }) async =>
      _client.getUri(
        _apiUri('file/clone', {
          'file_code': fileCode,
          'fld_id': '$folderId',
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.remoteUpload}
  ///Upload files using direct links
  /// {@endtemplate}
  Future<String?> remoteUpload(
    String url, {
    String? newTitle,
    int? folderId,
  }) async =>
      _client.getUri(
        _apiUri('upload/url', {
          'url': url,
          'new_title': newTitle,
          'fld_id': '$folderId',
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.remoteUploadList}
  ///Remote Upload List & Status
  /// {@endtemplate}
  Future<String?> remoteUploadList() async =>
      _client.getUri(_apiUri('urlupload/list'));

  /// {@template devsdocs.api_collection.doodstream.rawApi.remoteUploadStatus}
  ///Remote Upload Status
  /// {@endtemplate}
  Future<String?> remoteUploadStatus(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('urlupload/status', {
          'file_code': fileCode,
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.remoteUploadSlot}
  ///Get total & used remote upload slots
  /// {@endtemplate}
  Future<String?> remoteUploadSlot() async =>
      _client.getUri(_apiUri('urlupload/slots'));

  /// {@template devsdocs.api_collection.doodstream.rawApi.remoteUploadAction}
  ///Perform various actions on remote upload
  /// {@endtemplate}
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

  /// {@template devsdocs.api_collection.doodstream.rawApi.createFolder}
  ///Create a folder
  /// {@endtemplate}
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

  /// {@template devsdocs.api_collection.doodstream.rawApi.renameFolder}
  ///Rename a folder
  /// {@endtemplate}
  Future<String?> renameFolder(
    String newName, {
    required int folderId,
  }) async =>
      _client.getUri(
        _apiUri('folder/rename', {
          'name': newName,
          'fld_id': '$folderId',
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.listFiles}
  ///List all files
  /// {@endtemplate}
  Future<String?> listFiles({
    String? page,
    String? videosPerPage,
    int? folderId,
  }) async =>
      _client.getUri(
        _apiUri('file/list', {
          'page': page,
          'per_page': videosPerPage,
          'fld_id': '$folderId',
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.fileStatus}
  ///Check status of your file
  /// {@endtemplate}
  Future<String?> fileStatus(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('file/check', {
          'file_code': fileCode,
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.fileInfo}
  ///Get file info
  /// {@endtemplate}
  Future<String?> fileInfo(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('file/info', {
          'file_code': fileCode,
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.fileImage}
  ///Get file splash, single or thumbnail image
  /// {@endtemplate}
  Future<String?> fileImage(
    String fileCode,
  ) async =>
      _client.getUri(
        _apiUri('file/image', {
          'file_code': fileCode,
        }),
      );

  /// {@template devsdocs.api_collection.doodstream.rawApi.fileRename}
  ///Rename your file
  /// {@endtemplate}
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

  /// {@template devsdocs.api_collection.doodstream.rawApi.fileSearch}
  ///Search your files
  /// {@endtemplate}
  Future<String?> fileSearch(String query) async => _client.getUri(
        _apiUri('search/videos', {
          'search_term': query,
        }),
      );
}
