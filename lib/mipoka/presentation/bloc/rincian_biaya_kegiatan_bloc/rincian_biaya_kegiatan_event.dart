part of 'rincian_biaya_kegiatan_bloc.dart';

abstract class RincianBiayaKegiatanEvent extends Equatable {
  const RincianBiayaKegiatanEvent();

  @override
  List<Object> get props => [];
}

class ReadRincianBiayaKegiatanEvent extends RincianBiayaKegiatanEvent {}

class CreateRincianBiayaKegiatanEvent extends RincianBiayaKegiatanEvent {
  final RincianBiayaKegiatan rincianBiayaKegiatan;

  const CreateRincianBiayaKegiatanEvent({required this.rincianBiayaKegiatan});

  @override
  List<Object> get props => [rincianBiayaKegiatan];
}

class UpdateRincianBiayaKegiatanEvent extends RincianBiayaKegiatanEvent {
  final RincianBiayaKegiatan rincianBiayaKegiatan;

  const UpdateRincianBiayaKegiatanEvent({required this.rincianBiayaKegiatan});

  @override
  List<Object> get props => [rincianBiayaKegiatan];
}

class DeleteRincianBiayaKegiatanEvent extends RincianBiayaKegiatanEvent {
  final int idRincianBiayaKegiatan;

  const DeleteRincianBiayaKegiatanEvent({required this.idRincianBiayaKegiatan});

  @override
  List<Object> get props => [idRincianBiayaKegiatan];
}
