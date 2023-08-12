import 'dart:io';

import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
  ApiConfig.printLog = true;
  final token = Platform.environment['GOFILE_TOKEN']!;
  final gofileClient = GofileApi(token);
  final getAccount = await gofileClient.accountInfo();
  print(getAccount?.toJson());
}
