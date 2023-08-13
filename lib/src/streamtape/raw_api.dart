part of '../streamtape.dart';

class _StreamtapeRawApi {
  _StreamtapeRawApi(this._user, this._apiKey) {
    if (ApiConfig.printLog) {
      _client.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _user;
  final String _apiKey;
  final String _base = 'api.streamtape.com';

  final _client = RawHttp();

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

  Future<String?> accountInfo() async {
    final fetch = await _client.getUri(
      _apiUri('account/info'),
    );
    return fetch;
  }

  Future<String?> getDownloadTicket(String fileId) async {
    final ticketParams = {'file': fileId};
    final fetchTicket = await _client.getUri(
      _apiUri(
        'file/dlticket',
        queryParameters: ticketParams,
      ),
    );

    return fetchTicket;
  }

  Future<String?> getDownloadLink(
    String fileId,
    StreamtapeDownloadTicketResult ticketInfo,
  ) async {
    final ticket = ticketInfo.ticket!;
    final waitTime = ticketInfo.waitTime;

//! return null in result in file not found
    return Future.delayed(Duration(seconds: waitTime! + 1), () async {
      final params = {'file': fileId, 'ticket': ticket};
      final getDlLink = await _client.getUri(
        _apiUri(
          'file/dl',
          isNeedCredentials: false,
          queryParameters: params,
        ),
      );

      return getDlLink;
    });
  }

  Future<String?> getFileInfo(List<String> iDs) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/info',
        queryParameters: {'file': iDs.joinComma},
      ),
    );

    return fetch;
  }

  Future<String?> getUploadLink([String? folderId]) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/ul',
        queryParameters: {'folder': folderId},
      ),
    );

    return fetch;
  }

  Future<String?> localUpload(
    File file, {
    required Uri url,
  }) async {
    final id = await file.id;

    final files = [
      MapEntry(
        'file',
        await file.toMultipartWithName,
      )
    ];

    final upload = await _client.postUri(
      url,
      files: files,
      camelCaseContentDisposition: true,
      fileTransferProgress: FileTransferProgress(
        id,
        type: ServiceType.streamtape,
        name: file.fileNameAndExt,
        isUpload: true,
      ),
    );

    return upload;
  }

  Future<String?> remoteUploadAdd(
    String url, {
    String? folderId,
    String? customName,
  }) async {
    final fetch = await _client.getUri(
      _apiUri(
        'remotedl/add',
        queryParameters: {
          'url': url,
          'folder': folderId,
          'name': customName,
        },
      ),
    );

    return fetch;
  }

//! If remoteUploadId is null, remove all current remote upload task
  Future<String?> remoteUploadRemove([
    String? id,
  ]) async {
    final params = {'id': id ?? '"all"'};
    final fetch = await _client.getUri(
      _apiUri(
        'remotedl/remove',
        queryParameters: params,
      ),
    );

    return fetch;
  }

//! If remoteUploadId is null or non exist, returning all remote upload status
  Future<String?> remoteUploadCheck([
    String? remoteUploadId,
  ]) async {
    final fetch = await _client.getUri(
      _apiUri(
        'remotedl/status',
        queryParameters: {
          'id': remoteUploadId,
        },
      ),
    );

    return fetch;
  }

  Future<String?> fileAndFolderList([
    String? folderId,
  ]) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/listfolder',
        queryParameters: {
          'folder': folderId,
        },
      ),
    );

    return fetch;
  }

  Future<String?> folderCreate(
    String name, [
    String? parentFoolderId,
  ]) async {
    final fetch = await _client.getUri(
      _apiUri(
        'folder/createfolder',
        queryParameters: {
          'name': name,
          'pid': parentFoolderId,
        },
      ),
    );

    return fetch;
  }

  //TODO: rename folder not working somehow
  Future<String?> renameFolder(
    String folderId,
    String newName,
  ) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/renamefolder',
        queryParameters: {'folder': folderId, 'name': newName},
      ),
    );
    return fetch;
  }

  //TODO: delete folder not working somehow
  Future<String?> deleteFolder(String folderId) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/deletefolder',
        queryParameters: {'folder': folderId},
      ),
    );
    return fetch;
  }

  Future<String?> fileThumbnail(String fileId) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/getsplash',
        queryParameters: {'file': fileId},
      ),
    );

    return fetch;
  }

  Future<String?> fileRename(
    String fileId,
    String newName,
  ) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/rename',
        queryParameters: {
          'file': fileId,
          'name': newName,
        },
      ),
    );
    return fetch;
  }

  Future<String?> fileMove(
    String fileId,
    String destinationFolderId,
  ) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/move',
        queryParameters: {'file': fileId, 'folder': destinationFolderId},
      ),
    );
    return fetch;
  }

  Future<String?> fileDelete(String fileId) async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/delete',
        queryParameters: {'file': fileId},
      ),
    );
    return fetch;
  }

  Future<String?> convertRunning() async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/runningconverts',
        queryParameters: {},
      ),
    );

    return fetch;
  }

  Future<String?> convertFailed() async {
    final fetch = await _client.getUri(
      _apiUri(
        'file/failedconverts',
        queryParameters: {},
      ),
    );

    return fetch;
  }
}
