part of 'nama_kegiatan_mpt_bloc.dart';

abstract class NamaKegiatanMptState extends Equatable {
  const NamaKegiatanMptState();

  @override
  List<Object> get props => [];
}

class NamaKegiatanMptEmpty extends NamaKegiatanMptState {}

class NamaKegiatanMptLoading extends NamaKegiatanMptState {}

class NamaKegiatanMptError extends NamaKegiatanMptState {
  final String message;

  const NamaKegiatanMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllNamaKegiatanMptHasData extends NamaKegiatanMptState {
  const AllNamaKegiatanMptHasData({required this.namaKegiatanMptList});

  final List<NamaKegiatanMpt> namaKegiatanMptList;

  @override
  List<Object> get props => [namaKegiatanMptList];
}

class NamaKegiatanMptHasData extends NamaKegiatanMptState {
  final NamaKegiatanMpt namaKegiatanMpt;

  const NamaKegiatanMptHasData({required this.namaKegiatanMpt});

  @override
  List<Object> get props => [namaKegiatanMpt];
}

class NamaKegiatanMptSuccessMessage extends NamaKegiatanMptState {
  const NamaKegiatanMptSuccessMessage({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}