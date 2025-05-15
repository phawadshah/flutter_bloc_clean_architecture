import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgm_block/features/persons/domain/usecases/get_person_usecase.dart';
import 'package:sgm_block/features/persons/presentation/person_bloc/person_event.dart';
import 'package:sgm_block/features/persons/presentation/person_bloc/person_state.dart';
import 'package:sgm_block/utils/enums.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetPersonUsecase _getPersonUsecase;

  PersonBloc({required GetPersonUsecase getPersonUsecase})
      : _getPersonUsecase = getPersonUsecase,
        super(const PersonState()) {
    on<GetPersonEvent>(_getPerson);
  }

  Future _getPerson(
    GetPersonEvent event,
    Emitter<PersonState> emit,
  ) async {
    if (state.status == RequestStatus.error) {
      emit(state.copyWith(status: RequestStatus.retrying));
    }
    var personOrError = await _getPersonUsecase(event.id);
    personOrError.fold(
      (error) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: error.message,
        ),
      ),
      (person) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          person: person,
        ),
      ),
    );
  }
}
