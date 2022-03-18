import 'package:flutter/material.dart';
import 'package:note_calendar/domain/use_case/calc_use_case/calculator_use_cases.dart';
import 'package:note_calendar/presentation/3.%20calculator/event/calculator_event.dart';
import 'package:note_calendar/presentation/3.%20calculator/state/calculator_state.dart';

class CalculatorViewModel extends ChangeNotifier {
  CalculatorUseCases useCases;

  CalculatorState _state = CalculatorState(
    resultList: [],
    srcValue: null,
    operator: null,
    destValue: null,
    result: null,
  );

  CalculatorState get state => _state;

  CalculatorViewModel(this.useCases);

  void onEvent(CalculatorEvent event) {
    event.when(
      calculation: _calculation,
      clearResult: _clearResult,
      getResultList: _getResultsList,
      clickNumber: _clickNumber,
      clickOperator: _clickOperator,
      clickString: _clickString,
    );
  }

  Future<void> _calculation(double src, double dest, String operator) async {
    notifyListeners();
  }

  Future<void> _clearResult() async {}

  Future<void> _getResultsList() async {
    final resultList = await useCases.getResultUseCase();
    _state = state.copyWith(resultList: resultList);
  }

  Future<void> _clickNumber(double number) async {
    if (state.srcValue == null) {
      _state = state.copyWith(srcValue: number);
    } else if (state.operator == null) {
      _state = state.copyWith(srcValue: state.srcValue! * 10 + number);
    } else if (state.destValue == null) {
      _state = state.copyWith(destValue: number);
    } else {
      _state = state.copyWith(destValue: state.destValue! * 10 + number);
    }

    notifyListeners();
  }

  Future<void> _clickOperator(String operator) async {
    notifyListeners();
  }

  Future<void> _clickString(String string) async {
    switch (string) {
      case 'C':
        _state = state.copyWith(
            srcValue: null, destValue: null, operator: null, result: null);
        break;
      case '<':
        if (state.destValue != null) {
          _state =
              state.copyWith(destValue: (state.destValue! ~/ 10).toDouble());
        } else if (state.srcValue != null && state.operator == null) {
          _state = state.copyWith(srcValue: (state.srcValue! ~/ 10).toDouble());
        }
        break;
      case '+/-':
        break;
    }

    notifyListeners();
  }
}
