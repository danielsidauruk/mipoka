part of 'biaya_kegiatan_bloc.dart';

abstract class BiayaKegiatanEvent extends Equatable {
  const BiayaKegiatanEvent();

  @override
  List<Object?> get props => [];
}

class CreateBiayaKegiatanEvent extends BiayaKegiatanEvent {
  final BiayaKegiatan biayaKegiatan;

  const CreateBiayaKegiatanEvent(this.biayaKegiatan);

  @override
  List<Object?> get props => [biayaKegiatan];
}

class ReadBiayaKegiatanEvent extends BiayaKegiatanEvent {}

class UpdateBiayaKegiatanEvent extends BiayaKegiatanEvent {
  final BiayaKegiatan biayaKegiatan;

  const UpdateBiayaKegiatanEvent(this.biayaKegiatan);

  @override
  List<Object?> get props => [biayaKegiatan];
}

class DeleteBiayaKegiatanEvent extends BiayaKegiatanEvent {
  final int idBiayaKegiatan;

  const DeleteBiayaKegiatanEvent(this.idBiayaKegiatan);

  @override
  List<Object?> get props => [idBiayaKegiatan];
}
