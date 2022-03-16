import 'package:flutter/material.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/notes_view_model.dart';
import 'package:note_calendar/presentation/2.%20note/1.%20notes/state/notes_state.dart';
import 'package:provider/provider.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotesViewModel viewModel = context.watch<NotesViewModel>();
    final NotesState state = viewModel.state;
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
