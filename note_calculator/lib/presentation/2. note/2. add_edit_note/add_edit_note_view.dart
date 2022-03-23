import 'package:flutter/material.dart';
import 'package:note_calendar/domain/model/note/note.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/add_edit_note_view_model.dart';
import 'package:note_calendar/presentation/2.%20note/2.%20add_edit_note/event/add_edit_note_event.dart';
import 'package:note_calendar/ui/color.dart';
import 'package:provider/provider.dart';

class AddEditNoteView extends StatefulWidget {
  const AddEditNoteView({Key? key, this.note}) : super(key: key);
  final Note? note;

  @override
  State<AddEditNoteView> createState() => _AddEditNoteViewState();
}

class _AddEditNoteViewState extends State<AddEditNoteView> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        context.read<AddEditNoteViewModel>().onEvent(
            AddEditNoteEvent.setUsedNote(
                widget.note!.color, widget.note!.fontSize));
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (titleController.text.isEmpty &&
                contentController.text.isEmpty) {
              Navigator.of(context).pop(false);
            } else {
              viewModel.onEvent(
                SaveNote(
                  widget.note == null ? null : widget.note!.id,
                  titleController.text,
                  contentController.text,
                  state.color,
                  state.fontSize,
                ),
              );
              titleController.clear();
              contentController.clear();
              Navigator.of(context).pop(true);
            }
          },
        ),
        title: TextField(
          style: TextStyle(fontSize: state.fontSize.toDouble()),
          controller: titleController,
          decoration: const InputDecoration(
            hintText: '제목을 입력하세요',
            hintStyle: TextStyle(
              color: textWhite,
            ),
          ),
        ),
        actions: [
          DropdownButton(
              value: state.fontSize.toString(),
              items: fontSizeList.map((value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (value) {
                viewModel.onEvent(ChangeFontSize(int.parse(value.toString())));
              }),
          IconButton(
            onPressed: () {
              if (titleController.text.isEmpty &&
                  contentController.text.isEmpty) {
                Navigator.of(context).pop(false);
              } else {
                viewModel.onEvent(
                  AddEditNoteEvent.saveNote(
                    widget.note == null ? null : widget.note!.id,
                    titleController.text,
                    contentController.text,
                    state.color,
                    state.fontSize,
                  ),
                );
                titleController.clear();
                contentController.clear();
                Navigator.of(context).pop(true);
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: noteColors
                .map(
                  (color) => InkWell(
                    onTap: () {
                      viewModel
                          .onEvent(AddEditNoteEvent.changeColor(color.value));
                    },
                    child: _buildBackgroundColor(
                        color, state.color == color.value),
                  ),
                )
                .toList(),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Container(
              color: Color(state.color),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  style: TextStyle(fontSize: state.fontSize.toDouble()),
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: '내용을 입력하세요',
                    hintStyle: TextStyle(
                      color: textWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Color> noteColors = [
    blue,
    yellow,
    purple,
    red,
    green,
  ];

  final fontSizeList = ['12', '14', '16', '20'];

  Widget _buildBackgroundColor(Color color, bool selected) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 1.0)
          ],
          border:
              selected ? Border.all(color: Colors.black, width: 2.0) : null),
    );
  }
}
