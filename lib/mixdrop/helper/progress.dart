part of '../../mixdrop.dart';

StreamController<MixdropFileTransferProgress> mixdropFileTransferProgress =
    StreamController<MixdropFileTransferProgress>.broadcast();

class MixdropFileTransferProgress {
  MixdropFileTransferProgress(
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
