import 'dart:io';

import 'package:api_collection/api_collection.dart';

void main() async {
  ApiConfig.logConfig
    ..enableLog = true
    ..showResponseHeader = false;
  final key = Platform.environment['STREAMWISH_API_KEY']!;
  final streamwishClient = StreamwishApi(key);
  final getAccount = await streamwishClient.accountInfo();
  print(getAccount?.toJson());
}
