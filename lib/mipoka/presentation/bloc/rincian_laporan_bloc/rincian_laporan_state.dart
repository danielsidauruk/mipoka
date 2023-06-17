part of 'rincian_laporan_bloc.dart';

abstract class RincianLaporanState extends Equatable {
  const RincianLaporanState();

  @override
  List<Object> get props => [];
}

class RincianLaporanEmpty extends RincianLaporanState {}

class RincianLaporanLoading extends RincianLaporanState {}

class RincianLaporanHasData extends RincianLaporanState {
  final List<RincianLaporan> rincianLaporanList;

  const RincianLaporanHasData({required this.rincianLaporanList});

  @override
  List<Object> get props => [rincianLaporanList];
}

class RincianLaporanError extends RincianLaporanState {
  final String message;

  const RincianLaporanError({required this.message});

  @override
  List<Object> get props => [message];
}

class RincianLaporanSuccessMessage extends RincianLaporanState {
  final String message;

  const RincianLaporanSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}
