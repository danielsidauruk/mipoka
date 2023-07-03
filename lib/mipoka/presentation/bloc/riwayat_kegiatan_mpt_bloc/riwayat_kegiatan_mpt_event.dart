part of 'riwayat_kegiatan_mpt_bloc.dart';

abstract class RiwayatKegiatanMptEvent extends Equatable {
  const RiwayatKegiatanMptEvent();

  @override
  List<Object> get props => [];
}

class ReadAllRiwayatKegiatanMptEvent extends RiwayatKegiatanMptEvent {}

class ReadRiwayatKegiatanMptEvent extends RiwayatKegiatanMptEvent {
  final int idRiwayatKegiatanMptEvent;

  const ReadRiwayatKegiatanMptEvent({required this.idRiwayatKegiatanMptEvent});
}

class CreateRiwayatKegiatanMptEvent extends RiwayatKegiatanMptEvent {
  final RiwayatKegiatanMpt riwayatKegiatanMpt;

  const CreateRiwayatKegiatanMptEvent({required this.riwayatKegiatanMpt});

  @override
  List<Object> get props => [riwayatKegiatanMpt];
}

class UpdateRiwayatKegiatanMptEvent extends RiwayatKegiatanMptEvent {
  final RiwayatKegiatanMpt riwayatKegiatanMpt;

  const UpdateRiwayatKegiatanMptEvent({required this.riwayatKegiatanMpt});

  @override
  List<Object> get props => [riwayatKegiatanMpt];
}

class DeleteRiwayatMptEvent extends RiwayatKegiatanMptEvent {
  final int idRiwayatKegiatanMpt;

  const DeleteRiwayatMptEvent({required this.idRiwayatKegiatanMpt});

  @override
  List<Object> get props => [idRiwayatKegiatanMpt];
}
