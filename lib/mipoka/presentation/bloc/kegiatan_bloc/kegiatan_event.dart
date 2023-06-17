part of 'kegiatan_bloc.dart';

abstract class KegiatanEvent extends Equatable {
  const KegiatanEvent();

  @override
  List<Object?> get props => [];
}

class CreateKegiatanEvent extends KegiatanEvent {
  final Kegiatan kegiatan;

  const CreateKegiatanEvent(this.kegiatan);

  @override
  List<Object?> get props => [kegiatan];
}

class ReadKegiatanEvent extends KegiatanEvent {}

class UpdateKegiatanEvent extends KegiatanEvent {
  final Kegiatan kegiatan;

  const UpdateKegiatanEvent(this.kegiatan);

  @override
  List<Object?> get props => [kegiatan];
}

class DeleteKegiatanEvent extends KegiatanEvent {
  final int idKegiatan;

  const DeleteKegiatanEvent(this.idKegiatan);

  @override
  List<Object?> get props => [idKegiatan];
}
