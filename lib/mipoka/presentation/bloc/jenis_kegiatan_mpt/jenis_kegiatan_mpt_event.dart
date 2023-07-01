part of 'jenis_kegiatan_mpt_bloc.dart';

abstract class JenisKegiatanMptEvent extends Equatable {
  const JenisKegiatanMptEvent();

  @override
  List<Object> get props => [];
}

class ReadAllJenisKegiatanMptEvent extends JenisKegiatanMptEvent {}

class CreateJenisKegiatanMptEvent extends JenisKegiatanMptEvent {
  final JenisKegiatanMpt jenisKegiatanMpt;

  const CreateJenisKegiatanMptEvent({required this.jenisKegiatanMpt});

  @override
  List<Object> get props => [jenisKegiatanMpt];
}

class UpdateJenisKegiatanMptEvent extends JenisKegiatanMptEvent {
  final JenisKegiatanMpt jenisKegiatanMpt;

  const UpdateJenisKegiatanMptEvent({required this.jenisKegiatanMpt});

  @override
  List<Object> get props => [jenisKegiatanMpt];
}

class DeleteJenisKegiatanMptEvent extends JenisKegiatanMptEvent {
  final int idJenisKegiatan;

  const DeleteJenisKegiatanMptEvent({required this.idJenisKegiatan});

  @override
  List<Object> get props => [idJenisKegiatan];
}
