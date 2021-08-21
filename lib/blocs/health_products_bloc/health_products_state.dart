import 'package:bloc_patter_example_app/models/health_product.dart';
import 'package:equatable/equatable.dart';

abstract class HealthProductsState extends Equatable {
  const HealthProductsState();
}

class HealthProductsEmpty extends HealthProductsState {
  @override
  List<Object> get props => [];
}

class HealthProductsLoading extends HealthProductsState {
  @override
  List<Object> get props => [];
}

class HealthProductsLoaded extends HealthProductsState {
  final List<HealthProduct> healthProducts;
  HealthProductsLoaded(this.healthProducts);

  @override
  List<Object> get props => [];
}

class HealthProductsError extends HealthProductsState {
  String message;

  HealthProductsError({this.message});

  @override
  List<Object> get props => [message];
}
