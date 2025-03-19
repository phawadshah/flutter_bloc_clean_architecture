import 'package:dartz/dartz.dart';

import 'package:sgm_block/core/data/error/exception.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/features/persons/data/datasource/person_remote_datasource.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/features/persons/domain/repository/person_repository.dart';

class PersonRepositoryImpl extends PersonRepository {
  final PersonRemoteDatasource _personRemoteDatasource;

  PersonRepositoryImpl({
    required PersonRemoteDatasource personRemoteDatasource,
  }) : _personRemoteDatasource = personRemoteDatasource;

  @override
  Future<Either<Failure, Person>> getPerson(int id) async {
    try {
      Person person = await _personRemoteDatasource.getPerson(id);
      return Right(person);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } catch (exception) {
      return Left(ServerFailure(exception.toString()));
    }
  }
}
