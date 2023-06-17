part of 'panitia_peserta_laporan_bloc.dart';

abstract class PanitiaPesertaLaporanState extends Equatable {
  const PanitiaPesertaLaporanState();

  @override
  List<Object> get props => [];
}

class PanitiaPesertaLaporanEmpty extends PanitiaPesertaLaporanState {}

class PanitiaPesertaLaporanLoading extends PanitiaPesertaLaporanState {}

class PanitiaPesertaLaporanError extends PanitiaPesertaLaporanState {
  final String message;

  const PanitiaPesertaLaporanError({required this.message});

  @override
  List<Object> get props => [message];
}

class PanitiaPesertaLaporanHasData extends PanitiaPesertaLaporanState {
  const PanitiaPesertaLaporanHasData({required this.panitiaPesertaLaporanList});

  final List<PanitiaPesertaLaporan> panitiaPesertaLaporanList;

  @override
  List<Object> get props => [panitiaPesertaLaporanList];
}

class PanitiaPesertaLaporanSuccessMessage extends PanitiaPesertaLaporanState {
  const PanitiaPesertaLaporanSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
