part of 'rincian_biaya_kegiatan_bloc.dart';

abstract class RincianBiayaKegiatanState extends Equatable {
  const RincianBiayaKegiatanState();

  @override
  List<Object> get props => [];
}

class RincianBiayaKegiatanEmpty extends RincianBiayaKegiatanState {}

class RincianBiayaKegiatanLoading extends RincianBiayaKegiatanState {}

class RincianBiayaKegiatanHasData extends RincianBiayaKegiatanState {
  final RincianBiayaKegiatan rincianBiayaKegiatan;

  const RincianBiayaKegiatanHasData({required this.rincianBiayaKegiatan});

  @override
  List<Object> get props => [rincianBiayaKegiatan];
}

class RincianBiayaKegiatanError extends RincianBiayaKegiatanState {
  final String message;

  const RincianBiayaKegiatanError({required this.message});

  @override
  List<Object> get props => [message];
}

class RincianBiayaKegiatanSuccess extends RincianBiayaKegiatanState {}
