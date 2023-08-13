part of '../common.dart';

extension FileExt on File {
  /// Get unique file ID using [sha256]
  Future<String> get id async => '${sha256.convert(await readAsBytes())}';
}

extension PrivateFileExt on File {
  String get fileNameAndExt => uri.fileNameAndExt;
  String get fileName => uri.fileName;
  String get fileExt => uri.fileExt;

  Future<MultipartFile> get toMultipart async => MultipartFile.fromFile(path);
}

extension DirectoryExt on Directory {
  Future<Directory> get check async =>
      await exists() ? this : await create(recursive: true);
}

extension IntExt on int {
  String get readableByte {
    if (this < 0) return 'Unknown Size';
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = toDouble();
    var unitIndex = 0;

    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }

    return '${size.toStringAsFixed(2)} ${units[unitIndex]}';
  }

  // Jiffy get toJiffy => Jiffy.parseFromMillisecondsSinceEpoch(this);
}

extension ListOfStringExt on List<String> {
  String get joinPath {
    final pathSeparator = Platform.pathSeparator;
    return join(pathSeparator);
  }

  String get joinDot => join('.');
  String get joinComma => join(',');
}

extension StringExt on String {
  Uri get toUri => Uri.parse(this);
  Uri? get toUriNull => Uri.tryParse(this);
  int get toInt => int.parse(this);
  List<String> get splitDot => split('.');
  dynamic get toJsonObject => json.decode(this);
  bool get containsDot => contains('.');
}

extension UriExt on Uri {
  String get fileNameAndExt => pathSegments.last;
  String get fileName => fileNameAndExt.containsDot
      ? fileNameAndExt.splitDot.first
      : fileNameAndExt;
  String get fileExt => fileNameAndExt.containsDot
      ? fileNameAndExt.splitDot.last
      : fileNameAndExt;
}

extension MapExt on Map<String, dynamic> {
  String get toJsonString => json.encode(this);
}

extension ListOfMapOfStringDynamicExt on List<Map<String, dynamic>> {
  String get toJsonString => json.encode(this);
}

extension JiffyExt on Jiffy {
  /// YYYY-MM-DD
  String get toYYYYMMDD => yMd
      .split('/')
      .map((e) {
        if (e.length == 1) {
          return '0$e';
        } else {
          return e;
        }
      })
      .toList()
      .reversed
      .join('-');

  /// example 2021-07-21 05:07:10
  String get toYYYYMMDDHMS => '$toYYYYMMDD $Hms';
}

extension DateTimeExt on DateTime {
  Jiffy get toJiffy => Jiffy.parseFromDateTime(this);
}

extension BoolExt on bool? {
  /// either  '1' or '0'
  String get toStringFlag => this! ? '1' : '0';

  /// either null or '1' or '0'
  String? get toStringFlagOrNull => this != null ? toStringFlag : null;
}
