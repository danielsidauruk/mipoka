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


// class DeleteUsulanKegiatanEvent extends UsulanKegiatanEvent {
//   final UsulanKegiatan usulanKegiatan;
//
//   const DeleteUsulanKegiatanEvent({required this.usulanKegiatan});
//
//   @override
//   List<Object> get props => [usulanKegiatan];
// }
