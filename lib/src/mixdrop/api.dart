part of '../mixdrop.dart';

class MixdropApi {
  MixdropApi(String email, String apiKey)
      : _rawApi = _MixdropRawApi(email, apiKey);

  final _MixdropRawApi _rawApi;

  _MixdropRawApi get rawApi => _rawApi;

  Future<MixdropLocalUpload?> localUpload(File file) async {
    final str = await _rawApi.localUpload(file);

    return str != null ? MixdropLocalUpload.fromJson(str) : null;
  }

  Future<MixdropRemoteUpload?> remoteUpload(
    String url, {
    String? newName,
    int? folderId,
  }) async {
    final fetch = await _rawApi.remoteUpload(url);

    return fetch != null ? MixdropRemoteUpload.fromJson(fetch) : null;
  }

  Future<MixdropRemoteUploadStatus?> remoteUploadStatus(
    int remoteUploadId,
  ) async {
    final fetch = await _rawApi.remoteUploadStatus(remoteUploadId);

    return fetch != null ? MixdropRemoteUploadStatus.fromJson(fetch) : null;
  }

  Future<MixdropFileInfo?> fileInfo(
    List<String> fileRefs,
  ) async {
    final fetch = await _rawApi.fileInfo(fileRefs);

    return fetch != null ? MixdropFileInfo.fromJson(fetch) : null;
  }

  Future<MixdropFileDuplicate?> fileDuplicate(
    String fileRef,
  ) async {
    final fetch = await _rawApi.fileDuplicate(fileRef);

    return fetch != null ? MixdropFileDuplicate.fromJson(fetch) : null;
  }

  Future<MixdropFileRename?> fileRename(
    String fileRef,
    String newName,
  ) async {
    final fetch = await _rawApi.fileRename(fileRef, newName);

    return fetch != null ? MixdropFileRename.fromJson(fetch) : null;
  }

  Future<MixdropFileRemoved?> fileRemoved([int? page]) async {
    final fetch = await _rawApi.fileRemoved(page);
    return fetch != null ? MixdropFileRemoved.fromJson(fetch) : null;
  }

  Future<MixdropAddSubtitle?> addSubtitle(
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
      final str = await _rawApi.addSubtitle(
        fileRef,
        subtitleFile: subtitleFile,
        language: language,
      );
      return str != null ? MixdropAddSubtitle.fromJson(str) : null;
    }
  }

  Future<MixdropFolderList?> folderList([int? folderId, int? page]) async {
    final fetch = await _rawApi.folderList();

    return fetch != null ? MixdropFolderList.fromJson(fetch) : null;
  }

  Future<MixdropFolderCreate?> folderCreate(
    String folderName, [
    int? parentFolderId,
  ]) async {
    final fetch = await _rawApi.folderCreate(folderName, parentFolderId);

    return fetch != null ? MixdropFolderCreate.fromJson(fetch) : null;
  }

  Future<MixdropFolderRename?> folderRename(
    String newFolderName,
    int folderId,
  ) async {
    final fetch = await _rawApi.folderRename(newFolderName, folderId);

    return fetch != null ? MixdropFolderRename.fromJson(fetch) : null;
  }
}
