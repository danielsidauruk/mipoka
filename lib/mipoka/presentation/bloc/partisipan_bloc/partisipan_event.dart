part of 'partisipan_bloc.dart';

abstract class PartisipanEvent extends Equatable {
  const PartisipanEvent();

  @override
  List<Object> get props => [];
}

class ReadPartisipanEvent extends PartisipanEvent {}

class CreatePartisipanEvent extends PartisipanEvent {
  final Partisipan partisipan;

  const CreatePartisipanEvent(this.partisipan);

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
