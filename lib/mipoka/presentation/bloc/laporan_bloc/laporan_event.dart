part of 'laporan_bloc.dart';

abstract class LaporanEvent extends Equatable {
  const LaporanEvent();

  @override
  List<Object?> get props => [];
}

class CreateLaporanEvent extends LaporanEvent {
  final Laporan laporan;

  const CreateLaporanEvent(this.laporan);

  @override
  List<Object?> get props => [laporan];
}

class ReadLaporanEvent extends LaporanEvent {}

class UpdateLaporanEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanEvent(this.laporan);

  @override
  List<Object?> get props => [laporan];
}

class DeleteLaporanEvent extends LaporanEvent {
  final int idLaporan;

  const DeleteLaporanEvent(this.idLaporan);

  @override
  List<Object?> get props => [idLaporan];
}
