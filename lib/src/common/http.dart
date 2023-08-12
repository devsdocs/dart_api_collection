part of '../common.dart';

class Http<T> {
  final _dio = Dio();

  Interceptors get interceptors => _dio.interceptors;

  Future<T?> getUri(Uri uri) async {
    T? data;
    try {
      return data = (await _dio.getUri<T>(uri)).data;
    } on DioException catch (_) {
      return data;
    } catch (_) {
      return data;
    }
  }

  Future<T?> post(
    String path, {
    List<MapEntry<String, String>>? fields,
    List<MapEntry<String, MultipartFile>>? files,
    FileTransferProgress? fileTransferProgress,
  }) async {
    final formData = FormData()
      ..fields.addAll(fields ?? [])
      ..files.addAll(files ?? []);
    T? data;
    try {
      return data = (await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: fileTransferProgress != null
            ? (current, total) => transferProgress.add(
                  fileTransferProgress.copyWith(current: current, total: total),
                )
            : null,
      ))
          .data;
    } on DioException catch (_) {
      return data;
    } catch (_) {
      return data;
    }
  }
}
