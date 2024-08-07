// product_state.dart
import 'package:equatable/equatable.dart';
import 'package:browncart_user/model/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String error;

  const ProductError(this.error);

  @override
  List<Object> get props => [error];
}
