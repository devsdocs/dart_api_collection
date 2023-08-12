# Dart wrappers for known media services on internet


### ⚠️ Not all error catched (yet), please open an issue or PR, if any error exist
# Services available

### - [Doodstream](https://doodstream.com)

```dart
void main() async {
  final key = Platform.environment['DOODSTREAM_API_KEY']!;
  final doodstreamClient = DoodstreamApi(key);
  final getAccount = await doodstreamClient.accountInfo();
  print(getAccount?.toJson());
}
```

### - [Streamtape](https://streamtape.com)

```dart
void main() async {
  final user = Platform.environment['STREAMTAPE_USER']!;
  final key = Platform.environment['STREAMTAPE_KEY']!;
  final streamtapeClient = StreamtapeApi(user, key);
  final getAccount = await streamtapeClient.accountInfo();
  print(getAccount?.toJson());
}
```

### - [Mixdrop](https://mixdrop.co)

```dart
void main() async {
  final user = Platform.environment['MIXDROP_EMAIL']!;
  final key = Platform.environment['MIXDROP_KEY']!;
  final mixdropClient = MixdropApi(user, key);
  final listFolder = await mixdropClient.folderList();
  print(listFolder?.toJson());
}
```

### - [Gofile](https://gofile.io)

```dart
void main() async {
  final token = Platform.environment['GOFILE_TOKEN']!;
  final gofileClient = GofileApi(token);
  final getAccount = await gofileClient.accountInfo();
  print(getAccount?.toJson());
}

```

### Listening to Upload/Download progress
- To listen for upload/download task, just add code below to your app

```dart
transferProgress.stream.listen((e) => print(e));
```
- You can also filter specific upload/download task

```dart
import 'dart:io';
import 'package:dart_api_collection/dart_api_collection.dart';

void main() async {
final file = File('video.mp4');
final id = file.id; // Extension on dart:io File, exported by this package

/// Filter by file ID
transferProgress.stream.where((event) => event.id == id).listen((e) => print(e));
final gofileClient = GofileApi(); // Gofile provide free upload without API key

final result = await gofileClient.uploadFile(file);
print(result?.toJson());
}
```

### - TODO List:

- [x] [Doodstream](https://doodstream.com)
  
- [x] [Streamtape](https://streamtape.com)
  
- [x] [Mixdrop](https://mixdrop.co)
  
- [x] [Gofile](https://gofile.io)
  
- [ ] [Streamwish](https://streamwish.com)
