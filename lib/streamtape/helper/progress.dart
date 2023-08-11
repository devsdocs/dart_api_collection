part of '../../streamtape.dart';

StreamController<StreamTapeFileTransferProgress>
    streamtapeFileTransferProgress =
    StreamController<StreamTapeFileTransferProgress>.broadcast();

class StreamTapeFileTransferProgress {
  StreamTapeFileTransferProgress(
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
