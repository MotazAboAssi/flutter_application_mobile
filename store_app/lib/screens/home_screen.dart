import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/actions/back_to.dart';
import 'package:store_app/actions/error_dialog_object.dart';
import 'package:store_app/collaps_sidebar/collaps_sidebar.dart';
import 'package:store_app/cubit/fetch_all_product/fetch_all_products_cubit.dart';
import 'package:store_app/cubit/fetch_all_product/fetch_all_products_states.dart';
import 'package:store_app/widgets/home_screen/product_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/test/print.dart';
import 'package:store_app/types/product_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchAllProductsCubit>(context).getAllFetchProducts();
    return Scaffold(
      // start AppBar
      appBar: AppBar(
        centerTitle: true,
        title: Text("new Trends"),
        actions: [
          IconButton(
            onPressed: () async {
              await GetAllProduct(Dio()).getAllProduct();
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 75),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          slivers: [
          

            BlocConsumer<FetchAllProductsCubit, FetchAllProductsStates>(
              builder: (context, state) {
                if (state is SuccessFetch) {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final ProductType product = state.products[index];
                      return ProductModel(product: product);
                    }, childCount: state.products.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.29,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 70,
                    ),
                  );
                } else if (state is FailedFetch) {
                  return SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "there error ☹️, try again later",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(15),
                            ),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            "Try !",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                printWhite((state is InitialFetch).toString());
                return SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              listener:
                  (BuildContext context, FetchAllProductsStates state) async {
                    if (state is FailedFetch) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            errorDialog(state, context),
                      );
                    }
                  },
            ),
          ],
        ),
      ),
    );
  }
}
