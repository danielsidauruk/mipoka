part of 'berita_bloc.dart';

abstract class BeritaState extends Equatable {
  const BeritaState();

  @override
  List<Object> get props => [];
}

class BeritaEmpty extends BeritaState {}

class BeritaLoading extends BeritaState {}

class BeritaError extends BeritaState {
  final String message;

  const BeritaError({required this.message});

  @override
  List<Object> get props => [message];
}

class BeritaHasData extends BeritaState {
  const BeritaHasData({required this.berita});
  final List<Berita> berita;

  @override
  List<Object> get props => [berita];
}

class BeritaSuccessMessage extends BeritaState {
  const BeritaSuccessMessage({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}