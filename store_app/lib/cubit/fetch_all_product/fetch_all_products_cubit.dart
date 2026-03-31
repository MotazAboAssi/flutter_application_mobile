import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/fetch_all_product/fetch_all_products_states.dart';
import 'package:store_app/helper/display_message_from_Exception.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/test/print.dart';
import 'package:store_app/types/product_type.dart';

class FetchAllProductsCubit extends Cubit<FetchAllProductsStates> {
  final Dio dio;
  FetchAllProductsCubit(this.dio) : super(InitialFetch());
  Future<void> getAllFetchProducts() async {
    printWhite("Fetching ...");
    emit(FetchingData());
    try {
      List<ProductType> products = await GetAllProduct(dio).getAllProduct();
      emit(SuccessFetch(products: products));
      printWhite("Done");
    } catch (e) {
      printWhite("Failed");
      emit(
        FailedFetch(errorMessage: DisplayMessageFromException(e.toString())),
      );
    }
  }
}
