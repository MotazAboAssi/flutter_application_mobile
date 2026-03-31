import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({super.key});

  // Sample data: each category has a list of items
  final Map<String, List<String>> categories = const {
    "Trending Now": ["Movie 1", "Movie 2", "Movie 3", "Movie 4"],
    "Top Picks for You": ["Pick 1", "Pick 2", "Pick 3"],
    "New Releases": ["New 1", "New 2", "New 3", "New 4", "New 5"],
  };

  @override
  Widget build(BuildContext context) {
    return NetflixUI(categories: categories,);
  }
}

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AspectRatio Example")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text("Square (1:1)"),
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(color: Colors.blue),
          ),
          const SizedBox(height: 20),

          const Text("Video (16:9)"),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(color: Colors.black),
          ),
          const SizedBox(height: 20),

          const Text("Poster (2:3)"),
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class NetflixUI extends StatelessWidget {
  final Map<String, List<String>> categories;
  const NetflixUI({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: categories.entries.map((category) {
          final String title = category.key;
          final List<String> items = category.value;
      
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title : "),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: items.map((item) {
                      return AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                          // width: MediaQuery.of(context).size.width * 0.5,
                          margin: EdgeInsets.all(8),
                          child: Center(child: Text(item)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
