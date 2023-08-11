part of '../../gofile.dart';

StreamController<GofileFileTransferProgress> gofileFileTransferProgress =
    StreamController<GofileFileTransferProgress>.broadcast();

class GofileFileTransferProgress {
  GofileFileTransferProgress(
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
