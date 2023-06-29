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

class ReadAllLaporanEvent extends LaporanEvent {
  final String filter;

  const ReadAllLaporanEvent({this.filter = "Semua"});

  @override
  List<Object?> get props => [filter];
}

class ReadLaporanEvent extends LaporanEvent {
  final int idLaporan;

  const ReadLaporanEvent({required this.idLaporan});
}

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
