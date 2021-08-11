import 'package:bloc_patter_example_app/models/student.dart';
import 'package:equatable/equatable.dart';

abstract class StudentState extends Equatable {
  const StudentState();
}

class StudentEmpty extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentLoading extends StudentState {
  @override
  List<Object> get props => [];
}

class StudentLoaded extends StudentState {
  final Student student;
  StudentLoaded(this.student);

  @override
  List<Object> get props => [];
}

class StudentError extends StudentState {
  String message;

  StudentError({required this.message});

  @override
  List<Object> get props => [message];
}
