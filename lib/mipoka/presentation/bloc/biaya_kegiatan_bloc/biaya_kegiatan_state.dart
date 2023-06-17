part of 'biaya_kegiatan_bloc.dart';

abstract class BiayaKegiatanState extends Equatable {
  const BiayaKegiatanState();

  @override
  List<Object> get props => [];
}

class BiayaKegiatanEmpty extends BiayaKegiatanState {}

class BiayaKegiatanLoading extends BiayaKegiatanState {}

class BiayaKegiatanError extends BiayaKegiatanState {
  final String message;

  const BiayaKegiatanError({required this.message});

  @override
  List<Object> get props => [message];
}

class BiayaKegiatanHasData extends BiayaKegiatanState {
  const BiayaKegiatanHasData({required this.biayaKegiatanList});

  final List<BiayaKegiatan> biayaKegiatanList;

  @override
  List<Object> get props => [biayaKegiatanList];
}

class BiayaKegiatanSuccessMessage extends BiayaKegiatanState {
  const BiayaKegiatanSuccessMessage({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
