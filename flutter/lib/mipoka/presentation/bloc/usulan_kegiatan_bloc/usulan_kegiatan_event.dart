part of 'usulan_kegiatan_bloc.dart';

abstract class UsulanKegiatanEvent extends Equatable {
  const UsulanKegiatanEvent();

  @override
  List<Object> get props => [];
}

class ReadAllUsulanKegiatanEvent extends UsulanKegiatanEvent {
  final String filter;

  const ReadAllUsulanKegiatanEvent({this.filter = "Semua"});
}

class ReadUsulanKegiatanEvent extends UsulanKegiatanEvent {
  final int idUsulanKegiatan;

  const ReadUsulanKegiatanEvent({required this.idUsulanKegiatan});
}

class CreateUsulanKegiatanEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const CreateUsulanKegiatanEvent({required this.usulanKegiatan});
}

class UpdateUsulanKegiatanEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const UpdateUsulanKegiatanEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class DeleteUsulanKegiatanEvent extends UsulanKegiatanEvent {
  final int idUsulan;

  const DeleteUsulanKegiatanEvent({required this.idUsulan});

  @override
  List<Object> get props => [idUsulan];
}

class SaveUsulanKegiatanFirstPageEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const SaveUsulanKegiatanFirstPageEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class ManagePartisipanEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const ManagePartisipanEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class ManageBiayaKegiatanEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const ManageBiayaKegiatanEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class ManageTertibAcaraEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const ManageTertibAcaraEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class SaveAndSendLastPageEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const SaveAndSendLastPageEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class SaveAndGoBackLastPageEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const SaveAndGoBackLastPageEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class AddReviseToUsulanEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const AddReviseToUsulanEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class SaveReviseFirstPageEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const SaveReviseFirstPageEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class SaveReviseSecondPageEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const SaveReviseSecondPageEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}

class SaveReviseLastPageEvent extends UsulanKegiatanEvent {
  final UsulanKegiatan usulanKegiatan;

  const SaveReviseLastPageEvent({required this.usulanKegiatan});

  @override
  List<Object> get props => [usulanKegiatan];
}
