part of 'partisipan_bloc.dart';

abstract class PartisipanEvent extends Equatable {
  const PartisipanEvent();

  @override
  List<Object> get props => [];
}

class ReadAllPartisipanEvent extends PartisipanEvent {}

class ReadPartisipanEvent extends PartisipanEvent {
  final int idPartisipan;

  const ReadPartisipanEvent({required this.idPartisipan});
}

class CreatePartisipanEvent extends PartisipanEvent {
  final int idUsulanKegiatan;
  final Partisipan partisipan;

  const CreatePartisipanEvent({
    required this.idUsulanKegiatan,
    required this.partisipan,
  });

  @override
  List<Object> get props => [partisipan];
}

class UpdatePartisipanEvent extends PartisipanEvent {
  final Partisipan partisipan;

  const UpdatePartisipanEvent(this.partisipan);

  @override
  List<Object> get props => [partisipan];
}

class DeletePartisipanEvent extends PartisipanEvent {
  final int idPartisipan;

  const DeletePartisipanEvent(this.idPartisipan);

  @override
  List<Object> get props => [idPartisipan];
}
