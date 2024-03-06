part of 'products_bloc.dart';

// @immutable
sealed class ProductsState {
  const ProductsState();
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {
  ProductsLoadingState();
}

class ProductsLoadedState extends ProductsState {
  final List<ProductsModel> products;
  const ProductsLoadedState(this.products);
  @override
  List<Object> get props => [];
}

class ProductsErrorState extends ProductsState {
  final String errorMessage;
  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}


