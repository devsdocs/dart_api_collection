// ignore_for_file: avoid_dynamic_calls
part of 'main.dart';

class StreamtapeApi {
  StreamtapeApi(this._user, this._apiKey, {bool enableLog = false}) {
    if (enableLog) {
      this
          ._dio
          .interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _user;
  final String _apiKey;
  final String _base = 'api.streamtape.com';

  final _dio = Dio();

  Uri _apiUri(
    String unencodedPath, {
    required bool isNeedCredentials,
    Map<String, dynamic>? queryParameters,
  }) {
    final params = (isNeedCredentials
        ? <String, dynamic>{'login': _user, 'key': _apiKey}
        : <String, dynamic>{})
      ..addAll(queryParameters ?? <String, dynamic>{})
      ..removeWhere((_, v) => v == null);
    return Uri.https(_base, '/$unencodedPath', params);
  }

  Future<AccountInfo> accountInfo() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('account/info', isNeedCredentials: true),
        );
        return AccountInfo.fromJson(fetch.data!);
      });

  Future<DownloadLink> downloadFile(String fileId) async {
    final ticketParams = {'file': fileId};
    final ticketInfo = await Isolate.run(() async {
      final fetchTicket = await _dio.getUri<String>(
        _apiUri(
          'file/dlticket',
          queryParameters: ticketParams,
          isNeedCredentials: true,
        ),
      );

      return DownloadTicket.fromJson(fetchTicket.data!);
    });

    if (ticketInfo.result != null) {
      final ticket = ticketInfo.result!.ticket!;
      final waitTime = ticketInfo.result!.waitTime;

//! return null in result in file not found
      return Isolate.run(
        () => Future.delayed(Duration(seconds: waitTime! + 1), () async {
          final params = {'file': fileId, 'ticket': ticket};
          final getDlLink = await _dio.getUri<String>(
            _apiUri(
              'file/dl',
              isNeedCredentials: false,
              queryParameters: params,
            ),
          );

          return DownloadLink.fromJson(getDlLink.data!);
        }),
      );
    } else {
      return DownloadLink();
    }
  }

  Future<FileInfo> getFileInfo(List<String> iDs) async => Isolate.run(() async {
        final params = {'file': iDs.length == 1 ? iDs.single : iDs.join(',')};
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/info',
            queryParameters: params,
            isNeedCredentials: true,
          ),
        );

        return FileInfo.fromJson(fetch.data!);
      });

  Future<UploadResult> localUpload(File file, {String? folderId}) async {
    final uploadLink = await Isolate.run(() async {
      final fetch = await _dio.getUri<String>(
        _apiUri(
          'file/ul',
          isNeedCredentials: true,
          queryParameters: {'folder': folderId},
        ),
      );

      return UploadLink.fromJson(fetch.data!);
    });

    if (uploadLink.result != null) {
      final url = Uri.parse(uploadLink.result!.url!);

      final form = FormData(camelCaseContentDisposition: true)
        ..files.add(
          MapEntry(
            'file',
            await MultipartFile.fromFile(
              file.path,
              filename: file.uri.pathSegments.last,
            ),
          ),
        );

      return Isolate.run(() async {
        final upload = await _dio.postUri<String>(
          url,
          data: form,
          options: Options(headers: {'Content-Length': form.length}),
        );

        return UploadResult.fromJson(upload.data!);
      });
    } else {
      return UploadResult();
    }
  }

  Future<RemoteUploadAdd> addRemoteUpload(
    String url, {
    String? folderId,
    String? customName,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/add',
            isNeedCredentials: true,
            queryParameters: {
              'url': url,
              'folder': folderId,
              'name': customName,
            },
          ),
        );

        return RemoteUploadAdd.fromJson(fetch.data!);
      });

  Future<RemoteUploadRemove> removeRemoteUpload({
    String? id,
    required bool removeAll,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/remove',
            isNeedCredentials: true,
            queryParameters: {
              'id': removeAll ? 'all' : id,
            },
          ),
        );

        return RemoteUploadRemove.fromJson(fetch.data!);
      });
}
