part of 'jenis_kegiatan_mpt_bloc.dart';

abstract class JenisKegiatanMptState extends Equatable {
  const JenisKegiatanMptState();

  @override
  List<Object> get props => [];
}

class JenisKegiatanMptEmpty extends JenisKegiatanMptState {}

class JenisKegiatanMptLoading extends JenisKegiatanMptState {}

class JenisKegiatanMptHasData extends JenisKegiatanMptState {
  final List<JenisKegiatanMpt> jenisKegiatanMptList;

  const JenisKegiatanMptHasData({required this.jenisKegiatanMptList});

  @override
  List<Object> get props => [jenisKegiatanMptList];
}

class JenisKegiatanMptError extends JenisKegiatanMptState {
  final String message;

  const JenisKegiatanMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class JenisKegiatanMptSuccessMessage extends JenisKegiatanMptState {
  const JenisKegiatanMptSuccessMessage({this.message = "Data has changed"});

  final String message;

  @override
  List<Object> get props => [message];
}
