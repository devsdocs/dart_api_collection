part of '../streamtape.dart';

class StreamtapeApi {
  StreamtapeApi(this._user, this._apiKey, {bool enableLog = false}) {
    if (enableLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _user;
  final String _apiKey;
  final String _base = 'api.streamtape.com';

  final _dio = Dio();

  Uri _apiUri(
    String unencodedPath, {
    bool isNeedCredentials = true,
    Map<String, dynamic>? queryParameters,
  }) {
    final params = (isNeedCredentials
        ? <String, dynamic>{'login': _user, 'key': _apiKey}
        : <String, dynamic>{})
      ..addAll(queryParameters ?? <String, dynamic>{})
      ..removeWhere((_, v) => v == null);
    return Uri.https(_base, '/$unencodedPath', params);
  }

  Future<StreamtapeAccountInfo> accountInfo() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('account/info'),
        );
        return StreamtapeAccountInfo.fromJson(fetch.data!);
      });

  Future<StreamtapeDownloadLink> getDownloadLink(String fileId) async {
    final ticketParams = {'file': fileId};
    final ticketInfo = await Isolate.run(() async {
      final fetchTicket = await _dio.getUri<String>(
        _apiUri(
          'file/dlticket',
          queryParameters: ticketParams,
        ),
      );

      return StreamtapeDownloadTicket.fromJson(fetchTicket.data!);
    });

    if (ticketInfo.result != null) {
      final ticket = ticketInfo.result!.ticket!;
      final waitTime = ticketInfo.result!.waitTime;

//! return null in result in file not found
      return Future.delayed(Duration(seconds: waitTime! + 1), () async {
        final params = {'file': fileId, 'ticket': ticket};
        final getDlLink = await _dio.getUri<String>(
          _apiUri(
            'file/dl',
            isNeedCredentials: false,
            queryParameters: params,
          ),
        );

        return StreamtapeDownloadLink.fromJson(getDlLink.data!);
      });
    } else {
      return StreamtapeDownloadLink();
    }
  }

  Future<StreamtapeFileInfo> getFileInfo(List<String> iDs) async =>
      Isolate.run(() async {
        final params = {'file': iDs.length == 1 ? iDs.single : iDs.join(',')};
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/info',
            queryParameters: params,
          ),
        );

        return StreamtapeFileInfo.fromJson(fetch.data!);
      });

  Future<StreamtapeUploadResult> localUpload(
    File file, {
    String? folderId,
  }) async {
    final uploadLink = await Isolate.run(() async {
      final fetch = await _dio.getUri<String>(
        _apiUri(
          'file/ul',
          queryParameters: {'folder': folderId},
        ),
      );

      return StreamtapeUploadLink.fromJson(fetch.data!);
    });

    if (uploadLink.result != null) {
      final id = await file.id;
      final url = uploadLink.result!.url!.toUri;

      final form = FormData(camelCaseContentDisposition: true)
        ..files.add(
          MapEntry(
            'file',
            await file.toMultipartWithName,
          ),
        );

      final upload = await _dio.postUri<String>(
        url,
        data: form,
        options: Options(headers: {'Content-Length': form.length}),
        onSendProgress: (current, total) => streamtapeFileTransferProgress.add(
          StreamTapeFileTransferProgress(
            id,
            name: file.fileNameAndExt,
            current: current,
            total: total,
            isUpload: true,
          ),
        ),
      );

      return StreamtapeUploadResult.fromJson(upload.data!);
    } else {
      return StreamtapeUploadResult();
    }
  }

  Future<StreamtapeRemoteUploadAdd> remoteUploadAdd(
    String url, {
    String? folderId,
    String? customName,
  }) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/add',
            queryParameters: {
              'url': url,
              'folder': folderId,
              'name': customName,
            },
          ),
        );

        return StreamtapeRemoteUploadAdd.fromJson(fetch.data!);
      });

//! If remoteUploadId is null, remove all current remote upload task
  Future<StreamtapeCommonResult> remoteUploadRemove([
    String? id,
  ]) async =>
      Isolate.run(() async {
        final params = {'id': id ?? '"all"'};
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/remove',
            queryParameters: params,
          ),
        );

        return StreamtapeCommonResult.fromJson(fetch.data!);
      });

//! If remoteUploadId is null or non exist, returning all remote upload status
  Future<StreamtapeRemoteUploadCheck> remoteUploadCheck([
    String? remoteUploadId,
  ]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/status',
            queryParameters: {
              'id': remoteUploadId,
            },
          ),
        );

        return StreamtapeRemoteUploadCheck.fromJson(fetch.data!);
      });

  Future<StreamtapeFileAndFolderList> fileAndFolderList([
    String? folderId,
  ]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/listfolder',
            queryParameters: {
              'folder': folderId,
            },
          ),
        );

        return StreamtapeFileAndFolderList.fromJson(fetch.data!);
      });

  Future<StreamtapeFolderCreate> folderCreate(
    String name, [
    String? parentFoolderId,
  ]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'folder/createfolder',
            queryParameters: {
              'name': name,
              'pid': parentFoolderId,
            },
          ),
        );

        return StreamtapeFolderCreate.fromJson(fetch.data!);
      });

  //TODO: rename folder not working somehow
  Future<StreamtapeCommonResult> renameFolder(
    String folderId,
    String newName,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/renamefolder',
            queryParameters: {'folder': folderId, 'name': newName},
          ),
        );
        return StreamtapeCommonResult.fromJson(fetch.data!);
      });

  //TODO: delete folder not working somehow
  Future<StreamtapeCommonResult> deleteFolder(String folderId) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/deletefolder',
            queryParameters: {'folder': folderId},
          ),
        );
        return StreamtapeCommonResult.fromJson(fetch.data!);
      });

  Future<StreamtapeFileThumbnail> fileThumbnail(String fileId) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/getsplash',
            queryParameters: {'file': fileId},
          ),
        );

        return StreamtapeFileThumbnail.fromJson(fetch.data!);
      });

  Future<StreamtapeCommonResult> fileRename(
    String fileId,
    String newName,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/rename',
            queryParameters: {
              'file': fileId,
              'name': newName,
            },
          ),
        );
        return StreamtapeCommonResult.fromJson(fetch.data!);
      });

  Future<StreamtapeCommonResult> fileMove(
    String fileId,
    String destinationFolderId,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/move',
            queryParameters: {'file': fileId, 'folder': destinationFolderId},
          ),
        );
        return StreamtapeCommonResult.fromJson(fetch.data!);
      });

  Future<StreamtapeCommonResult> fileDelete(String fileId) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/delete',
            queryParameters: {'file': fileId},
          ),
        );
        return StreamtapeCommonResult.fromJson(fetch.data!);
      });

  Future<StreamtapeConvertRunning> convertRunning() async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/runningconverts',
            queryParameters: {},
          ),
        );

        return StreamtapeConvertRunning.fromJson(fetch.data!);
      });

  Future<StreamtapeConvertFailed> convertFailed() async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/failedconverts',
            queryParameters: {},
          ),
        );

        return StreamtapeConvertFailed.fromJson(fetch.data!);
      });
}
