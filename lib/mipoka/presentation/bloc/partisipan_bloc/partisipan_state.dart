part of 'partisipan_bloc.dart';

abstract class PartisipanState extends Equatable {
  const PartisipanState();

  @override
  List<Object> get props => [];
}

class PartisipanEmpty extends PartisipanState {}

class PartisipanLoading extends PartisipanState {}

class AllPartisipanHasData extends PartisipanState {
  final List<Partisipan> partisipanList;

  const AllPartisipanHasData({required this.partisipanList});

  @override
  List<Object> get props => [partisipanList];
}

class PartisipanHasData extends PartisipanState {
  final Partisipan partisipan;

  const PartisipanHasData({required this.partisipan});

  @override
  List<Object> get props => [partisipan];
}

class PartisipanSuccessMessage extends PartisipanState {
  final String message;

  const PartisipanSuccessMessage({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}

class PartisipanError extends PartisipanState {
  final String message;

  const PartisipanError({required this.message});

  @override
  List<Object> get props => [message];
}
