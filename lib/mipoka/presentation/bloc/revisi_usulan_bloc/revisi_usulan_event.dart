part of 'revisi_usulan_bloc.dart';

abstract class RevisiUsulanEvent extends Equatable {
  const RevisiUsulanEvent();

  @override
  List<Object?> get props => [];
}

class ReadRevisiUsulanEvent extends RevisiUsulanEvent {
  final int idRevisiUsulan;

  const ReadRevisiUsulanEvent({required this.idRevisiUsulan});

  @override
  List<Object?> get props => [idRevisiUsulan];
}

class CreateRevisiUsulanEvent extends RevisiUsulanEvent {
  final RevisiUsulan revisiUsulan;

  const CreateRevisiUsulanEvent({required this.revisiUsulan});

  @override
  List<Object?> get props => [revisiUsulan];
}

class UpdateRevisiUsulanEvent extends RevisiUsulanEvent {
  final RevisiUsulan revisiUsulan;

  const UpdateRevisiUsulanEvent({required this.revisiUsulan});

  @override
  List<Object?> get props => [revisiUsulan];
}

class DeleteRevisiUsulanEvent extends RevisiUsulanEvent {
  final int idRevisiUsulan;

  const DeleteRevisiUsulanEvent({required this.idRevisiUsulan});

  @override
  List<Object?> get props => [idRevisiUsulan];
}
