part of 'periode_mpt_bloc.dart';

abstract class PeriodeMptEvent extends Equatable {
  const PeriodeMptEvent();

  @override
  List<Object> get props => [];
}

class ReadAllPeriodeMptEvent extends PeriodeMptEvent {}

class ReadPeriodeMptEvent extends PeriodeMptEvent {
  final int idPeriodeMpt;

  const ReadPeriodeMptEvent({required this.idPeriodeMpt});
}

class CreatePeriodeMptEvent extends PeriodeMptEvent {
  final PeriodeMpt periodeMpt;

  const CreatePeriodeMptEvent(this.periodeMpt);

  @override
  List<Object> get props => [periodeMpt];
}

class UpdatePeriodeMptEvent extends PeriodeMptEvent {
  final PeriodeMpt periodeMpt;

  const UpdatePeriodeMptEvent(this.periodeMpt);

  @override
  List<Object> get props => [periodeMpt];
}

class DeletePeriodeMptEvent extends PeriodeMptEvent {
  final int idPeriodeMpt;

  const DeletePeriodeMptEvent(this.idPeriodeMpt);

  @override
  List<Object> get props => [idPeriodeMpt];
}
