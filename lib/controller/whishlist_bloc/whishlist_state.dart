import 'package:equatable/equatable.dart';
import 'package:browncart_user/model/product_model.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<Product> wishlist;

  const WishlistLoaded(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {}
