import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_api/models/product_models.dart';
import 'package:flutter_bloc_api/repository/product_repo.dart';
// import 'package:http/http.dart' as http;
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductLoadedEvent, ProductsState> {
  final ProductRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productsRepo.getProducts();
        emit (ProductsLoadedState(data));
      } catch (e) {
        emit(ProductsErrorState('Failed to load products ${e.toString()}'));        
      }
    });
  }
}
