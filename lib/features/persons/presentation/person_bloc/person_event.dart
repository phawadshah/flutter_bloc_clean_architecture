import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
  @override
  List<Object?> get props => [];
}

class GetPersonEvent extends PersonEvent {
  int id;
  GetPersonEvent(this.id);
}
