import 'package:first_project/Actions/push.dart';
import 'package:first_project/Pages/category.dart';
import 'package:first_project/Types/category_props.dart';
import 'package:flutter/material.dart';

class ButtonCategory extends StatelessWidget {
  final CategoryProps props;
  final int id;
  const ButtonCategory({super.key, required this.props, required this.id});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = props.background;
    final Color textAndIconColor = props.background == Colors.red
        ? Colors.white
        : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: ElevatedButton(
        onPressed: () => moveTo(context, Category(id: id)),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        child: ListTile(
          iconColor: textAndIconColor,
          textColor: textAndIconColor,
          leading: Icon(props.icon, size: 40, fontWeight: FontWeight.w600),
          title: Text(
            props.nameEN,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            props.nameJB,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward, size: 30),
        ),
      ),
    );
  }
}
