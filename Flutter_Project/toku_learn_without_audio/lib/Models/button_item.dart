import 'package:first_project/Pages/category.dart';
import 'package:first_project/Types/data.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatefulWidget {
  final String category;
  final Data props;
  final int id;
  const ButtonItem({
    super.key,
    required this.props,
    required this.id,
    required this.category,
  });

  @override
  State<ButtonItem> createState() => _ButtonItemState();
}

class _ButtonItemState extends State<ButtonItem> {
  bool isClick = false;
  Color buttonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 75),
          backgroundColor: const Color.fromARGB(255, 187, 185, 185),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
        onPressed: () {
          setState(() {
            if (!Category.isRunAnything ||
                (Category.isRunAnything && isClick)) {
              isClick = !isClick;
              buttonColor = isClick ? Colors.red : Colors.white;
              Category.isRunAnything = !Category.isRunAnything;
            }
          });
        },
        child: ListTile(
          textColor: buttonColor,
          iconColor: buttonColor,
          visualDensity: VisualDensity(vertical: 4),
          leading: widget.category != "phrases"
              ? Image.asset(
                  "assets/images/${widget.category}/${widget.props.imageName}",
                  fit: BoxFit.fill,
                )
              : null,
          title: Column(
            children: [
              Text(
                "En: ${widget.props.enName}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text(
                "Jp: ${widget.props.jpName}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          trailing: Icon(isClick ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}
