import 'dart:io';

import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
  ApiConfig.logConfig
    ..enableLog = true
    ..showResponseHeader = false;
  final key = Platform.environment['DOODSTREAM_API_KEY']!;
  final doodstreamClient = DoodstreamApi(key);
  final getAccount = await doodstreamClient.accountInfo();
  print(getAccount?.toJson());
}
