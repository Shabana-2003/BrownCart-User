import 'package:bloc/bloc.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<SortProducts>(_onSortProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('myApp')
          .doc('Admin')
          .collection('Products')
          .get();
      final products = snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
      products.sort((a, b) => a.price.compareTo(b.price)); 
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void _onSortProducts(SortProducts event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final products = List<Product>.from((state as ProductLoaded).products);

      if (event.sortOption == 'Low to High') {
        products.sort((a, b) => a.price.compareTo(b.price));
      } else if (event.sortOption == 'High to Low') {
        products.sort((a, b) => b.price.compareTo(a.price));
      }
      emit(ProductLoaded(products));
    }
  }
  void _onFilterProducts(FilterProducts event, Emitter<ProductState> emit) {
  if (state is ProductLoaded) {
    final products = (state as ProductLoaded).products;

    final filteredProducts = products.where((product) {
      if (event.selectedCategories.isEmpty) return true; // Show all if no filter
      return event.selectedCategories.contains(product.category);
    }).toList();

    emit(ProductLoaded(filteredProducts));
  }}
}
