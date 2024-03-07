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
  void initState() {
    context.read<ProductsBloc>().add(const ProductLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 0, 0, 0),
        shadowColor: const Color.fromARGB(248, 121, 121, 121),
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
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [Colors.red, Colors.blue],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(0.8, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(0.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(236, 54, 54, 54),
                      ),
                      child: ListTile(
                        title: Text(state.products[index].title!),
                        subtitle: Text(
                          state.products[index].description!,
                          style: const TextStyle(
                              color: Color.fromARGB(212, 191, 191, 191)),
                        ),
                        leading: Image.network(state.products[index].image!),
                        trailing: Text('RS ${((state.products[index].price)!.toDouble()*82.90).round()}', style: TextStyle(color: Colors.amber)),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}
