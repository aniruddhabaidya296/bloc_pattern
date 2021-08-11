import 'package:bloc_patter_example_app/blocs/student_bloc/student_bloc.dart';
import 'package:bloc_patter_example_app/blocs/student_bloc/student_state.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentHome extends StatefulWidget {
  StudentHome({Key? key}) : super(key: key);

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  late StudentBloc studentBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentBloc = BlocProvider.of<StudentBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<StudentBloc, StudentState>(builder: (context, state) {
                // if (state is StudentEmpty) {
                //   return Container(
                //     child: Text("No student"),
                //   );
                // }
                if (state is StudentLoaded) {
                  return Container(
                    width: SizeConfig.blockWidth * 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo),
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 2)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 2,
                        vertical: SizeConfig.blockHeight * 2),
                    child: Column(
                      children: [
                        Text("Name: ${state.student.name}"),
                        Text("Class: ${state.student.std}"),
                        Text("School: ${state.student.school}"),
                        Text("Board: ${state.student.board}"),
                      ],
                    ),
                  );
                }
                if (state is StudentError) {
                  return Center(
                    child: Container(
                      width: 200,
                      child: Text(
                        state.message,
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
