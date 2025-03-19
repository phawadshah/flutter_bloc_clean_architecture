import 'package:dartz/dartz.dart';
import 'package:sgm_block/core/data/error/failure.dart';
import 'package:sgm_block/core/domain/usecases/base_usecase.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/features/persons/domain/repository/person_repository.dart';

class GetPersonUsecase extends BaseUseCase<Person, int> {
  final PersonRepository _personRepository;

  GetPersonUsecase({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;
  @override
  Future<Either<Failure, Person>> call(int p) async {
    return await _personRepository.getPerson(p);
  }
}
