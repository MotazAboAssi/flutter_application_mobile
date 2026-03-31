import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/collaps_sidebar/collaps_sidebar.dart';
import 'package:store_app/cubit/fetch_all_product/fetch_all_products_cubit.dart';
import 'package:store_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => FetchAllProductsCubit(Dio()),
        child: const HomeScreen(),
      ),
    );
  }
}
