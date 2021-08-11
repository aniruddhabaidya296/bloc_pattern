import 'package:bloc_patter_example_app/blocs/university_bloc/university_bloc.dart';
import 'package:bloc_patter_example_app/blocs/university_bloc/university_state.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class UniversityList extends StatefulWidget {
  UniversityList({Key? key}) : super(key: key);

  @override
  _UniversityListState createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  late UniversityBloc universityBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    universityBloc = BlocProvider.of<UniversityBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Universities"),
      ),
      // backgroundColor: Colors.blue[100],
      body: Container(
        // color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<UniversityBloc, UniversityState>(
                  builder: (context, state) {
                // if (state is UniversityEmpty) {
                //   return Container(
                //     child: Text("No university"),
                //   );
                // }
                if (state is UniversityLoaded) {
                  return Container(
                    color: Colors.white,
                    height: SizeConfig.blockHeight * 80,
                    width: SizeConfig.blockWidth * 80,
                    child: ListView.builder(
                      itemCount: state.universities.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        print(index);
                        print(
                            "University[$index]: ${state.universities[index].name}");
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.indigo),
                                    color: Colors.blue
                                        .withOpacity(index.toDouble() / 15),
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockWidth * 2)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.blockWidth * 2,
                                    vertical: SizeConfig.blockHeight * 2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Country: ${state.universities[index].country}"),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Code: ${state.universities[index].alphaTwoCode}"),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Name: ${state.universities[index].name}"),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Domains: ${state.universities[index].domains}"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockHeight * 2),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is UniversityError) {
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
