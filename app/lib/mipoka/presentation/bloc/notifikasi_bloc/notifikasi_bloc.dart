import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/notifikasi.dart';
import 'package:mipoka/mipoka/domain/use_cases/notifikasi_use_case.dart';

part 'notifikasi_event.dart';
part 'notifikasi_state.dart';

class NotifikasiBloc extends Bloc<NotifikasiEvent, NotifikasiState> {
  final NotifikasiUseCase notifikasiUseCase;

  NotifikasiBloc({required this.notifikasiUseCase}) : super(NotifikasiEmpty()) {

    on<CreateNotifikasiEvent>((event, emit) async {
      emit(NotifikasiLoading());

      final result = await notifikasiUseCase.createNotifikasi(event.notifikasi);

      result.fold(
            (failure) => emit(NotifikasiError(message: failure.message)),
            (_) => emit(NotifikasiSuccess()),
      );
    });

    on<ReadAllNotifikasiEvent>((event, emit) async {
      emit(NotifikasiLoading());

      final result = await notifikasiUseCase.readAllNotifikasi();

      result.fold(
            (failure) => emit(NotifikasiError(message: failure.message)),
            (notifikasiList) => emit(AllNotifikasiHasData(notifikasiList: notifikasiList)),
      );
    });

    on<ReadNotifikasiEvent>((event, emit) async {
      emit(NotifikasiLoading());

      final result = await notifikasiUseCase.readNotifikasi(event.idNotifikasi);

      result.fold(
            (failure) => emit(NotifikasiError(message: failure.message)),
            (notifikasi) => emit(NotifikasiHasData(notifikasi: notifikasi)),
      );
    });

    on<UpdateNotifikasiEvent>((event, emit) async {
      emit(NotifikasiLoading());

      final result = await notifikasiUseCase.updateNotifikasi(event.notifikasi);

      result.fold(
            (failure) => emit(NotifikasiError(message: failure.message)),
            (_) => emit(NotifikasiSuccess()),
      );
    });

    on<DeleteNotifikasiEvent>((event, emit) async {
      emit(NotifikasiLoading());

      final result = await notifikasiUseCase.deleteNotifikasi(event.idNotifikasi);

      result.fold(
            (failure) => emit(NotifikasiError(message: failure.message)),
            (_) => emit(NotifikasiSuccess()),
      );
    });
  }
}
