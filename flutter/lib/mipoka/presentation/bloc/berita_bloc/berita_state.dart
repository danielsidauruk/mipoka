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

class AllBeritaHasData extends BeritaState {
  const AllBeritaHasData({required this.allBerita});
  final List<Berita> allBerita;

  @override
  List<Object> get props => [allBerita];
}

class BeritaHasData extends BeritaState {
  const BeritaHasData({required this.berita});
  final Berita berita;

  @override
  List<Object> get props => [berita];
}

class BeritaSuccess extends BeritaState {}