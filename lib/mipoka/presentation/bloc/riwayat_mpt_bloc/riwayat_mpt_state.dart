part of 'riwayat_mpt_bloc.dart';

abstract class RiwayatMptState extends Equatable {
  const RiwayatMptState();

  @override
  List<Object> get props => [];
}

class RiwayatMptEmpty extends RiwayatMptState {}

class RiwayatMptLoading extends RiwayatMptState {}

class RiwayatMptHasData extends RiwayatMptState {
  final List<RiwayatMpt> riwayatMptList;

  const RiwayatMptHasData({required this.riwayatMptList});

  @override
  List<Object> get props => [riwayatMptList];
}

class RiwayatMptError extends RiwayatMptState {
  final String message;

  const RiwayatMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class RiwayatMptSuccessMessage extends RiwayatMptState {
  final String message;

  const RiwayatMptSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}
