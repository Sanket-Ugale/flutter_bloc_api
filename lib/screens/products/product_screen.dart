import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/screens/products/bloc/products_bloc.dart';

class productScreen extends StatefulWidget {
  const productScreen({super.key});

  @override
  State<productScreen> createState() => _productScreenState();
}
class _productScreenState extends State<productScreen> {
  @override
  void initState(){
    context.read<ProductsBloc>().add(const ProductLoadedEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Screen'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          titleSpacing: 10.0,
          elevation: 0.0,
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            else if (state is ProductsErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            else if (state is ProductsLoadedState) {
              return ListView.builder(itemCount: 20, itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 54, 54, 54),
                  
                  ),
                  
                  child: ListTile(
                    
                    title: Text(state.products[index].title!),
                    subtitle: Text(state.products[index].description!),
                    leading: Image.network(state.products[index].image!),
                    trailing: Text('\$${state.products[index].price}'),
                  ),
                );
              });
            }
            else {
              return const Center(
                child: Text('No Data'),
              );
            }
          },
        ));
  }
}
