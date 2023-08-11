part of '../common.dart';

extension FileExt on File {
  Future<String> get id async => '${sha256.convert(await readAsBytes())}';

  String get fileNameAndExt => uri.fileNameAndExt;
  String get fileName => uri.fileName;
  String get fileExt => uri.fileExt;
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
}

extension ListOfStringExt on List<String> {
  String get joinToPath {
    final pathSeparator = Platform.pathSeparator;
    return join(pathSeparator);
  }
}

extension StringExt on String {
  Uri get toUri => Uri.parse(this);
  Uri? get tryToUri => Uri.tryParse(this);
  int get toInt => int.parse(this);
  List<String> get splitDot => split('.');
}

extension UriExt on Uri {
  String get fileNameAndExt => pathSegments.last;
  String get fileName => fileNameAndExt.splitDot.first;
  String get fileExt => fileNameAndExt.splitDot.last;
}
