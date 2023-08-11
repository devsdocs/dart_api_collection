import 'dart:io';

import 'package:dart_api_collection/mixdrop/main.dart';

void main() async {
  final user = Platform.environment['MIXDROP_EMAIL']!;
  final key = Platform.environment['MIXDROP_KEY']!;
  final mixdropClient = MixdropApi(user, key);
  final listFolder = await mixdropClient.folderList();
  print(listFolder.toJson());
}
