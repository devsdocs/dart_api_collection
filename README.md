# Dart wrappers for popular services on internet


### ⚠️ Not all error catched (yet), please open an issue or PR, if any error exist
# Services available

### - [Doodstream](https://doodstream.com)

```dart
void main() async {
  final key = Platform.environment['DOODSTREAM_API_KEY']!;
  final doodstreamClient = DoodStreamApi(key);
  final getAccount = await doodstreamClient.accountInfo();
  print(getAccount.toJson());
}
```

### - [Streamtape](https://streamtape.com)

```dart
void main() async {
  final user = Platform.environment['STREAMTAPE_USER']!;
  final key = Platform.environment['STREAMTAPE_KEY']!;
  final streamtapeClient = StreamtapeApi(user, key);
  final getAccount = await streamtapeClient.accountInfo();
  print(getAccount.toJson());
}
```

### - [Mixdrop](https://mixdrop.co)

```dart
void main() async {
  final user = Platform.environment['MIXDROP_EMAIL']!;
  final key = Platform.environment['MIXDROP_KEY']!;
  final mixdropClient = MixdropApi(user, key);
  final listFolder = await mixdropClient.folderList();
  print(listFolder.toJson());
}
```

### - TODO List:

- [x] [Doodstream](https://doodstream.com)
  
- [x] [Streamtape](https://streamtape.com)
  
- [x] [Mixdrop](https://mixdrop.co)
  
- [ ] [Gofile](https://gofile.io)
  
- [ ] [Streamwish](https://streamwish.com)
