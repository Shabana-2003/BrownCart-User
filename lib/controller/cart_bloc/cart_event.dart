import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class UpdateQuantity extends CartEvent {
  final int index;
  final int quantity;

  const UpdateQuantity(this.index, this.quantity);

  @override
  List<Object> get props => [index, quantity];
}

class RemoveFromCart extends CartEvent {
  final int index;

  const RemoveFromCart(this.index);

  @override
  List<Object> get props => [index];
}
