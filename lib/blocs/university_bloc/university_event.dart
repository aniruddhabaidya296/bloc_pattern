import 'package:bloc_patter_example_app/models/student.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class UniversityEvent extends Equatable {
  const UniversityEvent();
}

class FetchUniversity extends UniversityEvent {
  // final University student;

  @override
  List<Object> get props => [];
}
