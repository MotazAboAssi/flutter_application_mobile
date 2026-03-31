import 'package:flutter/material.dart';
import 'package:project/types/weather_type.dart';

class FoundSearch extends StatelessWidget {
  const FoundSearch({super.key, required this.data});

  final WeatherType data;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Text(
          data.cityName,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text("تم التحديث في ${data.lastUpdate}", style: TextStyle(fontSize: 25)),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https:${data.icon}", scale: 0.1),
                ),
              ),
            ),
            Text("${data.tempAvg.toInt()}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, )),
            Column(
              children: [
                Text(
                  "درجة الحرارة الكبرى : ${data.tempMax.toInt()}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "درجة الحرارة الصغرى : ${data.tempMin.toInt()}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        Text(
          data.conditionWeather,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
