import 'package:dartz/dartz.dart';
import 'package:mipoka/domain/utils/failure.dart';
import 'package:mipoka/mipoka/domain/entities/session.dart';
import 'package:mipoka/mipoka/domain/repositories/mipoka_repositories.dart';

class SessionUseCase {
  final MipokaRepositories mipokaRepositories;

  SessionUseCase({required this.mipokaRepositories});

  Future<Either<Failure, List<Session>>> readAllSession() {
    return mipokaRepositories.readAllSession();
  }

  Future<Either<Failure, Session>> readSession(int idSession) {
    return mipokaRepositories.readSession(idSession);
  }

  Future<Either<Failure, void>> createSession(Session session) {
    return mipokaRepositories.createSession(session);
  }

  Future<Either<Failure, void>> updateSession(Session session) {
    return mipokaRepositories.updateSession(session);
  }

  Future<Either<Failure, void>> deleteSession(int idSession) {
    return mipokaRepositories.deleteSession(idSession);
  }
}
