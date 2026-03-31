import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_app/data/notes_hive.dart';

class InputSearch extends StatelessWidget {
  final ValueNotifier<String> filter;
  final ValueNotifier<bool> isClick;

  const InputSearch({super.key, required this.isClick, required this.filter});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return ValueListenableBuilder(
      valueListenable: Boxes.getNotes().listenable(),
      builder: (context, box, child) {
        return TextField(
          controller: controller,
          onChanged: (value) {
            filter.value = value;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
              ),
              onPressed: () {
                filter.value = "";
                isClick.value = !isClick.value;
              },
              icon: const Icon(Icons.close, size: 30, color: Colors.white),
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: "Search",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        );
      },
    );
  }
}
