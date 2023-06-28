part of 'riwayat_mpt_bloc.dart';

abstract class RiwayatMptState extends Equatable {
  const RiwayatMptState();

  @override
  List<Object> get props => [];
}

class RiwayatMptEmpty extends RiwayatMptState {}

class RiwayatMptLoading extends RiwayatMptState {}

class AllRiwayatMptHasData extends RiwayatMptState {
  final List<RiwayatMpt> riwayatMptList;

  const AllRiwayatMptHasData({required this.riwayatMptList});

  @override
  List<Object> get props => [riwayatMptList];
}

class RiwayatMptHasData extends RiwayatMptState {
  final RiwayatMpt riwayatMpt;

  const RiwayatMptHasData({required this.riwayatMpt});

  @override
  List<Object> get props => [riwayatMpt];
}

class RiwayatMptError extends RiwayatMptState {
  final String message;

  const RiwayatMptError({required this.message});

  @override
  List<Object> get props => [message];
}

class RiwayatMptSuccessMessage extends RiwayatMptState {
  final String message;

  const RiwayatMptSuccessMessage({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}
