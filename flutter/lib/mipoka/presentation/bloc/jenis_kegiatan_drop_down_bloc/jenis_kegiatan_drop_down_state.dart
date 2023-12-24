part of 'jenis_kegiatan_drop_down_bloc.dart';

abstract class JenisKegiatanDropDownState extends Equatable {
  const JenisKegiatanDropDownState();

  @override
  List<Object> get props => [];
}

class JenisKegiatanDropDownEmpty extends JenisKegiatanDropDownState {}

class JenisKegiatanDropDownLoading extends JenisKegiatanDropDownState {}

class JenisKegiatanDropDownHasData extends JenisKegiatanDropDownState {
  const JenisKegiatanDropDownHasData({required this.jenisKegiatanMptList});

  final List<JenisKegiatanMpt> jenisKegiatanMptList;

  @override
  List<Object> get props => [jenisKegiatanMptList];
}

class JenisKegiatanDropDownError extends JenisKegiatanDropDownState {
  final String message;

  const JenisKegiatanDropDownError({required this.message});

  @override
  List<Object> get props => [message];
}