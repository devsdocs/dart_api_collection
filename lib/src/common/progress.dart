part of '../common.dart';

StreamController<FileTransferProgress> fileTransferProgress =
    StreamController<FileTransferProgress>.broadcast();

class FileTransferProgress {
  FileTransferProgress(
    this.id, {
    required this.name,
    required this.type,
    required this.current,
    required this.total,
    required this.isUpload,
  });
  final String id;
  final ServiceType type;
  final String name;
  final int current;
  final int total;
  final bool isUpload;

  @override
  String toString() =>
      '${isUpload ? 'Uploading' : 'Downloading'} $name => ${current.readableByte}/${total.readableByte}';
}

enum ServiceType {
  doodstream,
  gofile,
  mixdrop,
  streamtape,
}
