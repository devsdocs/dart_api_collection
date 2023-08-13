part of '../streamwish.dart';

class _StreamwishRawApi {
  _StreamwishRawApi(this._apiKey) {
    if (ApiConfig.printLog) {
      _client.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  final String _apiKey;
  final String _base = 'api.streamwish.com';
  final _client = RawHttp();

  Uri _apiUri(String unencodedPath, [Map<String, dynamic>? queryParameters]) =>
      Uri.https(
        _base,
        '/api/$unencodedPath',
        <String, dynamic>{'key': _apiKey}
          ..addAll(queryParameters ?? {})
          ..removeWhere((_, v) => v == null),
      );

  Future<String?> accountInfo() async {
    final fetch = await _client.getUri(_apiUri('account/info'));

    return fetch;
  }

  ///[lastXDaysReport] show stats for last X days (default: 7)
  Future<String?> accountReports({
    int? lastXDaysReport,
  }) async {
    final fetch = await _client.getUri(
      _apiUri('account/stats', {
        'last': lastXDaysReport,
      }),
    );
    return fetch;
  }

  Future<String?> getUploadServer() async {
    final fetch = await _client.getUri(_apiUri('upload/server'));
    return fetch;
  }

  /// [file] Video files
  ///
  /// [fileTitle] Titile of video
  ///
  /// [fileDescription] Description of video
  ///
  /// Max 500 KB for [fileThumbnail], custom video snapshot
  Future<String?> localUpload(
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
    final id = await file.id;
    final name = file.fileNameAndExt;

    final files = [
      MapEntry('file', await file.toMultipart),
      if (fileThumbnail != null)
        MapEntry('snapshot', await fileThumbnail.toMultipart),
    ];
    final fields = [
      MapEntry('key', _apiKey),
      if (fileTitle != null) MapEntry('file_title', fileTitle),
      if (fileDescription != null) MapEntry('file_descr', fileDescription),
      if (folderId != null) MapEntry('fld_id', folderId.toString()),
      if (categoryId != null) MapEntry('cat_id', categoryId.toString()),
      if (tags != null) MapEntry('tags', tags.joinComma),
      if (isPublic != null) MapEntry('file_public', isPublic.toStringFlag),
      if (isAdult != null) MapEntry('file_adult', isAdult.toStringFlag),
    ];

    final upload = await _client.post(
      uploadServer,
      fields: fields,
      files: files,
      fileTransferProgress: FileTransferProgress(
        id,
        type: ServiceType.doodstream,
        name: name,
        isUpload: true,
      ),
    );

    return upload;
  }

  Future<String?> remoteUpload(
    Uri uri, {
    int? folderId,
    int? categoryId,
    bool? isPublic,
    bool? isAdult,
    List<String>? tags,
  }) async {
    final fetch = await _client.getUri(
      _apiUri('upload/url', {
        'url': '$uri',
        'fld_id': folderId,
        'cat_id': categoryId,
        'file_public': isPublic.toStringFlagOrNull,
        'file_adult': isAdult.toStringFlagOrNull,
        'tags': tags?.joinComma,
      }),
    );

    return fetch;
  }

  Future<String?> fileInfo(List<String> filesCode) async {
    final fetch = await _client.getUri(
      _apiUri('file/info', {
        'file_code': filesCode.joinComma,
      }),
    );

    return fetch;
  }

  Future<String?> fileEdit(
    List<String> filesCode, {
    String? fileTitle,
    String? fileDescription,
    int? categoryId,
    int? folderId,
    bool? isPublic,
    bool? isAdult,
    List<String>? tags,
  }) async {
    final fetch = await _client.getUri(
      _apiUri('file/edit', {
        'file_code': filesCode.joinComma,
        'file_title': fileTitle,
        'file_descr': fileDescription,
        'cat_id': categoryId,
        'file_fld_id': folderId,
        'file_public': isPublic.toStringFlagOrNull,
        'file_adult': isAdult.toStringFlagOrNull,
        'tags': tags?.joinComma,
      }),
    );

    return fetch;
  }

  Future<String?> fileList({
    int? folderId,
    String? title,
    bool? isPublic,
    bool? isAdult,
    int? resultPerPage,
    int? pageNumber,
    DateTime? time,
  }) async {
    final formatTime =
        time != null ? Jiffy.parseFromDateTime(time).toYYYYMMDDHMS : null;

    final fetch = await _client.getUri(
      _apiUri('file/edit', {
        'fld_id': folderId,
        'title': title,
        'created': formatTime,
        'public': isPublic.toStringFlagOrNull,
        'adult': isAdult.toStringFlagOrNull,
        'per_page': resultPerPage,
        'page': pageNumber,
      }),
    );

    return fetch;
  }
}
