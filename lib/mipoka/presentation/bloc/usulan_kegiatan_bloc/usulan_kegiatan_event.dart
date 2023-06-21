part of 'usulan_kegiatan_bloc.dart';

abstract class UsulanKegiatanEvent extends Equatable {
  const UsulanKegiatanEvent();

  @override
  List<Object> get props => [];
}

class ReadUsulanKegiatanEvent extends UsulanKegiatanEvent {}

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
