import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_app/actions/is_note_content_string.dart';
import 'package:store_app/data/notes_hive.dart';
import 'package:store_app/models/note_model.dart';
import 'package:store_app/types/note_type.dart';

class BodyHomeView extends StatelessWidget {
  final ValueNotifier<String> filter;
  const BodyHomeView({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: Boxes.getNotes().listenable(),
        builder: (context, box, child) {
          return ValueListenableBuilder(
            valueListenable: filter,
            builder: (context, filt, child) {
              List<NoteType> listView;

              if (filt.isEmpty) {
                listView = box.values.toList().cast<NoteType>();
              } else {
                listView = box.values
                    .where((note) => isNoteContentString(filt, note))
                    .toList()
                    .cast<NoteType>();
              }

              if (listView.isEmpty) {
                return const Center(child: Text("No Notes"));
              }

              return ListView.builder(
                itemCount: listView.length,
                itemBuilder: (context, index) {
                  final note = listView[index];
                  return NoteModel(note: note, indexNoteInBox: index);
                },
              );
            },
          );
        },
      ),
    );
  }
}

// class BodyHomeView extends StatelessWidget {
//   final ValueNotifier<String> filter;
//   const BodyHomeView({super.key, required this.filter});

//   @override
//   Widget build(BuildContext context) {
//     List<NoteType> listView = [];
//     return Expanded(
//       child: ValueListenableBuilder(
//         valueListenable: Boxes.getNotes().listenable(),
//         builder: (context, box, child) {
//           return ValueListenableBuilder(
//             valueListenable: filter,
//             builder: (context, filt, child) {
//               if (filt.isEmpty) {
//                 listView = box.values.toList().cast<NoteType>();
//               } else {
//                 listView = box.values
//                     .where((note) => isNoteContentString(filt, note))
//                     .toList()
//                     .cast<NoteType>();
//               }
//               return ListView.builder(
//                 itemCount: listView.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (listView.isEmpty) {
//                     return const Center(child: Text("No Notes"));
//                   }

//                   return ListView.builder(
//                     itemCount: listView.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final note = listView[index];
//                       return NoteModel(note: note, indexNoteInBox: index);
//                     },
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
