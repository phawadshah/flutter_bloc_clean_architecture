import 'package:equatable/equatable.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/utils/enums.dart';

class PersonState extends Equatable {
  final Person? person;
  final String message;
  final RequestStatus status;

  const PersonState({
    this.person,
    this.message = '',
    this.status = RequestStatus.loading,
  });

  PersonState copyWith({
    Person? person,
    String? message,
    RequestStatus? status,
  }) {
    return PersonState(
      person: person ?? this.person,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [person, message, status];
}
