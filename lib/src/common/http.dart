part of '../common.dart';

class Http<T> {
  final _dio = Dio();

  Interceptors get interceptors => _dio.interceptors;

  Future<T?> deleteUri(
    Uri uri, {
    required String data,
    Options? options,
  }) async =>
      delete('$uri', data: data, options: options);

  Future<T?> delete(
    String path, {
    required String data,
    Options? options,
  }) async {
    T? data;
    try {
      return data =
          (await _dio.delete<T>(path, data: data, options: options)).data;
    } on DioException catch (e) {
      return data = '$e' as T;
    } catch (_) {
      return data;
    }
  }

  Future<T?> getUri(Uri uri) async => get('$uri');

  Future<T?> get(String path) async {
    T? data;

    try {
      return data = (await _dio.get<T>(path)).data;
    } on DioException catch (e) {
      return data = '$e' as T;
    } catch (_) {
      return data;
    }
  }

  Future<T?> putUri(Uri uri, {required String data, Options? options}) async =>
      put('$uri', data: data, options: options);

  Future<T?> put(String path, {required String data, Options? options}) async {
    T? data;

    try {
      return data =
          (await _dio.put<T>(path, data: data, options: options)).data;
    } on DioException catch (e) {
      return data = '$e' as T;
    } catch (_) {
      return data;
    }
  }

  Future<T?> postUri(
    Uri uri, {
    List<MapEntry<String, String>>? fields,
    List<MapEntry<String, MultipartFile>>? files,
    FileTransferProgress? fileTransferProgress,
    Options? options,
    bool camelCaseContentDisposition = false,
  }) async =>
      post(
        '$uri',
        fields: fields,
        files: files,
        fileTransferProgress: fileTransferProgress,
        options: options,
        camelCaseContentDisposition: camelCaseContentDisposition,
      );

  Future<T?> post(
    String path, {
    List<MapEntry<String, String>>? fields,
    List<MapEntry<String, MultipartFile>>? files,
    FileTransferProgress? fileTransferProgress,
    Options? options,
    bool camelCaseContentDisposition = false,
  }) async {
    final formData =
        FormData(camelCaseContentDisposition: camelCaseContentDisposition)
          ..fields.addAll(fields ?? [])
          ..files.addAll(files ?? []);

    T? data;

    try {
      return data = (await _dio.post<T>(
        path,
        data: formData,
        options: options,
        onSendProgress: fileTransferProgress != null
            ? (current, total) => transferProgress.add(
                  fileTransferProgress.copyWith(current: current, total: total),
                )
            : null,
      ))
          .data;
    } on DioException catch (e) {
      return data = '$e' as T;
    } catch (_) {
      return data;
    }
  }
}
