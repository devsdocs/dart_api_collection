import 'dart:io';

import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
  final token = Platform.environment['GOFILE_TOKEN']!;
  final gofileClient = GofileApi(token)..printLog = true;

  final getAccount = await gofileClient.getAccount();
  print(getAccount.toJson());
}
