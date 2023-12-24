part of 'notifikasi_bloc.dart';

abstract class NotifikasiState extends Equatable {
  const NotifikasiState();

  @override
  List<Object> get props => [];
}

class NotifikasiEmpty extends NotifikasiState {}

class NotifikasiLoading extends NotifikasiState {}

class NotifikasiError extends NotifikasiState {
  final String message;

  const NotifikasiError({required this.message});

  @override
  List<Object> get props => [message];
}

class AllNotifikasiHasData extends NotifikasiState {
  const AllNotifikasiHasData({required this.notifikasiList});

  final List<Notifikasi> notifikasiList;

  @override
  List<Object> get props => [notifikasiList];
}

class NotifikasiHasData extends NotifikasiState {
  final Notifikasi notifikasi;

  const NotifikasiHasData({required this.notifikasi});

  @override
  List<Object> get props => [notifikasi];
}

class NotifikasiSuccess extends NotifikasiState {}
