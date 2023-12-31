part of '../common.dart';

StreamController<FileTransferProgress> transferProgress =
    StreamController<FileTransferProgress>.broadcast();

class FileTransferProgress {
  FileTransferProgress(
    this.id, {
    this.type,
    this.name,
    this.current,
    this.total,
    this.isUpload,
  });
  final String? id;
  final ServiceType? type;
  final String? name;
  final int? current;
  final int? total;
  final bool? isUpload;

  FileTransferProgress copyWith({
    String? id,
    ServiceType? type,
    String? name,
    int? current,
    int? total,
    bool? isUpload,
  }) =>
      FileTransferProgress(
        id ?? this.id,
        type: type ?? this.type,
        name: name ?? this.name,
        current: current ?? this.current,
        total: total ?? this.total,
        isUpload: isUpload ?? this.isUpload,
      );

  @override
  String toString() =>
      '${isUpload! ? 'Uploading' : 'Downloading'} $name => ${current!.readableByte}/${total!.readableByte}';
}

enum ServiceType {
  doodstream,
  gofile,
  mixdrop,
  streamtape,
  streamwish,
}
