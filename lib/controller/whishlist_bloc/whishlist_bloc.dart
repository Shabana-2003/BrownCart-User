import 'package:browncart_user/controller/whishlist_bloc/whishlist_event.dart';
import 'package:browncart_user/controller/whishlist_bloc/whishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/model/wishlist_model.dart';


class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final String user;

  WishlistBloc(this.user) : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
  }

  void _onLoadWishlist(LoadWishlist event, Emitter<WishlistState> emit) async {
    try {
      final wishlist = await WishList.getWishlist(user).first;
      emit(WishlistLoaded(wishlist));
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddToWishlist(AddToWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      final List<Product> updatedWishlist =
          List.from((state as WishlistLoaded).wishlist)
            ..add(event.product);
      await WishList.addToWishlist(user, event.product);
      emit(WishlistLoaded(updatedWishlist));
    }
  }

  void _onRemoveFromWishlist(RemoveFromWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      final List<Product> updatedWishlist =
          List.from((state as WishlistLoaded).wishlist)
            ..remove(event.product);
      await WishList.deleteFromWishlist(user, event.product);
      emit(WishlistLoaded(updatedWishlist));
    }
  }
}
