import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mipoka/domain/utils/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> readAllBerita(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
