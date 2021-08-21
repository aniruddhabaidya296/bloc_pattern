import 'package:equatable/equatable.dart';

abstract class HealthProductsEvent extends Equatable {
  const HealthProductsEvent();
}

class FetchHealthProducts extends HealthProductsEvent {
  // final HealthProducts student;

  @override
  List<Object> get props => [];
}
