part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object?> get props => [];
}

class CreateAdminEvent extends AdminEvent {
  final Admin admin;

  const CreateAdminEvent(this.admin);

  @override
  List<Object?> get props => [admin];
}

class ReadAdminEvent extends AdminEvent {
  final int idAdmin;

  const ReadAdminEvent({required this.idAdmin});
}

class UpdateAdminEvent extends AdminEvent {
  final Admin admin;

  const UpdateAdminEvent(this.admin);

  @override
  List<Object?> get props => [admin];
}

class DeleteAdminEvent extends AdminEvent {
  final int adminId;

  const DeleteAdminEvent(this.adminId);

  @override
  List<Object?> get props => [adminId];
}

