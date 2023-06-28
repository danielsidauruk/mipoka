part of 'usulan_kegiatan_bloc.dart';

abstract class UsulanKegiatanState extends Equatable {
  const UsulanKegiatanState();

  @override
  List<Object> get props => [];
}

class UsulanKegiatanEmpty extends UsulanKegiatanState {}

class UsulanKegiatanLoading extends UsulanKegiatanState {}

class UsulanKegiatanHasData extends UsulanKegiatanState {
  final UsulanKegiatan usulanKegiatan;

  const UsulanKegiatanHasData({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class AllUsulanKegiatanHasData extends UsulanKegiatanState {
  final List<UsulanKegiatan> usulanKegiatanList;

  const AllUsulanKegiatanHasData({required this.usulanKegiatanList});

  @override
  List<Object> get props => [usulanKegiatanList];
}

class UsulanKegiatanError extends UsulanKegiatanState {
  final String message;

  const UsulanKegiatanError({required this.message});

  @override
  List<Object> get props => [message];
}

class UsulanKegiatanSuccessMessage extends UsulanKegiatanState {
  final String message;

  const UsulanKegiatanSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class DeleteUsulanKegiatan extends UsulanKegiatanState {}
