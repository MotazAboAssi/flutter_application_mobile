import 'package:first_project/types/date_with_time_type.dart';

class NewsType {
  final String title, link,imageUrl ;
  final String? description;
  final DateWithTime pubDate;
  const NewsType({
    required this.title,
    required this.description,
    required this.pubDate,
    required this.imageUrl,
    required this.link,
  });

  factory NewsType.fromJSON(Map<String, dynamic> json) {
    final dataTimeAndDate = DateWithTime.fromString(json["pubDate"]);
    return NewsType(
      title: json["title"],
      description: json["description"],
      pubDate: dataTimeAndDate,
      imageUrl: json["image_url"],
      link: json["link"],
    );
  }
}
