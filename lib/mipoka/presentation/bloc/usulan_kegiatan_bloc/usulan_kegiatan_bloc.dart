import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/use_cases/usulan_kegiatan_use_case.dart';

part 'usulan_kegiatan_event.dart';
part 'usulan_kegiatan_state.dart';

class UsulanKegiatanBloc
    extends Bloc<UsulanKegiatanEvent, UsulanKegiatanState> {
  final UsulanKegiatanUseCase usulanKegiatanUseCase;

  UsulanKegiatanBloc({
    required this.usulanKegiatanUseCase,
  })
      : super(UsulanKegiatanEmpty()) {
    on<ReadUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase.readUsulanKegiatan(event.idUsulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (usulanKegiatan) => emit(UsulanKegiatanHasData(usulanKegiatan: usulanKegiatan)),
      );
    });

    on<ReadAllUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase.readAllUsulanKegiatan(event.filter);

      result.fold(
        (failure) => emit(UsulanKegiatanError(message: failure.message)),
        (usulanKegiatanList) =>
            emit(AllUsulanKegiatanHasData(usulanKegiatanList: usulanKegiatanList)),
      );
    });

    on<CreateUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .createUsulanKegiatan(event.usulanKegiatan);

      result.fold(
        (failure) => emit(UsulanKegiatanError(message: failure.message)),
        (message) => emit(const UsulanKegiatanSuccess()),
      );
    });

    on<UpdateUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
        (failure) => emit(UsulanKegiatanError(message: failure.message)),
        (_) => emit(UpdateUsulanKegiatanSuccess()),
      );
    });

    on<DeleteUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result =
          await usulanKegiatanUseCase.deleteUsulanKegiatan(event.idUsulan);

      result.fold(
        (failure) => emit(UsulanKegiatanError(message: failure.message)),
        (_) => emit(UsulanKegiatanDeleted()),
      );
    });

    on<SaveUsulanKegiatanFirstPageEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (_) => emit(SaveUsulanKegiatanFirstPageSuccess()),
      );
    });

    on<ManagePartisipanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (_) => emit(ManagePartisipanSuccess()),
      );
    });

    on<ManageBiayaKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (_) => emit(ManageBiayaKegiatanSuccess()),
      );
    });

    on<ManageTertibAcaraEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (_) => emit(ManageTertibAcaraSuccess()),
      );
    });

    on<SaveAndSendLastPageEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (_) => emit(SaveAndSendLastPageSuccess()),
      );
    });

    on<SaveAndGoBackLastPageEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
            (failure) => emit(UsulanKegiatanError(message: failure.message)),
            (_) => emit(SaveAndGoBackLastPageSuccess()),
      );
    });
  }
}
