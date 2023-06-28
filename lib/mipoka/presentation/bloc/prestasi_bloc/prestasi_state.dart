part of 'prestasi_bloc.dart';

abstract class PrestasiState extends Equatable {
  const PrestasiState();

  @override
  List<Object> get props => [];
}

class PrestasiEmpty extends PrestasiState {}

class PrestasiLoading extends PrestasiState {}

class AllPrestasiHasData extends PrestasiState {
  final List<Prestasi> prestasiList;

  const AllPrestasiHasData({required this.prestasiList});

  @override
  List<Object> get props => [prestasiList];
}

class PrestasiHasData extends PrestasiState {
  final Prestasi prestasi;

  const PrestasiHasData({required this.prestasi});

  @override
  List<Object> get props => [prestasi];
}

class PrestasiSuccessMessage extends PrestasiState {
  final String message;

  const PrestasiSuccessMessage({this.message = "Data has changed"});

  @override
  List<Object> get props => [message];
}

class PrestasiError extends PrestasiState {
  final String message;

  const PrestasiError({required this.message});

  @override
  List<Object> get props => [message];
}
