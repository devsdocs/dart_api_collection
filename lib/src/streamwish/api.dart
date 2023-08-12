part of '../streamwish.dart';

class StreamwishApi {
  StreamwishApi(String apiKey) : _rawApi = _StreamwishRawApi(apiKey);

  final _StreamwishRawApi _rawApi;

  _StreamwishRawApi get rawApi => _rawApi;

  // Future<String> accountInfo() async => Isolate.run(() async {
  //       final fetch = await _dio.getUri<String>(_apiUri('account/info'));

  //       return fetch.data!;
  //       // DoodstreamAccountInfo.fromJson(fetch.data!);
  //     });

  // Future<String> accountReports({
  //   int? lastXDaysReport,
  // }) async =>
  //     Isolate.run(() async {
  //       final fetch = await _dio.getUri<String>(
  //         _apiUri('account/stats', {
  //           'last': lastXDaysReport,
  //         }),
  //       );
  //       return fetch.data!;
  //       // DoodstreamAccountReport.fromJson(fetch.data!);
  //     });

  // /// Max 500 KB for [fileThumbnail]
  // Future<String> localUpload(
  //   File file, {
  //   String? fileTitle,
  //   String? fileDescription,
  //   File? fileThumbnail,
  //   int? folderId,
  //   int? categoryId,
  //   List<String>? tags,
  //   bool? isPublic,
  //   bool? isAdult,
  // }) async {
  //   final id = await file.id;
  //   final name = file.fileNameAndExt;
  //   final getUploadLink = await Isolate.run(
  //     () => _dio.getUri<String>(_apiUri('upload/server')),
  //   );

  //   // ignore: avoid_dynamic_calls
  //   final uploadServer = getUploadLink.data!.toJsonObject['result'] as String;

  //   final data = FormData()
  //     ..files.addAll([
  //       MapEntry('file', await file.toMultipart),
  //       if (fileThumbnail != null)
  //         MapEntry('snapshot', await fileThumbnail.toMultipart),
  //     ])
  //     ..fields.addAll([
  //       MapEntry('key', _apiKey),
  //       if (fileTitle != null) MapEntry('file_title', fileTitle),
  //       if (fileDescription != null) MapEntry('file_descr', fileDescription),
  //       if (folderId != null) MapEntry('fld_id', folderId.toString()),
  //       if (categoryId != null) MapEntry('cat_id', categoryId.toString()),
  //       if (tags != null) MapEntry('tags', tags.joinComma),
  //       if (isPublic != null) MapEntry('file_public', isPublic ? '1' : '0'),
  //       if (isAdult != null) MapEntry('file_adult', isAdult ? '1' : '0'),
  //     ]);

  //   final upload = await _dio.post<String>(
  //     uploadServer,
  //     data: data,
  //     onSendProgress: (current, total) => transferProgress.add(
  //       FileTransferProgress(
  //         id,
  //         type: ServiceType.doodstream,
  //         name: name,
  //         current: current,
  //         total: total,
  //         isUpload: true,
  //       ),
  //     ),
  //   );

  //   return upload.data!;
  //   // DoodstreamLocalUpload.fromJson(upload.data!);
  // }
}
