part of '../gofile.dart';

class GofileApi {
  GofileApi({String? token, bool enableLog = false}) : _token = token {
    if (enableLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  final String? _token;
  final String _base = 'gofile.io';

  final _dio = Dio();

  Uri _apiUri(
    String unencodedPath, {
    Map<String, dynamic>? queryParameters,
    String uploadServer = 'api',
    bool isNeedTokenInParameters = true,
  }) =>
      Uri.https(
        [uploadServer, _base].joinDot,
        '/$unencodedPath',
        (isNeedTokenInParameters ? <String, dynamic>{'token': _token} : {})
          ..addAll(queryParameters ?? {})
          ..removeWhere((_, v) => v == null),
      );

  Future<GofileUploadServer> _getUploadServer() async {
    final fetchServer = await _dio
        .getUri<String>(_apiUri('getServer', isNeedTokenInParameters: false));

    return GofileUploadServer.fromJson(fetchServer.data!);
  }

  Future<GofileLocalUpload> uploadFile(File file, [String? folderId]) async {
    if (_token == null && folderId != null) {
      return GofileLocalUpload(
        status: 'Token must not be null when passing folderId',
      );
    }

    final uploadServer =
        (await Isolate.run(() async => _getUploadServer())).data?.server;

    if (uploadServer == null) {
      return GofileLocalUpload(status: 'Error retrieving upload server');
    }

    final id = await file.id;

    final data = FormData()
      ..files.add(MapEntry('file', await file.toMultipart));

    if (_token != null) {
      data.fields.addAll([
        MapEntry('token', _token!),
        if (folderId != null) MapEntry('folderId', folderId)
      ]);
    }

    final fetch = await _dio.postUri<String>(
      _apiUri(
        'uploadFile',
        isNeedTokenInParameters: false,
        uploadServer: uploadServer,
      ),
      data: data,
      onSendProgress: (current, total) => gofileFileTransferProgress.add(
        GofileFileTransferProgress(
          id,
          name: file.fileNameAndExt,
          current: current,
          total: total,
          isUpload: true,
        ),
      ),
    );

    return GofileLocalUpload.fromJson(fetch.data!);
  }
}
