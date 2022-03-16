import 'package:flutter/material.dart';
import 'package:note_calendar/presentation/1.%20main/state/main_state.dart';

class MainViewModel with ChangeNotifier {
  MainState _state = MainState(tabNumber: 0);

  MainState get state => _state;

  void changeTab(int _tabNumber) {
    _state = state.copyWith(tabNumber: _tabNumber);
    notifyListeners();
  }
}
