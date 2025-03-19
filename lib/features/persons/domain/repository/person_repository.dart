import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';

abstract class PersonRepository {
  Future<Either<Failure, Person>> getPerson(int id);
}
