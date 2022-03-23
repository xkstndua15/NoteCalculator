import 'package:flutter/material.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/component/note_item.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/event/notes_event.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/notes_view_model.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/state/notes_state.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/add_edit_note_view.dart';
import 'package:provider/provider.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotesViewModel viewModel = context.watch<NotesViewModel>();
    final NotesState state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('노트'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ...state.notes.map(
              (note) => GestureDetector(
                onTap: () async {
                  bool isUpdate = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddEditNoteView(
                        note: note,
                      ),
                    ),
                  );

                  if (isUpdate == true) {
                    viewModel.onEvent(const NotesEvent.loadNotes());
                  }
                },
                child: NoteItem(
                  note: note,
                  onDeleteTap: () {
                    viewModel.onEvent(NotesEvent.deleteNote(note));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditNoteView(),
            ),
          );

          if (isSaved == true) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
