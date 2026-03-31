import 'package:flutter/material.dart';
import 'package:store_app/data/notes_hive.dart';
import 'package:store_app/helper/action_floating_button.dart';
import 'package:store_app/widgets/app_bar_home_view.dart';
import 'package:store_app/widgets/body_home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ValueNotifier<String> filter = ValueNotifier("");
  @override
  void dispose() {
    Boxes.getNotes().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ActionFloatingButton(),
      body: Column(
        children: [
          AppBarHomeView(filter: filter),
          BodyHomeView(filter: filter),
        ],
      ),
    );
  }
}
