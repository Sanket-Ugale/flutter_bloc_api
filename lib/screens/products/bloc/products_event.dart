part of 'products_bloc.dart';

// @immutable
sealed class ProductsEvent {
  const ProductsEvent();

  // @override
  List<Object> get props => [];
}

class ProductLoadedEvent {
  const ProductLoadedEvent();
}