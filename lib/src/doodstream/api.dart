part of '../doodstream.dart';

class DoodstreamApi {
  DoodstreamApi(this._apiKey) {
    if (ApiConfig.printLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  final String _apiKey;
  final String _base = 'doodapi.com';

  final _dio = Dio();

  Uri _apiUri(String unencodedPath, [Map<String, dynamic>? queryParameters]) =>
      Uri.https(
        _base,
        '/api/$unencodedPath',
        <String, dynamic>{'key': _apiKey}
          ..addAll(queryParameters ?? {})
          ..removeWhere((_, v) => v == null),
      );

  Future<DoodstreamAccountInfo> accountInfo() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('account/info'));
        return DoodstreamAccountInfo.fromJson(fetch.data!);
      });

  Future<DoodstreamAccountReport> accountReports({
    String? lastXDaysReport,
    String? fromDate,
    String? toDate,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('account/stats', {
            'last': lastXDaysReport,
            'from_date': fromDate,
            'to_date': toDate,
          }),
        );
        return DoodstreamAccountReport.fromJson(fetch.data!);
      });

//TODO: add model when available
  Future<String> dmcaList() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('dmca/list'));
        return fetch.data!;
      });

  Future<DoodstreamLocalUpload> localUpload(File file) async {
    final id = await file.id;
    final name = file.fileNameAndExt;
    final getUploadLink = await Isolate.run(
      () => _dio.getUri<String>(_apiUri('upload/server')),
    );

    // ignore: avoid_dynamic_calls
    final uploadServer = jsonDecode(getUploadLink.data!)['result'] as String;

    final formData = FormData.fromMap({
      'api_key': _apiKey,
      'file': await file.toMultipart,
    });

    final upload = await _dio.post<String>(
      '$uploadServer?$_apiKey',
      data: formData,
      onSendProgress: (current, total) => doodstreamFileTransferProgress.add(
        _DoodstreamFileTransferProgress(
          id,
          name: name,
          current: current,
          total: total,
          isUpload: true,
        ),
      ),
    );

    return DoodstreamLocalUpload.fromJson(upload.data!);
  }

  Future<DoodstreamCloneFile> clone(
    String fileCode, {
    String? folderId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/clone', {
            'file_code': fileCode,
            'fld_id': folderId,
          }),
        );
        return DoodstreamCloneFile.fromJson(fetch.data!);
      });

  Future<DoodstreamRemoteUpload> remoteUpload(
    String url, {
    String? newTitle,
    String? folderId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('upload/url', {
            'url': url,
            'new_title': newTitle,
            'fld_id': folderId,
          }),
        );
        return DoodstreamRemoteUpload.fromJson(fetch.data!);
      });

  Future<DoodstreamRemoteUploadList> remoteUploadList() async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('urlupload/list'));
        return DoodstreamRemoteUploadList.fromJson(fetch.data!);
      });

  Future<DoodstreamRemoteUploadStatus> remoteUploadStatus(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('urlupload/status', {
            'file_code': fileCode,
          }),
        );
        return DoodstreamRemoteUploadStatus.fromJson(fetch.data!);
      });

  Future<DoodstreamRemoteUploadSlot> remoteUploadSlot() async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('urlupload/slots'));
        return DoodstreamRemoteUploadSlot.fromJson(fetch.data!);
      });

  Future<DoodstreamRemoteUploadAction> remoteUploadAction({
    required bool isRestartErrors,
    required bool isClearErrors,
    required bool isClearAll,
    String? toBeDeletedRemoteUploadFileCode,
  }) async =>
      Isolate.run(() async {
        final restartErrors = isRestartErrors ? '1' : '0';
        final clearErrors = isClearErrors ? '1' : '0';
        final clearAll = isClearAll ? '1' : '0';

        final fetch = await _dio.getUri<String>(
          _apiUri('urlupload/actions', {
            'restart_errors': restartErrors,
            'clear_errors': clearErrors,
            'clear_all': clearAll,
            'delete_code': toBeDeletedRemoteUploadFileCode,
          }),
        );
        return DoodstreamRemoteUploadAction.fromJson(fetch.data!);
      });

  Future<DoodstreamCreateFolder> createFolder(
    String folderName, {
    String? parentId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('folder/create', {
            'name': folderName,
            'parent_id': parentId,
          }),
        );
        return DoodstreamCreateFolder.fromJson(fetch.data!);
      });

  Future<DoodstreamRenameFolder> renameFolder(
    String newName, {
    required String folderId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('folder/rename', {
            'name': newName,
            'fld_id': folderId,
          }),
        );
        return DoodstreamRenameFolder.fromJson(fetch.data!);
      });

  Future<DoodstreamListFile> listFiles({
    String? page,
    String? videosPerPage,
    String? folderId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/list', {
            'page': page,
            'per_page': videosPerPage,
            'fld_id': folderId,
          }),
        );
        return DoodstreamListFile.fromJson(fetch.data!);
      });

  Future<DoodstreamFileStatus> fileStatus(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/check', {
            'file_code': fileCode,
          }),
        );
        return DoodstreamFileStatus.fromJson(fetch.data!);
      });

  Future<DoodstreamFileInfo> fileInfo(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/info', {
            'file_code': fileCode,
          }),
        );
        return DoodstreamFileInfo.fromJson(fetch.data!);
      });

  Future<DoodstreamFileImage> fileImage(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/image', {
            'file_code': fileCode,
          }),
        );
        return DoodstreamFileImage.fromJson(fetch.data!);
      });

  Future<DoodstreamFileRename> fileRename(
    String newName, {
    required String fileCode,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/rename', {
            'title': newName,
            'file_code': fileCode,
          }),
        );
        return DoodstreamFileRename.fromJson(fetch.data!);
      });

  Future<DoodstreamFileSearch> fileSearch(String query) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('search/videos', {
            'search_term': query,
          }),
        );
        return DoodstreamFileSearch.fromJson(fetch.data!);
      });
}
