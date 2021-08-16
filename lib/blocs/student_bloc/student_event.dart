import 'package:bloc_patter_example_app/models/student.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

class FetchStudent extends StudentEvent {
  // final Student student;

  @override
  List<Object> get props => [];
}
