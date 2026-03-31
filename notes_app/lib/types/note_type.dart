import 'package:hive/hive.dart';

part 'note_type.g.dart';

@HiveType(typeId: 0)
class NoteType extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime date;

  NoteType({
    required this.title,
    required this.description,
    required this.date,
  });
}
