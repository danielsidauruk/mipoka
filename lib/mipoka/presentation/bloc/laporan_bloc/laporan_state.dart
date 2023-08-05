part of 'laporan_bloc.dart';

abstract class LaporanState extends Equatable {
  const LaporanState();

  @override
  List<Object> get props => [];
}

class LaporanEmpty extends LaporanState {}

class LaporanLoading extends LaporanState {}

class LaporanError extends LaporanState {
  final String message;

  const LaporanError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllLaporanHasData extends LaporanState {
  const AllLaporanHasData({required this.laporanList});

  final List<Laporan> laporanList;

  @override
  List<Object> get props => [laporanList];
}

class LaporanHasData extends LaporanState {
  final Laporan laporan;

  const LaporanHasData({required this.laporan});

  @override
  List<Object> get props => [laporan];
}

class UpdateLaporanFirstPageSuccess extends LaporanState {
  const UpdateLaporanFirstPageSuccess({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}

class CreateLaporanSuccess extends LaporanState {}

class UpdateLaporanSecondPageSuccess extends LaporanState {}

class UpdateRincianBiayaSuccess extends LaporanState {}

// class UpdateDataPesertaSuccess extends LaporanState {}

class DeleteDataPesertaSuccess extends LaporanState {}

class UpdateLaporanLastPageSuccess extends LaporanState {}

class UpdateLaporanAndSendSuccess extends LaporanState {}

class DeleteLaporanSuccess extends LaporanState {}

class AddDataPesertaKegiatanSuccess extends LaporanState {}

class UpdateLaporanReviseFirstPageSuccess extends LaporanState {}

class UpdateLaporanReviseSecondPageSuccess extends LaporanState {}

class UpdateLaporanReviseLastPageSuccess extends LaporanState {}
