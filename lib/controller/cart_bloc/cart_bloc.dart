import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../../model/cart_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final String user;

  CartBloc(this.user) : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    try {
      final cartItems = await Cart.getCartItems(user).first;
      emit(CartLoaded(cartItems));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final updatedCart = List<Cart>.from((state as CartLoaded).cartItems);
      final item = updatedCart[event.index];
      updatedCart[event.index] = item.copyWith(itemCount: event.quantity);
      emit(CartLoaded(updatedCart));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final updatedCart = List<Cart>.from((state as CartLoaded).cartItems);
      updatedCart.removeAt(event.index);
      emit(CartLoaded(updatedCart));
    }
  }
}
