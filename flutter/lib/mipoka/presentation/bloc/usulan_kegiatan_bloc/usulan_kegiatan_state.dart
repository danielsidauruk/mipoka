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

class UsulanKegiatanSuccess extends UsulanKegiatanState {
  final String message;

  const UsulanKegiatanSuccess({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}

class UpdateUsulanKegiatanSuccess extends UsulanKegiatanState {}


class UsulanKegiatanDeleted extends UsulanKegiatanState {}

class SaveUsulanKegiatanFirstPageSuccess extends UsulanKegiatanState {}

class ManagePartisipanSuccess extends UsulanKegiatanState {}

class ManageBiayaKegiatanSuccess extends UsulanKegiatanState {}

class ManageTertibAcaraSuccess extends UsulanKegiatanState {}

class SaveAndSendLastPageSuccess extends UsulanKegiatanState {}

class SaveAndGoBackLastPageSuccess extends UsulanKegiatanState {}

class AddReviseToUsulanSuccess extends UsulanKegiatanState {}

class SaveReviseFirstPageSuccess extends UsulanKegiatanState {}

class SaveReviseSecondPageSuccess extends UsulanKegiatanState {}

class SaveReviseLastPageSuccess extends UsulanKegiatanState {}
