import 'dart:io';

import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
  final key = Platform.environment['DOODSTREAM_API_KEY']!;
  final doodstreamClient = DoodstreamApi(key)..printLog = true;
  final getAccount = await doodstreamClient.accountInfo();
  print(getAccount.toJson());
}
