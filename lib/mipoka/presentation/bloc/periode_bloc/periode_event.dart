part of 'periode_bloc.dart';

abstract class PeriodeEvent extends Equatable {
  const PeriodeEvent();

  @override
  List<Object> get props => [];
}

class ReadPeriodeEvent extends PeriodeEvent {}

class CreatePeriodeEvent extends PeriodeEvent {
  final Periode periode;

  const CreatePeriodeEvent(this.periode);

  @override
  List<Object> get props => [periode];
}

class UpdatePeriodeEvent extends PeriodeEvent {
  final Periode periode;

  const UpdatePeriodeEvent(this.periode);

  @override
  List<Object> get props => [periode];
}

class DeletePeriodeEvent extends PeriodeEvent {
  final int idPeriode;

  const DeletePeriodeEvent(this.idPeriode);

  @override
  List<Object> get props => [idPeriode];
}
