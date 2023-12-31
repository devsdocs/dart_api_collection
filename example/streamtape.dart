import 'dart:io';

import 'package:api_collection/api_collection.dart';

void main() async {
  ApiConfig.logConfig
    ..enableLog = true
    ..showResponseHeader = false;
  final user = Platform.environment['STREAMTAPE_USER']!;
  final key = Platform.environment['STREAMTAPE_KEY']!;
  final streamtapeClient = StreamtapeApi(user, key);
  final getAccount = await streamtapeClient.accountInfo();
  print(getAccount?.toJson());
}
