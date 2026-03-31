// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(theme: ThemeData(), home: const Home()));

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> categories = ["A", "B", "C", "D"];
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "News",
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//             ),
//             Text(
//               "Clouds",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.amber,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: CustomScrollView(
//           physics: BouncingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(child: CategoryNews(categories: categories)),
//             NewsItems(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NewsItems extends StatelessWidget {
//   const NewsItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         childCount: 1000,
//         (context, builder) => News(),
//       ),
//     );
//   }
// }

// class News extends StatelessWidget {
//   const News({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage("assets/news/technology.jpeg"),
//                 ),
//               ),
//             ),
//           ),
//           const Text(
//             "Title",
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
//           ),

//           const Text(
//             "description",
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoryNews extends StatelessWidget {
//   final List<String> categories;
//   const CategoryNews({super.key, required this.categories});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 74.5,
//       // width: double.infinity,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (BuildContext context, int index) {
//           final String category = categories[index];
//           return AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.all(0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: Ink(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage("assets/news/technology.jpeg"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: const Color.fromRGBO(0, 0, 0, 0.5),
//                     ),
//                     child: Center(
//                       child: Text(
//                         category,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
