part of 'prestasi_bloc.dart';

abstract class PrestasiState extends Equatable {
  const PrestasiState();

  @override
  List<Object> get props => [];
}

class PrestasiEmpty extends PrestasiState {}

class PrestasiLoading extends PrestasiState {}

class PrestasiHasData extends PrestasiState {
  final List<Prestasi> prestasiList;

  const PrestasiHasData({required this.prestasiList});

  @override
  List<Object> get props => [prestasiList];
}

class PrestasiSuccessMessage extends PrestasiState {
  final String message;

  const PrestasiSuccessMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class PrestasiError extends PrestasiState {
  final String message;

  const PrestasiError({required this.message});

  @override
  List<Object> get props => [message];
}
