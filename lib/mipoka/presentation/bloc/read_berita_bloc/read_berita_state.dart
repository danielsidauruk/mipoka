part of 'read_berita_bloc.dart';

abstract class ReadBeritaState extends Equatable {
  const ReadBeritaState();

  @override
  List<Object> get props => [];
}

class ReadBeritaEmpty extends ReadBeritaState {}

class ReadBeritaLoading extends ReadBeritaState {}

class ReadBeritaError extends ReadBeritaState {
  final String message;

  const ReadBeritaError({required this.message});

  @override
  List<Object> get props => [message];
}

class ReadBeritaHasData extends ReadBeritaState {
  const ReadBeritaHasData({required this.berita});
  final List<Berita> berita;

  @override
  List<Object> get props => [berita];
}