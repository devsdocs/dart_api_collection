import 'dart:io';

import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
  ApiConfig.logConfig
    ..enableLog = true
    ..showResponseHeader = false;
  final token = Platform.environment['GOFILE_TOKEN']!;
  final gofileClient = GofileApi(token);
  final getAccount = await gofileClient.accountInfo();
  print(getAccount?.toJson());
}
