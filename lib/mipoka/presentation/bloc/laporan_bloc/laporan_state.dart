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

class LaporanHasData extends LaporanState {
  const LaporanHasData({required this.laporanList});

  final List<Laporan> laporanList;

  @override
  List<Object> get props => [laporanList];
}

class LaporanSuccessMessage extends LaporanState {
  const LaporanSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
