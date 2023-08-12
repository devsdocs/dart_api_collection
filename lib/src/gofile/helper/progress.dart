part of '../../gofile.dart';

StreamController<_GofileFileTransferProgress> gofileFileTransferProgress =
    StreamController<_GofileFileTransferProgress>.broadcast();

class _GofileFileTransferProgress {
  _GofileFileTransferProgress(
    this.id, {
    required this.name,
    required this.current,
    required this.total,
    required this.isUpload,
  });
  final String id;
  final String name;
  final int current;
  final int total;
  final bool isUpload;

  @override
  String toString() =>
      '${isUpload ? 'Uploading' : 'Downloading'} $name => ${current.readableByte}/${total.readableByte}';
}
