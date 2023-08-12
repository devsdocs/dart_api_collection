part of '../mixdrop.dart';

class _MixdropRawApi {
  _MixdropRawApi(this._email, this._apiKey) {
    if (ApiConfig.printLog) {
      _client.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _email;
  final String _apiKey;
  final String _base = 'mixdrop.co';

  final _client = Http<String>();

  Uri _apiUri(
    String unencodedPath, {
    bool isNotNeedCredentials = false,
    Map<String, dynamic>? queryParameters,
    String server = 'api',
    bool isNeedDecode = false,
  }) {
    final params = (isNotNeedCredentials
        ? <String, dynamic>{}
        : <String, dynamic>{'email': _email, 'key': _apiKey})
      ..addAll(queryParameters ?? <String, dynamic>{})
      ..removeWhere((_, v) => v == null);

    final uri = Uri.https(
      [server, _base].joinDot,
      '/$unencodedPath',
      params,
    );

    final parseDecode = Uri.parse(Uri.decodeFull(uri.toString()));

    final finalUri = isNeedDecode ? parseDecode : uri;

    return finalUri;
  }

  Future<String?> localUpload(File file) async {
    final id = await file.id;
    final name = file.fileNameAndExt;

    final files = [MapEntry('file', await file.toMultipart)];
    final fields = [MapEntry('email', _email), MapEntry('key', _apiKey)];

    final fetch = await _client.postUri(
      _apiUri(
        'api',
        server: 'ul',
        isNotNeedCredentials: true,
      ),
      fields: fields,
      files: files,
      fileTransferProgress: FileTransferProgress(
        id,
        type: ServiceType.mixdrop,
        name: name,
        isUpload: true,
      ),
    );

    return fetch;
  }

  Future<String?> remoteUpload(
    String url, {
    String? newName,
    int? folderId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'remoteupload',
            queryParameters: {
              'url': Uri.encodeFull(url),
              'name': newName,
              'folder': '$folderId'
            },
          ),
        );

        return fetch;
      });

  Future<String?> remoteUploadStatus(
    int remoteUploadId,
  ) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'remotestatus',
            queryParameters: {
              'id': '$remoteUploadId',
            },
          ),
        );

        return fetch;
      });

  Future<String?> fileInfo(
    List<String> fileRefs,
  ) async =>
      Isolate.run(() async {
        final join = fileRefs
            .map(
              (value) => fileRefs.indexOf(value) == 0 ? value : 'ref[]=$value',
            )
            .join('&');

        final fetch = await _client.getUri(
          _apiUri(
            'fileinfo2',
            queryParameters: {'ref[]': join},
            isNeedDecode: true,
          ),
        );

        return fetch;
      });

  Future<String?> fileDuplicate(
    String fileRef,
  ) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'fileduplicate',
            queryParameters: {'ref': fileRef},
          ),
        );

        return fetch;
      });

  Future<String?> fileRename(
    String fileRef,
    String newName,
  ) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'filerename',
            queryParameters: {'ref': fileRef, 'title': newName},
          ),
        );

        return fetch;
      });

  Future<String?> fileRemoved([int? page]) async => Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'removed',
            queryParameters: {'page': '$page'},
          ),
        );

        return fetch;
      });

  Future<String?> addSubtitle(
    String fileRef, {
    required File subtitleFile,
    required SubtitleLanguage language,
  }) async {
    final id = await subtitleFile.id;
    final fields = [MapEntry('lang', '$language')];
    final files = [MapEntry('file', await subtitleFile.toMultipart)];

    final fetch = await _client.postUri(
      _apiUri('addsubtitle', queryParameters: {'ref': fileRef}),
      fields: fields,
      files: files,
      fileTransferProgress: FileTransferProgress(
        id,
        type: ServiceType.mixdrop,
        name: subtitleFile.fileNameAndExt,
        isUpload: true,
      ),
    );

    return fetch;
  }

  Future<String?> folderList([int? folderId, int? page]) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'folderlist',
            queryParameters: {'id': '$folderId', 'page': '$page'},
          ),
        );

        return fetch;
      });

  Future<String?> folderCreate(
    String folderName, [
    int? parentFolderId,
  ]) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'foldercreate',
            queryParameters: {'title': folderName, 'parent': '$parentFolderId'},
          ),
        );

        return fetch;
      });

  Future<String?> folderRename(
    String newFolderName,
    int folderId,
  ) async =>
      Isolate.run(() async {
        final fetch = await _client.getUri(
          _apiUri(
            'folderrename',
            queryParameters: {'id': '$folderId', 'title': newFolderName},
          ),
        );

        return fetch;
      });
}
