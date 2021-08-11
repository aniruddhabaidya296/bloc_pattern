import 'package:bloc_patter_example_app/blocs/university_bloc/university_bloc.dart';
import 'package:bloc_patter_example_app/blocs/university_bloc/university_event.dart';
import 'package:bloc_patter_example_app/ui/single_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/student_bloc/student_bloc.dart';
import 'blocs/student_bloc/student_event.dart';
import 'models/student.dart';
import 'navigator.dart';
import 'ui/university_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/university_list': (context) => BlocProvider<UniversityBloc>(
              create: (context) => UniversityBloc()..add(FetchUniversity()),
              child: UniversityList(),
            ),
        '/single_student': (context) => BlocProvider<StudentBloc>(
              create: (context) => StudentBloc()..add(FetchStudent()),
              child: StudentHome(),
            ),
      },
      home: NavigatorPage(),
    );
  }
}
