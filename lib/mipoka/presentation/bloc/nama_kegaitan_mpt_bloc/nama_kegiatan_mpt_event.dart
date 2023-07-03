part of 'nama_kegiatan_mpt_bloc.dart';

abstract class NamaKegiatanMptEvent extends Equatable {
  const NamaKegiatanMptEvent();

  @override
  List<Object?> get props => [];
}

class CreateNamaKegiatanMptEvent extends NamaKegiatanMptEvent {
  final NamaKegiatanMpt namaKegiatanMpt;

  const CreateNamaKegiatanMptEvent({required this.namaKegiatanMpt});

  @override
  List<Object?> get props => [namaKegiatanMpt];
}

class ReadAllNamaKegiatanMptEvent extends NamaKegiatanMptEvent {
  final int id;

  const ReadAllNamaKegiatanMptEvent({this.id = 0});

  @override
  List<Object?> get props => [id];
}

class ReadNamaKegiatanMptEvent extends NamaKegiatanMptEvent {
  final int idNamaKegiatanMpt;

  const ReadNamaKegiatanMptEvent({required this.idNamaKegiatanMpt});
}

class UpdateNamaKegiatanMptEvent extends NamaKegiatanMptEvent {
  final NamaKegiatanMpt namaKegiatanMpt;

  const UpdateNamaKegiatanMptEvent({required this.namaKegiatanMpt});

  @override
  List<Object?> get props => [namaKegiatanMpt];
}

class DeleteNamaKegiatanMptEvent extends NamaKegiatanMptEvent {
  final int idNamaKegiatanMpt;

  const DeleteNamaKegiatanMptEvent({required this.idNamaKegiatanMpt});

  @override
  List<Object?> get props => [idNamaKegiatanMpt];
}