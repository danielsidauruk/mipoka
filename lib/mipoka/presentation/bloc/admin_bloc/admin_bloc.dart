import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mipoka/mipoka/domain/entities/admin.dart';
import 'package:mipoka/mipoka/domain/use_cases/admin_use_case.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminUseCase adminUseCase;

  AdminBloc({required this.adminUseCase}) : super(AdminEmpty()) {
    on<CreateAdminEvent>((event, emit) async {
      emit(AdminLoading());

      final result = await adminUseCase.createAdmin(event.admin);

      result.fold(
            (failure) => emit(AdminError(message: failure.message)),
            (message) => emit(AdminSuccessMessage(message: message)),
      );

      add(ReadAdminEvent());
    });

    on<ReadAdminEvent>((event, emit) async {
      emit(AdminLoading());

      final result = await adminUseCase.readAdmin();

      result.fold(
            (failure) => emit(AdminError(message: failure.message)),
            (adminList) => emit(AdminHasData(adminList: adminList)),
      );
    });

    on<UpdateAdminEvent>((event, emit) async {
      emit(AdminLoading());

      final result = await adminUseCase.updateAdmin(event.admin);

      result.fold(
            (failure) => emit(AdminError(message: failure.message)),
            (message) => emit(AdminSuccessMessage(message: message)),
      );

      add(ReadAdminEvent());
    });

    on<DeleteAdminEvent>((event, emit) async {
      emit(AdminLoading());

      final result = await adminUseCase.deleteAdmin(event.adminId);

      result.fold(
            (failure) => emit(AdminError(message: failure.message)),
            (message) => emit(AdminSuccessMessage(message: message)),
      );

      add(ReadAdminEvent());
    });
  }
}
