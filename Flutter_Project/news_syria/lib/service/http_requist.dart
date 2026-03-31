import 'package:dio/dio.dart';
import 'package:first_project/types/news_type.dart';
import 'package:url_launcher/url_launcher.dart';

class HttpRequist {
  final Dio dio;
  const HttpRequist({required this.dio});
  //  Fututre<List<NewsType>>
  Future<List<NewsType>> getByCategory({String? category}) async {
    try {
      final response = await dio.get(
        "https://newsdata.io/api/1/latest?apikey=pub_c621e308116d46129bcb145705ef17ca&language=ar&country=sy${category == null ? "" : "&category=$category"}",
      );
      final List<dynamic> data = response.data["results"];
      final List<NewsType> allNews = data
          .map((news) => NewsType.fromJSON(news as Map<String, dynamic>))
          .toList();
      return allNews;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> launchURL(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication, // <-- this makes it open in browser
    )) {
      print("object");
    }
  }
}
