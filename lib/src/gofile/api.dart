part of '../gofile.dart';

///The Gofile system operates using accounts, files, and folders. With this API, you can manage an efficient file storage system. All files are organized within folders, and each folder is associated with an account. Every account has at least one root folder, which cannot be deleted.
///
///If you upload a file without specifying any parameters, a guest account and a root folder will be created, and the file will be uploaded to a new folder within the root folder. If you wish to upload multiple files, you must first upload the initial file, then obtain the folderId from the response of the request. You can then upload the remaining files one at a time, specifying the folderId as a parameter.
class GofileApi {
  GofileApi([this.token]) {
    if (ApiConfig.printLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  final String? token;
  final String _base = 'gofile.io';

  final _dio = Dio();

  Uri _apiUri(
    String unencodedPath, {
    Map<String, dynamic>? queryParameters,
    String server = 'api',
    bool isNeedTokenInParameters = true,
  }) =>
      Uri.https(
        [server, _base].joinDot,
        '/$unencodedPath',
        (isNeedTokenInParameters ? <String, dynamic>{'token': token} : {})
          ..addAll(queryParameters ?? {})
          ..removeWhere((_, v) => v == null),
      );

  ///Retrieving specific account information
  Future<GofileGetAccount> getAccount() async => Isolate.run(() async {
        final fetch = await _dio.getUri<String>(_apiUri('getAccountDetails'));

        return GofileGetAccount.fromJson(fetch.data!);
      });

  ///Returns the best server available to receive files.
  ///
  ///Example response:
  ///```json
  ///{
  ///  "status": "ok",
  ///  "data": {
  ///    "server": "store1"
  ///  }
  ///}
  ///```
  Future<GofileUploadServer> _getUploadServer() async {
    final fetchServer = await _dio
        .getUri<String>(_apiUri('getServer', isNeedTokenInParameters: false));

    return GofileUploadServer.fromJson(fetchServer.data!);
  }

  ///Upload one file on a specific server.
  ///
  ///If you specify a [folderId], the [file] will be added to this folder.
  ///
  ///Must contain one [file].
  ///
  ///If you want to upload multiple files, call [uploadFile] again and specify the [folderId] of the `first` [file] uploaded.
  ///
  ///[folderId] `The ID of a folder`.
  ///
  ///If valid, the file will be added to this folder.
  ///
  ///If undefined, a new folder will be created to receive the file.
  ///
  ///When using the folderId, you must pass the account [token] when constructing [GofileApi].
  Future<GofileLocalUpload> uploadFile(File file, [String? folderId]) async {
    if (token == null && folderId != null) {
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

    if (token != null) {
      data.fields.addAll([
        MapEntry('token', token!),
        if (folderId != null) MapEntry('folderId', folderId)
      ]);
    }

    final fetch = await _dio.postUri<String>(
      _apiUri(
        'uploadFile',
        isNeedTokenInParameters: false,
        server: uploadServer,
      ),
      data: data,
      onSendProgress: (current, total) => gofileFileTransferProgress.add(
        _GofileFileTransferProgress(
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

  Future<GofileGetContent> getContent(String contentId) async =>
      Isolate.run(() async {
        final fetch = await _dio.getUri<String>(
          _apiUri('getContent', queryParameters: {'contentId': contentId}),
        );

        return GofileGetContent.fromJson(fetch.data!);
      });

  Future<GofileCommonResult> createFolder(
    String folderName,
    String parentFolderId,
  ) async =>
      Isolate.run(() async {
        if (token == null) {
          return GofileCommonResult(status: 'Token must not be null');
        }

        final data = <String, dynamic>{
          'token': token,
          'folderName': folderName,
          'parentFolderId': parentFolderId,
        }.toJsonString;

        final fetch = await _dio.putUri<String>(
          _apiUri('createFolder', isNeedTokenInParameters: false),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return GofileCommonResult.fromJson(fetch.data!);
      });

  Future<GofileCommonResult> setOption(
    String contentId,
    _GofileOption gofileOption,
  ) async =>
      Isolate.run(() async {
        if (token == null) {
          return GofileCommonResult(status: 'Token must not be null');
        }

        final type = (await getContent(contentId)).data?.type;

        if (type == null) {
          return GofileCommonResult(status: 'Filed to check contentId type');
        }

        final isFolder = type == 'folder';

        if (isFolder && gofileOption is GofileDirectLinkOption) {
          return GofileCommonResult(status: 'Content id must be a file');
        }

        if (!isFolder && gofileOption is! GofileDirectLinkOption) {
          return GofileCommonResult(status: 'Content id must be a folder');
        }

        final option = gofileOption.name!;

        final value = gofileOption.value!;

        final data = <String, dynamic>{
          'token': token,
          'contentId': contentId,
          'option': option,
          'value': value,
        }.toJsonString;

        final fetch = await _dio.putUri<String>(
          _apiUri('setOption', isNeedTokenInParameters: false),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return GofileCommonResult.fromJson(fetch.data!);
      });

  Future<GofileCommonResult> copyContent(
    List<String> contentsIds,
    String destinationFolderId,
  ) async =>
      Isolate.run(() async {
        if (token == null) {
          return GofileCommonResult(status: 'Token must not be null');
        }

        final joinContentIds = contentsIds.joinComma;

        final data = <String, dynamic>{
          'token': token,
          'folderIdDest': destinationFolderId,
          'contentsId': joinContentIds,
        }.toJsonString;

        final fetch = await _dio.putUri<String>(
          _apiUri('copyContent', isNeedTokenInParameters: false),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return GofileCommonResult.fromJson(fetch.data!);
      });

  Future<GofileCommonResult> deleteContent(List<String> contentsIds) async =>
      Isolate.run(() async {
        if (token == null) {
          return GofileCommonResult(status: 'Token must not be null');
        }

        final joinContentIds = contentsIds.joinComma;

        final data = <String, dynamic>{
          'token': token,
          'contentsId': joinContentIds,
        }.toJsonString;

        final fetch = await _dio.deleteUri<String>(
          _apiUri('deleteContent', isNeedTokenInParameters: false),
          data: data,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

        return GofileCommonResult.fromJson(fetch.data!);
      });
}
