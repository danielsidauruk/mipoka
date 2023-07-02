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
  final String filter;

  const ReadAllNamaKegiatanMptEvent({this.filter = "Semua"});

  @override
  List<Object?> get props => [filter];
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