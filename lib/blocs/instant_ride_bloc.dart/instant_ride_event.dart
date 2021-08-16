import 'package:bloc_patter_example_app/models/driver.dart';
import 'package:equatable/equatable.dart';

abstract class InstantBookingEvent extends Equatable {
  const InstantBookingEvent();
}

class RequestInstantRideEvent extends InstantBookingEvent {
  Driver driver;
  RequestInstantRideEvent({this.driver});

  @override
  List<Object> get props => [driver];
}

class FetchDriverProfileEvent extends InstantBookingEvent {
  String driverId;
  FetchDriverProfileEvent({this.driverId});

  @override
  List<Object> get props => [driverId];
}

class FetchRideEstimateEvent extends InstantBookingEvent {
  Driver driver;
  FetchRideEstimateEvent({this.driver});

  @override
  List<Object> get props => [driver];
}
