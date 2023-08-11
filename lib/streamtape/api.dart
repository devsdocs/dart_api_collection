part of 'main.dart';

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

  Future<DownloadLink> getDownloadLink(String fileId) async {
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
      return Future.delayed(Duration(seconds: waitTime! + 1), () async {
        final params = {'file': fileId, 'ticket': ticket};
        final getDlLink = await _dio.getUri<String>(
          _apiUri(
            'file/dl',
            isNeedCredentials: false,
            queryParameters: params,
          ),
        );

        return DownloadLink.fromJson(getDlLink.data!);
      });
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
      final id = await file.id;
      final url = Uri.parse(uploadLink.result!.url!);

      final form = FormData(camelCaseContentDisposition: true)
        ..files.add(
          MapEntry(
            'file',
            await MultipartFile.fromFile(
              file.path,
              filename: file.fileNameAndExt,
            ),
          ),
        );

      final upload = await _dio.postUri<String>(
        url,
        data: form,
        options: Options(headers: {'Content-Length': form.length}),
        onSendProgress: (current, total) => fileTransferProgress.add(
          FileTransferProgress(
            'streamtape_$id',
            name: file.fileNameAndExt,
            current: current,
            total: total,
            isUpload: true,
          ),
        ),
      );

      return UploadResult.fromJson(upload.data!);
    } else {
      return UploadResult();
    }
  }

  Future<RemoteUploadAdd> remoteUploadAdd(
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

//! If remoteUploadId is null, remove all current remote upload task
  Future<CommonResult> remoteUploadRemove([
    String? id,
  ]) async =>
      Isolate.run(() async {
        final params = {'id': id ?? '"all"'};
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/remove',
            isNeedCredentials: true,
            queryParameters: params,
          ),
        );

        return CommonResult.fromJson(fetch.data!);
      });

//! If remoteUploadId is null or non exist, returning all remote upload status
  Future<RemoteUploadCheck> remoteUploadCheck([String? remoteUploadId]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'remotedl/status',
            isNeedCredentials: true,
            queryParameters: {
              'id': remoteUploadId,
            },
          ),
        );

        return RemoteUploadCheck.fromJson(fetch.data!);
      });

  Future<FileAndFolderList> fileAndFolderList([String? folderId]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/listfolder',
            isNeedCredentials: true,
            queryParameters: {
              'folder': folderId,
            },
          ),
        );

        return FileAndFolderList.fromJson(fetch.data!);
      });

  Future<FolderCreate> folderCreate(
    String name, [
    String? parentFoolderId,
  ]) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'folder/createfolder',
            isNeedCredentials: true,
            queryParameters: {
              'name': name,
              'pid': parentFoolderId,
            },
          ),
        );

        return FolderCreate.fromJson(fetch.data!);
      });

  //TODO: rename folder not working somehow
  Future<CommonResult> renameFolder(String folderId, String newName) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/renamefolder',
            isNeedCredentials: true,
            queryParameters: {'folder': folderId, 'name': newName},
          ),
        );
        return CommonResult.fromJson(fetch.data!);
      });

  //TODO: delete folder not working somehow
  Future<CommonResult> deleteFolder(String folderId) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/deletefolder',
            isNeedCredentials: true,
            queryParameters: {'folder': folderId},
          ),
        );
        return CommonResult.fromJson(fetch.data!);
      });

  Future<FileThumbnail> fileThumbnail(String fileId) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/getsplash',
            isNeedCredentials: true,
            queryParameters: {'file': fileId},
          ),
        );

        return FileThumbnail.fromJson(fetch.data!);
      });

  Future<CommonResult> fileRename(String fileId, String newName) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/rename',
            isNeedCredentials: true,
            queryParameters: {
              'file': fileId,
              'name': newName,
            },
          ),
        );
        return CommonResult.fromJson(fetch.data!);
      });

  Future<CommonResult> fileMove(
    String fileId,
    String destinationFolderId,
  ) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/move',
            isNeedCredentials: true,
            queryParameters: {'file': fileId, 'folder': destinationFolderId},
          ),
        );
        return CommonResult.fromJson(fetch.data!);
      });

  Future<CommonResult> fileDelete(String fileId) async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/delete',
            isNeedCredentials: true,
            queryParameters: {'file': fileId},
          ),
        );
        return CommonResult.fromJson(fetch.data!);
      });

  Future<ConvertRunning> convertRunning() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/runningconverts',
            isNeedCredentials: true,
            queryParameters: {},
          ),
        );

        return ConvertRunning.fromJson(fetch.data!);
      });

  Future<ConvertFailed> convertFailed() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri(
            'file/failedconverts',
            isNeedCredentials: true,
            queryParameters: {},
          ),
        );

        return ConvertFailed.fromJson(fetch.data!);
      });
}
