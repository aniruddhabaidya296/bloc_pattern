import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_patter_example_app/blocs/instant_ride_bloc.dart/instant_ride_event.dart';
import 'package:bloc_patter_example_app/blocs/instant_ride_bloc.dart/instant_ride_state.dart';
import 'package:bloc_patter_example_app/dao/instant_ride_dao.dart';
import 'package:bloc_patter_example_app/models/driver.dart';

class InstantBookingBloc
    extends Bloc<InstantBookingEvent, InstantBookingState> {
  InstantBookingBloc() : super(InstantBookingInitial()) {
    instantRideDao = new InstantRideDao();
  }

  InstantRideDao instantRideDao;

  @override
  Stream<InstantBookingState> mapEventToState(
      InstantBookingEvent event) async* {
    if (event is FetchDriverProfileEvent) {
      yield* _mapFetchDriverProfileToState(event);
    }
  }

  Stream<InstantBookingState> _mapFetchDriverProfileToState(
      FetchDriverProfileEvent event) async* {
    yield InstantBookingLoading();
    try {
      print(event);
      Driver driver;
      var response = await instantRideDao.fetchDriver(event.driverId);
      var jsonDecoded = jsonDecode(response.body);
      if (response.statusCode == 200 && jsonDecoded['status'] == 'success') {
        print(jsonDecoded);
        driver = Driver(data: jsonDecoded['data']);

        yield InstantBookingSuccess(driver: driver);
      }
    } catch (e) {
      print(e);
      yield InstantBookingFailed(message: 'Something went wrong');
    }
  }
}
