# Dart wrappers for popular services on internet

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

#### TODO List:

- [x] [Doodstream](https://doodstream.com)
  
- [x] [Streamtape](https://streamtape.com)
  
- [ ] [Mixdrop](https://mixdrop.co/)
  
- [ ] [Gofile](https://gofile.io)
  
- [ ] [Streamwish](https://streamwish.com)
