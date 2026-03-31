import 'package:first_project/types/category_type.dart';
import 'package:first_project/views/category_view.dart';
import 'package:flutter/material.dart';

class CategoryModel extends StatelessWidget {
  final CategoryType category;
  const CategoryModel({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                CategoryView(category: category),
          ),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/news/${category.en.toLowerCase()}.webp',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Center(
                child: Text(
                  category.ar,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
