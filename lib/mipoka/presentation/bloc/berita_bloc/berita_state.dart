part of 'berita_bloc.dart';

abstract class BeritaState extends Equatable {
  const BeritaState();

  @override
  List<Object> get props => [];
}

class ReadBeritaEmpty extends BeritaState {}

class ReadBeritaLoading extends BeritaState {}

class ReadBeritaError extends BeritaState {
  final String message;

  const ReadBeritaError({required this.message});

  @override
  List<Object> get props => [message];
}

class ReadBeritaHasData extends BeritaState {
  const ReadBeritaHasData({required this.berita});
  final List<Berita> berita;

  @override
  List<Object> get props => [berita];
}