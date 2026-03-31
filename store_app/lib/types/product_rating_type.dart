class ProductRatingType {
  final double rate;
  final int count;

  ProductRatingType({required this.rate, required this.count});

  factory ProductRatingType.fromJSON(Map<String, dynamic> json) {
    return ProductRatingType(
      rate: double.parse(json["rate"].toString()),
      count: int.parse(json["count"].toString()),
    );
  }
}
