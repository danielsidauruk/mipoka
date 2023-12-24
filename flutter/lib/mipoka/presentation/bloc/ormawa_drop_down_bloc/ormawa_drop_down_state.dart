part of 'ormawa_drop_down_bloc.dart';

abstract class OrmawaDropDownState extends Equatable {
  const OrmawaDropDownState();

  @override
  List<Object> get props => [];
}

class OrmawaDropDownEmpty extends OrmawaDropDownState {}

class OrmawaDropDownLoading extends OrmawaDropDownState {}

class OrmawaDropDownError extends OrmawaDropDownState {
  final String message;

  const OrmawaDropDownError({required this.message});

  @override
  List<Object> get props => [message];
}

class OrmawaDropDownHasData extends OrmawaDropDownState {
  const OrmawaDropDownHasData({required this.ormawaList});

  final List<Ormawa> ormawaList;

  @override
  List<Object> get props => [ormawaList];
}
