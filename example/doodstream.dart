import 'dart:io';

import 'package:dart_api_collection/doodstream.dart';

void main() async {
  final key = Platform.environment['DOODSTREAM_API_KEY']!;
  final doodstreamClient = DoodstreamApi(key);
  final getAccount = await doodstreamClient.accountInfo();
  print(getAccount.toJson());
}
