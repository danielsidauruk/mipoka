part of 'rincian_biaya_kegiatan_bloc.dart';

abstract class RincianBiayaKegiatanState extends Equatable {
  const RincianBiayaKegiatanState();

  @override
  List<Object> get props => [];
}

class RincianBiayaKegiatanEmpty extends RincianBiayaKegiatanState {}

class RincianBiayaKegiatanLoading extends RincianBiayaKegiatanState {}

class RincianBiayaKegiatanHasData extends RincianBiayaKegiatanState {
  final List<BiayaKegiatan> rincianBiayaKegiatanList;

  const RincianBiayaKegiatanHasData({required this.rincianBiayaKegiatanList});

  @override
  List<Object> get props => [rincianBiayaKegiatanList];
}

class RincianBiayaKegiatanError extends RincianBiayaKegiatanState {
  final String message;

  const RincianBiayaKegiatanError({required this.message});

  @override
  List<Object> get props => [message];
}

class RincianBiayaKegiatanSuccessMessage extends RincianBiayaKegiatanState {
  final String message;

  const RincianBiayaKegiatanSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}
