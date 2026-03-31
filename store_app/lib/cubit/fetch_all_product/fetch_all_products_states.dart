import 'package:store_app/types/product_type.dart';

class FetchAllProductsStates {}

class InitialFetch extends FetchAllProductsStates {}

class FetchingData extends FetchAllProductsStates {}

class SuccessFetch extends FetchAllProductsStates {
  final List<ProductType> products;
  SuccessFetch({required this.products});
}

class FailedFetch extends FetchAllProductsStates {
  final String errorMessage;

  FailedFetch({required this.errorMessage});
}
