part of 'lampiran_laporan_bloc.dart';

abstract class LampiranLaporanState extends Equatable {
  const LampiranLaporanState();

  @override
  List<Object> get props => [];
}

class LampiranLaporanEmpty extends LampiranLaporanState {}

class LampiranLaporanLoading extends LampiranLaporanState {}

class LampiranLaporanError extends LampiranLaporanState {
  final String message;

  const LampiranLaporanError({required this.message});

  @override
  List<Object> get props => [message];
}

class LampiranLaporanHasData extends LampiranLaporanState {
  const LampiranLaporanHasData({required this.lampiranLaporanList});

  final List<LampiranLaporan> lampiranLaporanList;

  @override
  List<Object> get props => [lampiranLaporanList];
}

class LampiranLaporanSuccessMessage extends LampiranLaporanState {
  const LampiranLaporanSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
