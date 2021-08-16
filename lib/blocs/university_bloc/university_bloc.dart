import 'dart:convert';

import 'package:bloc_patter_example_app/blocs/university_bloc/university_event.dart';
import 'package:bloc_patter_example_app/blocs/university_bloc/university_state.dart';
import 'package:bloc_patter_example_app/dao/university_dao.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_patter_example_app/models/university.dart';
import 'package:http/http.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityDao universityDao;

  UniversityBloc() : super(UniversityEmpty()) {
    universityDao = UniversityDao();
  }

  @override
  Stream<UniversityState> mapEventToState(
    UniversityEvent event,
  ) async* {
    if (event is FetchUniversity) {
      // yield UniversityLoading();
      try {
        var response = await universityDao.fetchUniversity();
        var jsonDecoded = jsonDecode(response.body);
        if (response.statusCode == 200) {
          List<University> universities = [];
          for (int i = 0; i < 10; i++) {
            University university = new University();

            String country = jsonDecoded[i]["country"];
            String code = jsonDecoded[i]['alpha_two_code'];
            String name = jsonDecoded[i]['name'];
            List<dynamic> domains = jsonDecoded[i]['domains'];
            university.createUniversity(country, code, name, domains);
            // print("${university.name}");
            universities.add(university);
            // for (int j = 0; j < i; j++) {
            //   print("universities[$j]: ${universities[j].name}");
            // }
          }
          if (jsonDecoded != null) {
            yield UniversityLoaded(universities);
          } else {
            yield UniversityError(message: 'Something went wrong');
          }
        }
      } catch (error) {
        yield UniversityError(message: error.toString());
      }
    }
  }
}
