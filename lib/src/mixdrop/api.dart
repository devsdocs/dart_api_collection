part of '../mixdrop.dart';

class MixdropApi {
  MixdropApi(this._email, this._apiKey) {
    if (ApiConfig.printLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _email;
  final String _apiKey;
  final String _base = 'mixdrop.co';

  final _dio = Dio();

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

  Future<MixdropLocalUpload> localUpload(File file) async {
    final id = await file.id;
    final name = file.fileNameAndExt;

    final form = FormData()
      ..files.add(MapEntry('file', await file.toMultipart))
      ..fields.addAll([MapEntry('email', _email), MapEntry('key', _apiKey)]);

    final fetch = await _dio.postUri<String>(
      _apiUri(
        'api',
        server: 'ul',
        isNotNeedCredentials: true,
      ),
      data: form,
      onSendProgress: (current, total) => mixdropFileTransferProgress.add(
        _MixdropFileTransferProgress(
          id,
          name: name,
          current: current,
          total: total,
          isUpload: true,
        ),
      ),
    );

    return MixdropLocalUpload.fromJson(fetch.data!);
  }

  Future<MixdropRemoteUpload> remoteUpload(
    String url, {
    String? newName,
    int? folderId,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remoteupload',
            queryParameters: {
              'url': Uri.encodeFull(url),
              'name': newName,
              'folder': '$folderId'
            },
          ),
        );

        return MixdropRemoteUpload.fromJson(fetch.data!);
      });

  Future<MixdropRemoteUploadStatus> remoteUploadStatus(
    int remoteUploadId,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotestatus',
            queryParameters: {
              'id': '$remoteUploadId',
            },
          ),
        );

        return MixdropRemoteUploadStatus.fromJson(fetch.data!);
      });

  Future<MixdropFileInfo> fileInfo(
    List<String> fileRefs,
  ) async =>
      Isolate.run(() async {
        final join = fileRefs
            .map(
              (value) => fileRefs.indexOf(value) == 0 ? value : 'ref[]=$value',
            )
            .join('&');

        final fetch = await _dio.getUri<String>(
          _apiUri(
            'fileinfo2',
            queryParameters: {'ref[]': join},
            isNeedDecode: true,
          ),
        );

        return MixdropFileInfo.fromJson(fetch.data!);
      });

  Future<MixdropFileDuplicate> fileDuplicate(
    String fileRef,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'fileduplicate',
            queryParameters: {'ref': fileRef},
          ),
        );

        return MixdropFileDuplicate.fromJson(fetch.data!);
      });

  Future<MixdropFileRename> fileRename(
    String fileRef,
    String newName,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'filerename',
            queryParameters: {'ref': fileRef, 'title': newName},
          ),
        );

        return MixdropFileRename.fromJson(fetch.data!);
      });

  Future<MixdropFileRemoved> fileRemoved([int? page]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'removed',
            queryParameters: {'page': '$page'},
          ),
        );

        return MixdropFileRemoved.fromJson(fetch.data!);
      });

  Future<MixdropAddSubtitle> addSubtitle(
    String fileRef, {
    required File subtitleFile,
    required SubtitleLanguage language,
  }) async {
    if (subtitleFile.fileExt != 'srt' && subtitleFile.fileExt != 'vtt') {
      return MixdropAddSubtitle(
        success: false,
        result: 'Invalid file extension',
      );
    } else {
      final form = FormData()
        ..fields.add(MapEntry('lang', '$language'))
        ..files.add(MapEntry('file', await subtitleFile.toMultipart));

      final fetch = await _dio.postUri<String>(
        _apiUri('addsubtitle', queryParameters: {'ref': fileRef}),
        data: form,
      );

      return MixdropAddSubtitle.fromJson(fetch.data!);
    }
  }

  Future<MixdropFolderList> folderList([int? folderId, int? page]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'folderlist',
            queryParameters: {'id': '$folderId', 'page': '$page'},
          ),
        );

        return MixdropFolderList.fromJson(fetch.data!);
      });

  Future<MixdropFolderCreate> folderCreate(
    String folderName, [
    int? parentFolderId,
  ]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'foldercreate',
            queryParameters: {'title': folderName, 'parent': '$parentFolderId'},
          ),
        );

        return MixdropFolderCreate.fromJson(fetch.data!);
      });

  Future<MixdropFolderRename> folderRename(
    String newFolderName,
    int folderId,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'folderrename',
            queryParameters: {'id': '$folderId', 'title': newFolderName},
          ),
        );

        return MixdropFolderRename.fromJson(fetch.data!);
      });
}
