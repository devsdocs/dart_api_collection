part of '../common.dart';

class ApiConfig {
  static _LogConfig get logConfig => _logConfig ??= _LogConfig();

  static set logConfig(_LogConfig value) => _logConfig = value;

  static _LogConfig? _logConfig;
}

void initLog(RawHttp client) {
  final logConfig = ApiConfig.logConfig;
  if (logConfig.enableLog) {
    client.interceptors.add(
      LogInterceptor(
        requestBody: logConfig.showRequestBody,
        responseBody: logConfig.showResponseBody,
        error: logConfig.showError,
        request: logConfig.showRequest,
        requestHeader: logConfig.showRequestHeader,
        responseHeader: logConfig.showResponseHeader,
      ),
    );
  }
}

class _LogConfig {
  factory _LogConfig({
    bool enableLog = false,
    bool request = true,
    bool requestHeader = true,
    bool requestBody = true,
    bool responseHeader = true,
    bool responseBody = true,
    bool error = true,
  }) =>
      _instance ??= _LogConfig._internal(
        enableLog: enableLog,
        showRequest: request,
        showRequestHeader: requestHeader,
        showRequestBody: requestBody,
        showResponseHeader: responseHeader,
        showResponseBody: responseBody,
        showError: error,
      );

  _LogConfig._internal({
    required this.enableLog,
    required this.showRequest,
    required this.showRequestHeader,
    required this.showRequestBody,
    required this.showResponseHeader,
    required this.showResponseBody,
    required this.showError,
  });

  bool enableLog;
  bool showRequest;
  bool showRequestHeader;
  bool showRequestBody;
  bool showResponseHeader;
  bool showResponseBody;
  bool showError;

  static _LogConfig? _instance;

  @override
  String toString() =>
      'Log Enabled: ${enableLog.capitalize}\nShow Request: ${showRequest.capitalize}\nShow Request Header: ${showRequestHeader.capitalize}\nShow Request Body: ${showRequestBody.capitalize}\nShow Response Header: ${showResponseHeader.capitalize}\nShow Response Body: ${showResponseBody.capitalize}\nShow Error: ${showError.capitalize}';
}
