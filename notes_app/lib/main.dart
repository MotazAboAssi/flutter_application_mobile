import 'package:flutter/material.dart';
import 'package:store_app/config/constant_key.dart';
import 'package:store_app/types/note_type.dart';
import 'package:store_app/views/home_view.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.deleteBoxFromDisk(kNoteBox);
  Hive.registerAdapter(NoteTypeAdapter());
  await Hive.openBox<NoteType>(kNoteBox);
  // getApplicationDocumentsDirectory();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Roboto"),
      home: const HomeView(),
    );
  }
}
