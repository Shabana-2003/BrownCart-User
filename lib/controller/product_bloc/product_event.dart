// product_event.dart
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class SortProducts extends ProductEvent {
  final String sortOption;

  const SortProducts(this.sortOption);

  @override
  List<Object> get props => [sortOption];
}
class FilterProducts extends ProductEvent {
  final List<String> selectedCategories;

  const FilterProducts(this.selectedCategories);

  @override
  List<Object> get props => [selectedCategories];
}