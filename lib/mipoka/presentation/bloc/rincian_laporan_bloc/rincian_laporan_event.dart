part of 'rincian_laporan_bloc.dart';

abstract class RincianLaporanEvent extends Equatable {
  const RincianLaporanEvent();

  @override
  List<Object> get props => [];
}

class ReadRincianLaporanEvent extends RincianLaporanEvent {}

class CreateRincianLaporanEvent extends RincianLaporanEvent {
  final RincianLaporan rincianLaporan;

  const CreateRincianLaporanEvent({required this.rincianLaporan});

  @override
  List<Object> get props => [rincianLaporan];
}

class UpdateRincianLaporanEvent extends RincianLaporanEvent {
  final RincianLaporan rincianLaporan;

  const UpdateRincianLaporanEvent({required this.rincianLaporan});

  @override
  List<Object> get props => [rincianLaporan];
}

class DeleteRincianLaporanEvent extends RincianLaporanEvent {
  final int idRincianL;

  const DeleteRincianLaporanEvent({required this.idRincianL});

  @override
  List<Object> get props => [idRincianL];
}
