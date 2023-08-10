import 'dart:io';

import 'package:dart_api_collection/doodstream/main.dart';

void main() async {
  final key = Platform.environment['DOODSTREAM_API_KEY']!;
  final doodstreamClient = DoodStreamApi(key);
  final getAccount = await doodstreamClient.accountInfo();
  print(getAccount.toJson());
}
