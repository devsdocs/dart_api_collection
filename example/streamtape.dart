import 'dart:io';

import 'package:dart_api_collection/streamtape/main.dart';

void main() async {
  final _user = Platform.environment['STREAMTAPE_USER']!;
  final _key = Platform.environment['STREAMTAPE_KEY']!;
  final streamtapeClient = StreamtapeApi(_user, _key);
  final getAccount = await streamtapeClient.accountInfo();
  print(getAccount.toJson());
}
