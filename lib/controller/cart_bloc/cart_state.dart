import 'package:equatable/equatable.dart';
import '../../model/cart_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> cartItems;

  const CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {}
