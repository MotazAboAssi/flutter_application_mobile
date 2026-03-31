import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetflixStylePage(),
    );
  }
}

class NetflixStylePage extends StatelessWidget {
  const NetflixStylePage({super.key});

  // Sample data: each category has a list of items
  final Map<String, List<String>> categories = const {
    "Trending Now": ["Movie 1", "Movie 2", "Movie 3", "Movie 4"],
    "Top Picks for You": ["Pick 1", "Pick 2", "Pick 3"],
    "New Releases": ["New 1", "New 2", "New 3", "New 4", "New 5"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Netflix Style UI")),
      body: ListView(
        children: categories.entries.map((entry) {
          final title = entry.key;
          final items = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Horizontal list of items
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.375,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true, // height adapts to tallest child
                  // physics:
                  //     const ClampingScrollPhysics(), // no vertical scroll conflict
                  children: items.map((item) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text( 
                          item,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
