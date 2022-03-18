import 'package:flutter/material.dart';
import 'package:note_calendar/domain/model/note/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note, this.onDeleteTap})
      : super(key: key);
  final Function? onDeleteTap;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(note.color),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: SizedBox(
            height: 80,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    note.title,
                    style: TextStyle(
                      fontSize: note.fontSize.toDouble(),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        note.content,
                        style: TextStyle(
                          fontSize: note.fontSize.toDouble(),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onDeleteTap?.call();
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
      ),
    );
  }
}
