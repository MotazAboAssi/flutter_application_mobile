import 'package:store_app/types/product_rating_type.dart';

class ProductType {
  final int id;
  final String title, description, image, category;
  final double price;
  final ProductRatingType rating;

  ProductType({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rating,
  });

  factory ProductType.fromJSON(Map<String, dynamic> json) {
    return ProductType(
      id: int.parse(json["id"].toString()),
      title: json["title"],
      description: json["description"],
      image: json["image"],
      price: double.parse(json["price"].toString()),
      category: json["category"],
      rating: ProductRatingType.fromJSON(json["rating"]),
    );
  }
}
