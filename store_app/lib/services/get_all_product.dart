import 'package:dio/dio.dart';
import 'package:store_app/config/api.dart';
import 'package:store_app/test/print.dart';
import 'package:store_app/types/product_type.dart';

class GetAllProduct {
  final Dio dio;

  GetAllProduct(this.dio);

  Future<List<ProductType>> getAllProduct() async {
    try {
      final response = await dio.get(api);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data!;
        final List<ProductType> products = data.map((e) {
          return ProductType.fromJSON(e);
        }).toList();
        return products;
      } else {
        throw Exception("Error code : ${response.statusCode}");
      }
    } on DioException catch (e) {
      printRed(e.toString());
      throw Exception(
        "close or open proxy based on status it now then check on internet",
      );
    } catch (e) {
      printRed("Error");
      printRed(e.toString());
      throw Exception(e.toString());
    }
  }
}
