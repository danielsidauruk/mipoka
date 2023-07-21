part of 'riwayat_kegiatan_mpt_bloc.dart';

abstract class RiwayatKegiatanMptState extends Equatable {
  const RiwayatKegiatanMptState();

  @override
  List<Object> get props => [];
}

class RiwayatKegiatanMptEmpty extends RiwayatKegiatanMptState {}

class RiwayatKegiatanMptLoading extends RiwayatKegiatanMptState {}

class AllRiwayatKegiatanMptHasData extends RiwayatKegiatanMptState {
  final List<RiwayatKegiatanMpt> riwayatKegiatanMptList;

  const AllRiwayatKegiatanMptHasData({required this.riwayatKegiatanMptList});

  @override
  List<Object> get props => [riwayatKegiatanMptList];
}

class RiwayatKegiatanMptHasData extends RiwayatKegiatanMptState {
  final RiwayatKegiatanMpt riwayatKegiatanMpt;

  const RiwayatKegiatanMptHasData({required this.riwayatKegiatanMpt});

  @override
  List<Object> get props => [riwayatKegiatanMpt];
}

class RiwayatKegiatanMptError extends RiwayatKegiatanMptState {
  final String message;

  const RiwayatKegiatanMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class RiwayatKegiatanMptSuccess extends RiwayatKegiatanMptState {
  final String message;

  const RiwayatKegiatanMptSuccess({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}
