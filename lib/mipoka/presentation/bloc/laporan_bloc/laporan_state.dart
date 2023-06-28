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

class LaporanSuccessMessage extends LaporanState {
  const LaporanSuccessMessage({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}
