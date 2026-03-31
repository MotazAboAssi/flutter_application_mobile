import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:first_project/data/theme.dart';
import 'package:first_project/service/http_requist.dart';
import 'package:first_project/types/news_type.dart';
import 'package:flutter/material.dart';

class NewsModel extends StatelessWidget {
  final NewsType news;
  const NewsModel({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: news.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      debugPrint(
                        "Image failed: $url, error: $error",
                      ); // 👈 log error
                      return Center(
                        child: Text(
                          "active proxy, you country is forbeddin",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Text(
              news.title,

              textDirection: TextDirection.rtl,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: lightPrimary,
              ),
            ),
            news.description == null
                ? SizedBox(width: 8, height: 8)
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      news.description!,
                      maxLines: 2,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                        color: primary,
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => HttpRequist(dio: Dio()).launchURL(news.link),
                  child: Text(
                    "التفاصيل",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      decorationColor: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  "التاريخ: ${news.pubDate.date}\nالوقت: ${news.pubDate.time}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }

  CachedNetworkImage imageNotFound(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      httpHeaders: {"User-Agent": "Mozilla/5.0"}, // ignored on web
      placeholder: (c, u) => CircularProgressIndicator(color: Colors.white),
      errorWidget: (c, u, e) => Image.asset('assets/news/warning.webp '),
    );
  }
}
