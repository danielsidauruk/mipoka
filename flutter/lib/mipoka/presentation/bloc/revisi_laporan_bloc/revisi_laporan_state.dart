part of 'revisi_laporan_bloc.dart';

abstract class RevisiLaporanState extends Equatable {
  const RevisiLaporanState();

  @override
  List<Object> get props => [];
}

class RevisiLaporanEmpty extends RevisiLaporanState {}

class RevisiLaporanLoading extends RevisiLaporanState {}

class RevisiLaporanError extends RevisiLaporanState {
  final String message;

  const RevisiLaporanError({required this.message});

  @override
  List<Object> get props => [message];
}

class RevisiLaporanHasData extends RevisiLaporanState {
  final RevisiLaporan revisiLaporan;

  const RevisiLaporanHasData({required this.revisiLaporan});

  @override
  List<Object> get props => [revisiLaporan];
}

class RevisiLaporanSuccess extends RevisiLaporanState {
  final String message;

  const RevisiLaporanSuccess({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}
