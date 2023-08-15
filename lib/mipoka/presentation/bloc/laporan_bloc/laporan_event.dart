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

class UpdateRincianBiayaEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateRincianBiayaEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}


class DeleteDataPesertaEvent extends LaporanEvent {
  final Laporan laporan;

  const DeleteDataPesertaEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

/*class UpdateDataPesertaEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateDataPesertaEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}*/

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

class UpdateLaporanReviseFirstPageEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanReviseFirstPageEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class UpdateLaporanReviseSecondPageEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanReviseSecondPageEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class UpdateLaporanReviseLastPageEvent extends LaporanEvent {
  final Laporan laporan;

  const UpdateLaporanReviseLastPageEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class DeleteLaporanEvent extends LaporanEvent {
  final int idLaporan;

  const DeleteLaporanEvent({required this.idLaporan});

  @override
  List<Object?> get props => [idLaporan];
}

class AddDataPesertaKegiatanEvent extends LaporanEvent {
  final Laporan laporan;

  const AddDataPesertaKegiatanEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}

class AddReviseToLaporanEvent extends LaporanEvent {
  final Laporan laporan;

  const AddReviseToLaporanEvent({required this.laporan});

  @override
  List<Object?> get props => [laporan];
}