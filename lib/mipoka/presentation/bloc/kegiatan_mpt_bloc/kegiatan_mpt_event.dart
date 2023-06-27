part of 'kegiatan_mpt_bloc.dart';

abstract class KegiatanMptEvent extends Equatable {
  const KegiatanMptEvent();

  @override
  List<Object?> get props => [];
}

class CreateKegiatanMptEvent extends KegiatanMptEvent {
  final KegiatanMpt kegiatanMpt;

  const CreateKegiatanMptEvent(this.kegiatanMpt);

  @override
  List<Object?> get props => [kegiatanMpt];
}

class ReadKegiatanMptEvent extends KegiatanMptEvent {}

class UpdateKegiatanMptEvent extends KegiatanMptEvent {
  final KegiatanMpt kegiatanMpt;

  const UpdateKegiatanMptEvent(this.kegiatanMpt);

  @override
  List<Object?> get props => [kegiatanMpt];
}

class DeleteKegiatanMptEvent extends KegiatanMptEvent {
  final int idKegiatanMpt;

  const DeleteKegiatanMptEvent(this.idKegiatanMpt);

  @override
  List<Object?> get props => [idKegiatanMpt];
}
