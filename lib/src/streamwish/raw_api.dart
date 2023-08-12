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

  Future<String?> accountInfo() async => Isolate.run(() async {
        final fetch = await _client.getUri(_apiUri('account/info'));

        return fetch;
      });

  Future<String?> accountReports({
    int? lastXDaysReport,
  }) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri('account/stats', {
            'last': lastXDaysReport,
          }),
        );
        return fetch;
      });

  Future<String?> getUploadServer() async {
    final fetch = await _client.getUri(_apiUri('upload/server'));
    return fetch;
  }

  /// Max 500 KB for [fileThumbnail]
  Future<String?> localUpload(
    File file, {
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
    final getUploadLink = await Isolate.run(() => getUploadServer());

    if (getUploadLink == null) return null;

    // ignore: avoid_dynamic_calls
    final uploadServer = getUploadLink.toJsonObject['result'] as String;

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
      if (isPublic != null) MapEntry('file_public', isPublic ? '1' : '0'),
      if (isAdult != null) MapEntry('file_adult', isAdult ? '1' : '0'),
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
}
