part of 'read_berita_bloc.dart';

abstract class ReadBeritaEvent extends Equatable {
  const ReadBeritaEvent();

  @override
  List<Object?> get props => [];
}

class LoadBeritaEvent extends ReadBeritaEvent {}