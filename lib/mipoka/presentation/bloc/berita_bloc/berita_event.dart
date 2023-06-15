part of 'berita_bloc.dart';

abstract class BeritaEvent extends Equatable {
  const BeritaEvent();

  @override
  List<Object?> get props => [];
}

class LoadBeritaEvent extends BeritaEvent {}

class CreateBeritaEvent extends BeritaEvent {}