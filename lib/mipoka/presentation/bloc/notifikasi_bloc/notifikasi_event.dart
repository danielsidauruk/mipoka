part of 'notifikasi_bloc.dart';

abstract class NotifikasiEvent extends Equatable {
  const NotifikasiEvent();

  @override
  List<Object?> get props => [];
}

class CreateNotifikasiEvent extends NotifikasiEvent {
  final Notifikasi notifikasi;

  const CreateNotifikasiEvent({required this.notifikasi});

  @override
  List<Object?> get props => [notifikasi];
}

class ReadAllNotifikasiEvent extends NotifikasiEvent {
  final String filter;

  const ReadAllNotifikasiEvent({this.filter = "Semua"});

  @override
  List<Object?> get props => [filter];
}

class ReadNotifikasiEvent extends NotifikasiEvent {
  final int idNotifikasi;

  const ReadNotifikasiEvent({required this.idNotifikasi});
}

class UpdateNotifikasiEvent extends NotifikasiEvent {
  final Notifikasi notifikasi;

  const UpdateNotifikasiEvent({required this.notifikasi});

  @override
  List<Object?> get props => [notifikasi];
}

class DeleteNotifikasiEvent extends NotifikasiEvent {
  final int idNotifikasi;

  const DeleteNotifikasiEvent({required this.idNotifikasi});

  @override
  List<Object?> get props => [idNotifikasi];
}
