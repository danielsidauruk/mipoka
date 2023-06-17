part of 'partisipan_bloc.dart';

abstract class PartisipanState extends Equatable {
  const PartisipanState();

  @override
  List<Object> get props => [];
}

class PartisipanEmpty extends PartisipanState {}

class PartisipanLoading extends PartisipanState {}

class PartisipanHasData extends PartisipanState {
  final List<Partisipan> partisipanList;

  const PartisipanHasData({required this.partisipanList});

  @override
  List<Object> get props => [partisipanList];
}

class PartisipanSuccessMessage extends PartisipanState {
  final String message;

  const PartisipanSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class PartisipanError extends PartisipanState {
  final String message;

  const PartisipanError({required this.message});

  @override
  List<Object> get props => [message];
}
