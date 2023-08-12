part of '../gofile.dart';

class _GofileRawApi {
  _GofileRawApi([this.token]) {
    if (ApiConfig.printLog) {
      _client.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
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

  Future<String?> accountInfo() async => Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri('getAccountDetails', isNeedTokenInParameters: true),
        );

        return fetch;
      });

  Future<String?> getUploadServer() async {
    final fetch = await _client
        .getUri(_apiUri('getServer', isNeedTokenInParameters: true));

    return fetch;
  }

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

    final fetch = await _client.postUri(
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

    return fetch;
  }

  Future<String?> getContent(String contentId) async => Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'getContent',
            queryParameters: {'contentId': contentId},
            isNeedTokenInParameters: true,
          ),
        );

        return fetch;
      });

  Future<String?> createFolder(
    String folderName,
    String parentFolderId,
  ) async =>
      Isolate.run(() async {
        final data = <String, dynamic>{
          'token': token,
          'folderName': folderName,
          'parentFolderId': parentFolderId,
        }.toJsonString;

        final fetch = await _client.putUri(
          _apiUri('createFolder'),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return fetch;
      });

  Future<String?> setOption(
    String contentId,
    _GofileOption gofileOption,
  ) async =>
      Isolate.run(() async {
        final option = gofileOption.name!;

        final value = gofileOption.value!;

        final data = <String, dynamic>{
          'token': token,
          'contentId': contentId,
          'option': option,
          'value': value,
        }.toJsonString;

        final fetch = await _client.putUri(
          _apiUri('setOption'),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return fetch;
      });

  Future<String?> copyContent(
    List<String> contentsIds,
    String destinationFolderId,
  ) async =>
      Isolate.run(() async {
        final joinContentIds = contentsIds.joinComma;

        final data = <String, dynamic>{
          'token': token,
          'folderIdDest': destinationFolderId,
          'contentsId': joinContentIds,
        }.toJsonString;

        final fetch = await _client.putUri(
          _apiUri('copyContent'),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return fetch;
      });

  Future<String?> deleteContent(List<String> contentsIds) async =>
      Isolate.run(() async {
        final joinContentIds = contentsIds.joinComma;

        final data = <String, dynamic>{
          'token': token,
          'contentsId': joinContentIds,
        }.toJsonString;

        final fetch = await _client.deleteUri(
          _apiUri('deleteContent'),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return fetch;
      });
}
