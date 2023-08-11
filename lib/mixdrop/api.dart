part of 'main.dart';

class MixdropApi {
  MixdropApi(this._email, this._apiKey, {bool enableLog = false}) {
    if (enableLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _email;
  final String _apiKey;
  final String _base = 'api.mixdrop.co';
  final String _postBase = 'ul.mixdrop.co';

  final _dio = Dio();

  Uri _apiUri(
    String unencodedPath, {
    bool? isNotNeedCredentials,
    Map<String, dynamic>? queryParameters,
    bool? isPost,
  }) {
    final params = (isNotNeedCredentials != null
        ? isNotNeedCredentials
            ? <String, dynamic>{}
            : <String, dynamic>{'email': _email, 'key': _apiKey}
        : <String, dynamic>{'email': _email, 'key': _apiKey})
      ..addAll(queryParameters ?? <String, dynamic>{})
      ..removeWhere((_, v) => v == null);
    return Uri.https(
      isPost != null
          ? isPost
              ? _postBase
              : _base
          : _base,
      '/$unencodedPath',
      params,
    );
  }

  Future<Upload> localUpload(File file) async {
    final id = await file.id;
    final name = file.fileNameAndExt;

    final form = FormData()
      ..files.add(MapEntry('file', await MultipartFile.fromFile(file.path)))
      ..fields.addAll([MapEntry('email', _email), MapEntry('key', _apiKey)]);

    final fetch = await _dio.postUri<String>(
      _apiUri(
        'api',
        isPost: true,
        isNotNeedCredentials: true,
      ),
      data: form,
      onSendProgress: (current, total) => fileTransferProgress.add(
        FileTransferProgress(
          'mixdrop_$id',
          name: name,
          current: current,
          total: total,
          isUpload: true,
        ),
      ),
    );

    return Upload.fromJson(fetch.data!);
  }
}
