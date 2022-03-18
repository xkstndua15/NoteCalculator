import 'package:flutter/material.dart';
import 'package:note_calendar/presentation/1.%20main/component/main_body_list.dart';
import 'package:note_calendar/presentation/1.%20main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: mainBodyList[state.tabNumber],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tabNumber) {
          viewModel.changeTab(tabNumber);
        },
        currentIndex: state.tabNumber,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_sharp),
            label: '노트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_rounded),
            label: '계산기',
          ),
        ],
      ),
    );
  }
}
