part of 'main.dart';

class DoodStreamApi {
  DoodStreamApi(this._apiKey, {bool enableLog = false}) {
    if (enableLog) {
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

  Future<AccountInfo> accountInfo() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('account/info'));
        return AccountInfo.fromJson(fetch.data!);
      });

  Future<AccountReport> accountReports({
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
        return AccountReport.fromJson(fetch.data!);
      });

//TODO: add model when available
  Future<String> dmcaList() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('dmca/list'));
        return fetch.data!;
      });

  Future<LocalUpload> localUpload(File file) async {
    final id = await file.id;
    final name = file.fileNameAndExt;
    final getUploadLink = await Isolate.run(
      () => _dio.getUri<String>(_apiUri('upload/server')),
    );

    // ignore: avoid_dynamic_calls
    final uploadServer = jsonDecode(getUploadLink.data!)['result'] as String;

    final formData = FormData.fromMap({
      'api_key': _apiKey,
      'file': await MultipartFile.fromFile(file.path),
    });

    final upload = await _dio.post<String>(
      '$uploadServer?$_apiKey',
      data: formData,
      onSendProgress: (current, total) => fileTransferProgress.add(
        FileTransferProgress(
          'doodstream_$id',
          name: name,
          current: current,
          total: total,
          isUpload: true,
        ),
      ),
    );

    return LocalUpload.fromJson(upload.data!);
  }

  Future<Clone> clone(
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
        return Clone.fromJson(fetch.data!);
      });

  Future<RemoteUpload> remoteUpload(
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
        return RemoteUpload.fromJson(fetch.data!);
      });

  Future<RemoteUploadList> remoteUploadList() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('urlupload/list'));
        return RemoteUploadList.fromJson(fetch.data!);
      });

  Future<RemoteUploadStatus> remoteUploadStatus(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('urlupload/status', {
            'file_code': fileCode,
          }),
        );
        return RemoteUploadStatus.fromJson(fetch.data!);
      });

  Future<RemoteUploadSlot> remoteUploadSlot() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('urlupload/slots'));
        return RemoteUploadSlot.fromJson(fetch.data!);
      });

  Future<RemoteUploadAction> remoteUploadAction({
    required String restartErrors, //'1' for restart
    String? clearErrors,
    String? clearAll,
    String? deleteFile,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('urlupload/actions', {
            'restart_errors': restartErrors,
            'clear_errors': clearErrors,
            'clear_all': clearAll,
            'delete_code': deleteFile,
          }),
        );
        return RemoteUploadAction.fromJson(fetch.data!);
      });

  Future<CreateFolder> createFolder(
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
        return CreateFolder.fromJson(fetch.data!);
      });

  Future<RenameFolder> renameFolder(
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
        return RenameFolder.fromJson(fetch.data!);
      });

  Future<ListFile> listFiles({
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
        return ListFile.fromJson(fetch.data!);
      });

  Future<FileStatus> fileStatus(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/check', {
            'file_code': fileCode,
          }),
        );
        return FileStatus.fromJson(fetch.data!);
      });

  Future<FileInfo> fileInfo(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/info', {
            'file_code': fileCode,
          }),
        );
        return FileInfo.fromJson(fetch.data!);
      });

  Future<FileImage> fileImage(
    String fileCode,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('file/image', {
            'file_code': fileCode,
          }),
        );
        return FileImage.fromJson(fetch.data!);
      });

  Future<FileRename> fileRename(
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
        return FileRename.fromJson(fetch.data!);
      });

  Future<FileSearch> fileSearch(String query) async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('search/videos', {
            'search_term': query,
          }),
        );
        return FileSearch.fromJson(fetch.data!);
      });
}
