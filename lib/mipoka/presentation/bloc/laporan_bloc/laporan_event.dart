part of 'laporan_bloc.dart';

abstract class LaporanEvent extends Equatable {
  const LaporanEvent();

  @override
  List<Object?> get props => [];
}

class CreateLaporanEvent extends LaporanEvent {
  final Laporan laporan;

  const CreateLaporanEvent({required this.laporan});

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

class UpdateLaporanFirstPageEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanFirstPageEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class UpdateLaporanSecondPageEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanSecondPageEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class UpdateLaporanLastPageEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanLastPageEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class UpdateLaporanAndSendEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanAndSendEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class DeleteLaporanEvent extends LaporanEvent {
  final int idLaporan;

  const DeleteLaporanEvent({required this.idLaporan});

  @override
  List<Object?> get props => [idLaporan];
}
