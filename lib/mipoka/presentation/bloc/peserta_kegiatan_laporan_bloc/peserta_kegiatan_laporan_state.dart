part of 'peserta_kegiatan_laporan_bloc.dart';

abstract class PesertaKegiatanLaporanState extends Equatable {
  const PesertaKegiatanLaporanState();

  @override
  List<Object> get props => [];
}

class PesertaKegiatanLaporanEmpty extends PesertaKegiatanLaporanState {}

class PesertaKegiatanLaporanLoading extends PesertaKegiatanLaporanState {}

class AllPesertaKegiatanLaporanHasData extends PesertaKegiatanLaporanState {
  final List<PesertaKegiatanLaporan> pesertaKegiatanLaporanList;

  const AllPesertaKegiatanLaporanHasData({required this.pesertaKegiatanLaporanList});

  @override
  List<Object> get props => [pesertaKegiatanLaporanList];
}

class PesertaKegiatanLaporanHasData extends PesertaKegiatanLaporanState {
  final PesertaKegiatanLaporan pesertaKegiatanLaporan;

  const PesertaKegiatanLaporanHasData({required this.pesertaKegiatanLaporan});

  @override
  List<Object> get props => [pesertaKegiatanLaporan];
}

class PesertaKegiatanLaporanSuccessMessage extends PesertaKegiatanLaporanState {
  final String message;

  const PesertaKegiatanLaporanSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class PesertaKegiatanLaporanError extends PesertaKegiatanLaporanState {
  final String message;

  const PesertaKegiatanLaporanError({required this.message});

  @override
  List<Object> get props => [message];
}
