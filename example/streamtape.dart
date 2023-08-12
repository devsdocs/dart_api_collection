import 'dart:io';

import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
  ApiConfig.printLog = true;
  final user = Platform.environment['STREAMTAPE_USER']!;
  final key = Platform.environment['STREAMTAPE_KEY']!;
  final streamtapeClient = StreamtapeApi(user, key);
  final getAccount = await streamtapeClient.accountInfo();
  print(getAccount.toJson());
}
