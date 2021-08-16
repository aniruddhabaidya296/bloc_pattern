import 'package:bloc_patter_example_app/models/driver.dart';

abstract class InstantBookingState {
  const InstantBookingState();
  List<Object> get props => [];
}

class InstantBookingInitial extends InstantBookingState {
  @override
  List<Object> get props => [];
}

class InstantBookingLoading extends InstantBookingState {
  @override
  List<Object> get props => [];
}

class InstantBookingSuccess extends InstantBookingState {
  Driver driver;

  InstantBookingSuccess({this.driver});
  @override
  List<Object> get props => [driver];
}

class InstantBookingFailed extends InstantBookingState {
  final String message;
  InstantBookingFailed({this.message});
  @override
  List<Object> get props => [message];
}
