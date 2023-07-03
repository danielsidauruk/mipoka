part of 'nama_kegiatan_drop_down_bloc.dart';

abstract class NamaKegiatanDropDownState extends Equatable {
  const NamaKegiatanDropDownState();

  @override
  List<Object> get props => [];
}

class NamaKegiatanDropDownEmpty extends NamaKegiatanDropDownState {}

class NamaKegiatanDropDownLoading extends NamaKegiatanDropDownState {}

class NamaKegiatanDropDownHasData extends NamaKegiatanDropDownState {
  final List<NamaKegiatanMpt> namaKegiatanList;

  const NamaKegiatanDropDownHasData({required this.namaKegiatanList});

  @override
  List<Object> get props => [namaKegiatanList];
}

class NamaKegiatanDropDownError extends NamaKegiatanDropDownState {
  final String message;

  const NamaKegiatanDropDownError({required this.message});

  @override
  List<Object> get props => [message];
}
