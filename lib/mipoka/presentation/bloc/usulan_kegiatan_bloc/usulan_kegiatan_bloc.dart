import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/usulan_kegiatan.dart';
import 'package:mipoka/mipoka/domain/use_cases/usulan_kegiatan_use_case.dart';

part 'usulan_kegiatan_event.dart';
part 'usulan_kegiatan_state.dart';

class UsulanKegiatanBloc
    extends Bloc<UsulanKegiatanEvent, UsulanKegiatanState> {
  final UsulanKegiatanUseCase usulanKegiatanUseCase;

  UsulanKegiatanBloc({required this.usulanKegiatanUseCase})
      : super(UsulanKegiatanEmpty()) {

    on<ReadUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase.readUsulanKegiatan(event.idUsulanKegiatan);

      result.fold((failure) => emit(UsulanKegiatanError(message: failure.message)),
              (usulanKegiatan) => emit(UsulanKegiatanHasData(usulanKegiatan: usulanKegiatan)));

      add(ReadUsulanKegiatanEvent(idUsulanKegiatan: event.idUsulanKegiatan));
    });

    on<ReadAllUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase.readAllUsulanKegiatan();

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
        (message) => emit(UsulanKegiatanSuccessMessage(message: message)),
      );

      add(ReadAllUsulanKegiatanEvent());
    });

    on<UpdateUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result = await usulanKegiatanUseCase
          .updateUsulanKegiatan(event.usulanKegiatan);

      result.fold(
        (failure) => emit(UsulanKegiatanError(message: failure.message)),
        (message) => emit(UsulanKegiatanSuccessMessage(message: message)),
      );

      add(const ReadUsulanKegiatanEvent(idUsulanKegiatan: 1));
    });

    on<DeleteUsulanKegiatanEvent>((event, emit) async {
      emit(UsulanKegiatanLoading());

      final result =
          await usulanKegiatanUseCase.deleteUsulanKegiatan(event.idUsulan);

      result.fold(
        (failure) => emit(UsulanKegiatanError(message: failure.message)),
        (message) => emit(UsulanKegiatanSuccessMessage(message: message)),
      );

      add(ReadAllUsulanKegiatanEvent());
    });
  }
}
