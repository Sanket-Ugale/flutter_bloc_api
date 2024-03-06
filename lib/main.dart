import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/repository/product_repo.dart';
import 'package:flutter_bloc_api/screens/home_screen.dart';
import 'package:flutter_bloc_api/screens/products/bloc/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => ProductRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(ProductRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc API Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            secondary: Colors.white,
            primary: Colors.white,
            surface: Colors.grey.shade800,
            onSurface: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onBackground: Colors.white,
            onError: Colors.red,
            background: Colors
                .grey.shade900, // Added named parameter 'secondaryVariant'
            error: Colors.red,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        home: const homePage(),
      ),
    );
  }
}
