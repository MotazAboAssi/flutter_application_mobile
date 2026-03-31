import 'package:first_project/Actions/logic_view.button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyleAppBar = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Toku", style: textStyleAppBar),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(backgroundColor: Colors.red),
            ),
            Text("Learn", style: textStyleAppBar),
          ],
        ),
      ),

      body: Container(
        color: Colors.grey,
        child: Column(children: logicViewButton()),
      ),
    );
  }
}
