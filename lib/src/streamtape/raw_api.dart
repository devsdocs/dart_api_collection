part of '../streamtape.dart';

class _StreamtapeRawApi {
  _StreamtapeRawApi(this._user, this._apiKey) {
    initLog(_client);
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
      ..removeWhere((_, v) => v == null || v == 'null');
    return Uri.https(_base, '/$unencodedPath', params);
  }

  ///Everything account related (total used storage, reward, ...)
  Future<String?> accountInfo() => _client.getUri(
        _apiUri('account/info'),
      );

  ///Preparing a Download for [getDownloadLink]
  Future<String?> getDownloadTicket(String fileId) async {
    final ticketParams = {'file': fileId};
    return _client.getUri(
      _apiUri(
        'file/dlticket',
        queryParameters: ticketParams,
      ),
    );
  }

  ///Get a download link by using [getDownloadTicket] result
  Future<String?> getDownloadLink(
    String fileId,
    StreamtapeDownloadTicketResult ticketInfo,
  ) async {
    final ticket = ticketInfo.ticket!;
    final waitTime = ticketInfo.waitTime;

//! return null in result in file not found
    return Future.delayed(Duration(seconds: waitTime! + 1), () async {
      final params = {'file': fileId, 'ticket': ticket};
      return _client.getUri(
        _apiUri(
          'file/dl',
          isNeedCredentials: false,
          queryParameters: params,
        ),
      );
    });
  }

  ///Check the status of a file, e.g. if the file exists
  Future<String?> getFileInfo(List<String> iDs) => _client.getUri(
        _apiUri(
          'file/info',
          queryParameters: {'file': iDs.joinComma},
        ),
      );

  ///Get an Upload URL for [localUpload]
  Future<String?> getUploadLink([String? folderId]) => _client.getUri(
        _apiUri(
          'file/ul',
          queryParameters: {'folder': folderId},
        ),
      );

  ///Upload local [file] using [url] from [getUploadLink]
  Future<String?> localUpload(
    File file, {
    required Uri url,
  }) async {
    final id = await file.id;

    final files = [MapEntry('file', await file.toMultipart)];

    return _client.postUri(
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
  }

  ///Remote Uploading a file
  Future<String?> remoteUploadAdd(
    String url, {
    String? folderId,
    String? customName,
  }) =>
      _client.getUri(
        _apiUri(
          'remotedl/add',
          queryParameters: {
            'url': url,
            'folder': folderId,
            'name': customName,
          },
        ),
      );

  ///Removing/Cancelling a remote upload
  ///
  /// If [remoteUploadId] is not provided, it will remove all current remote upload task
  Future<String?> remoteUploadRemove([
    String? remoteUploadId,
  ]) async {
    final params = {'id': remoteUploadId ?? '"all"'};
    return _client.getUri(
      _apiUri(
        'remotedl/remove',
        queryParameters: params,
      ),
    );
  }

  ///Check Status of Remote Upload
  ///
  /// If [remoteUploadId] is not provided, will returning all remote upload status
  Future<String?> remoteUploadCheck([
    String? remoteUploadId,
  ]) =>
      _client.getUri(
        _apiUri(
          'remotedl/status',
          queryParameters: {
            'id': remoteUploadId,
          },
        ),
      );

  ///Shows the content of your folders
  Future<String?> fileAndFolderList([
    String? folderId,
  ]) =>
      _client.getUri(
        _apiUri(
          'file/listfolder',
          queryParameters: {
            'folder': folderId,
          },
        ),
      );

  ///Creates a new Folder
  Future<String?> folderCreate(
    String name, [
    String? parentFoolderId,
  ]) =>
      _client.getUri(
        _apiUri(
          'folder/createfolder',
          queryParameters: {
            'name': name,
            'pid': parentFoolderId,
          },
        ),
      );

  ///TODO: rename folder not working somehow
  ///
  ///Renames a Folder
  Future<String?> renameFolder(
    String folderId,
    String newName,
  ) =>
      _client.getUri(
        _apiUri(
          'file/renamefolder',
          queryParameters: {'folder': folderId, 'name': newName},
        ),
      );

  ///TODO: delete folder not working somehow
  ///
  ///Deletes a Folder with all subfolders and all files in it. Be careful!
  Future<String?> deleteFolder(String folderId) => _client.getUri(
        _apiUri(
          'file/deletefolder',
          queryParameters: {'folder': folderId},
        ),
      );

  ///Shows the video Thumbnail
  Future<String?> fileThumbnail(String fileId) => _client.getUri(
        _apiUri(
          'file/getsplash',
          queryParameters: {'file': fileId},
        ),
      );

  ///Renames a File
  Future<String?> fileRename(
    String fileId,
    String newName,
  ) =>
      _client.getUri(
        _apiUri(
          'file/rename',
          queryParameters: {
            'file': fileId,
            'name': newName,
          },
        ),
      );

  ///Moves a File into a different folder
  Future<String?> fileMove(
    String fileId,
    String destinationFolderId,
  ) =>
      _client.getUri(
        _apiUri(
          'file/move',
          queryParameters: {'file': fileId, 'folder': destinationFolderId},
        ),
      );

  ///Removes a file
  Future<String?> fileDelete(String fileId) => _client.getUri(
        _apiUri(
          'file/delete',
          queryParameters: {'file': fileId},
        ),
      );

  ///It lists all running converts with their progress
  Future<String?> convertRunning() => _client.getUri(
        _apiUri('file/runningconverts'),
      );

  ///It lists all converts which failed.
  Future<String?> convertFailed() => _client.getUri(
        _apiUri('file/failedconverts'),
      );
}
