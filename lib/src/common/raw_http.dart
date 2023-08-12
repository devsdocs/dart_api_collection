part of '../common.dart';

class RawHttp {
  final _dio = Dio();

  Interceptors get interceptors => _dio.interceptors;

  Future<String?> deleteUri(
    Uri uri, {
    required String data,
    Options? options,
  }) async =>
      delete('$uri', data: data, options: options);

  Future<String?> delete(
    String path, {
    required String data,
    Options? options,
  }) async {
    String? data;
    try {
      return data =
          (await _dio.delete<String>(path, data: data, options: options)).data;
    } on DioException catch (e) {
      return data = '$e';
    } catch (_) {
      return data;
    }
  }

  Future<String?> getUri(Uri uri) async => get('$uri');

  Future<String?> get(String path) async {
    String? data;

    try {
      return data = (await _dio.get<String>(path)).data;
    } on DioException catch (e) {
      return data = '$e';
    } catch (_) {
      return data;
    }
  }

  Future<String?> putUri(
    Uri uri, {
    required String data,
    Options? options,
  }) async =>
      put('$uri', data: data, options: options);

  Future<String?> put(
    String path, {
    required String data,
    Options? options,
  }) async {
    String? data;

    try {
      return data =
          (await _dio.put<String>(path, data: data, options: options)).data;
    } on DioException catch (e) {
      return data = '$e';
    } catch (_) {
      return data;
    }
  }

  Future<String?> postUri(
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

  Future<String?> post(
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

    String? data;

    try {
      return data = (await _dio.post<String>(
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
      return data = '$e';
    } catch (_) {
      return data;
    }
  }
}
