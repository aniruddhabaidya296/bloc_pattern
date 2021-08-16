import 'package:bloc_patter_example_app/models/student.dart';
import 'package:bloc_patter_example_app/models/university.dart';
import 'package:equatable/equatable.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();
}

class UniversityEmpty extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityLoading extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityLoaded extends UniversityState {
  final List<University> universities;
  UniversityLoaded(this.universities);

  @override
  List<Object> get props => [];
}

class UniversityError extends UniversityState {
  String message;

  UniversityError({this.message});

  @override
  List<Object> get props => [message];
}
