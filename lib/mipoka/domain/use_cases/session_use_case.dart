import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class SessionUseCase {
  final MipokaRepositories mipokaRepositories;

  SessionUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Session>>> readSession() {
    return mipokaRepositories.readSession();
  }

  Future<Either<Failure, String>> createSession(Session session) {
    return mipokaRepositories.createSession(session);
  }

  Future<Either<Failure, String>> updateSession(Session session) {
    return mipokaRepositories.updateSession(session);
  }

  Future<Either<Failure, String>> deleteSession(int idSession) {
    return mipokaRepositories.deleteSession(idSession);
  }
}
