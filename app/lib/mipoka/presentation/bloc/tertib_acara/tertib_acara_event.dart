part of 'tertib_acara_bloc.dart';

abstract class TertibAcaraEvent extends Equatable {
  const TertibAcaraEvent();

  @override
  List<Object> get props => [];
}

class ReadTertibAcaraEvent extends TertibAcaraEvent {
  final int idTertibAcara;

  const ReadTertibAcaraEvent({required this.idTertibAcara});
}


class CreateTertibAcaraEvent extends TertibAcaraEvent {
  final int idUsulanKegiatan;
  final TertibAcara tertibAcara;

  const CreateTertibAcaraEvent({
    required this.idUsulanKegiatan,
    required this.tertibAcara,
  });

  @override
  List<Object> get props => [tertibAcara];
}

class UpdateTertibAcaraEvent extends TertibAcaraEvent {
  final TertibAcara tertibAcara;

  const UpdateTertibAcaraEvent({required this.tertibAcara});

  @override
  List<Object> get props => [tertibAcara];
}

class DeleteTertibAcaraEvent extends TertibAcaraEvent {
  final int idTertibAcara;

  const DeleteTertibAcaraEvent({required this.idTertibAcara});

  @override
  List<Object> get props => [idTertibAcara];
}
