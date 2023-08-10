part of 'main.dart';

class MixdropApi {
  MixdropApi(this._email, this._apiKey, {bool enableLog = false}) {
    if (enableLog) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
  final String _email;
  final String _apiKey;

  final _dio = Dio();
}
