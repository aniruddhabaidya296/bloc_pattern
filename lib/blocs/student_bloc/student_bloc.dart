import 'dart:convert';
import 'package:bloc_patter_example_app/dao/student_dao.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_patter_example_app/models/student.dart';
import 'package:http/http.dart';

import 'student_event.dart';
import 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentDao studentDao;
  Student student = new Student();

  StudentBloc() : super(StudentEmpty()) {
    studentDao = StudentDao();
  }

  @override
  Stream<StudentState> mapEventToState(
    StudentEvent event,
  ) async* {
    if (event is FetchStudent) {
      // yield StudentLoading();
      try {
        var response = await studentDao.fetchStudent();
        // print(response);
        var jsonDecoded = jsonDecode(response);
        // print("Name: ${jsonDecoded['Name']}");
        print(jsonDecoded['body']);
        if (jsonDecoded['statusCode'] == 200) {
          String name = jsonDecoded['body']['Name'];
          String std = jsonDecoded['body']['Class'];
          String school = jsonDecoded['body']['School'];
          String board = jsonDecoded['body']['Board'];
          student.createStudent(name, std, school, board);
          if (jsonDecoded != null) {
            yield StudentLoaded(student);
          } else {
            yield StudentError(message: 'Something went wrong');
          }
        }
      } catch (error) {
        yield StudentError(message: error.toString());
      }
    }
  }
}
