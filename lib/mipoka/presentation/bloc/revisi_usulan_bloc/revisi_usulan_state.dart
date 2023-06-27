part of 'revisi_usulan_bloc.dart';

abstract class RevisiUsulanState extends Equatable {
  const RevisiUsulanState();

  @override
  List<Object> get props => [];
}

class RevisiUsulanEmpty extends RevisiUsulanState {}

class RevisiUsulanLoading extends RevisiUsulanState {}

class RevisiUsulanError extends RevisiUsulanState {
  final String message;

  const RevisiUsulanError({required this.message});

  @override
  List<Object> get props => [message];
}

class RevisiUsulanHasData extends RevisiUsulanState {
  final RevisiUsulan revisiUsulan;

  const RevisiUsulanHasData({required this.revisiUsulan});

  @override
  List<Object> get props => [revisiUsulan];
}

class RevisiUsulanSuccess extends RevisiUsulanState {}
