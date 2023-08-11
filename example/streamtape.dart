import 'dart:io';

import 'package:dart_api_collection/streamtape.dart';

void main() async {
  final user = Platform.environment['STREAMTAPE_USER']!;
  final key = Platform.environment['STREAMTAPE_KEY']!;
  final streamtapeClient = StreamtapeApi(user, key);
  final getAccount = await streamtapeClient.accountInfo();
  print(getAccount.toJson());
}
