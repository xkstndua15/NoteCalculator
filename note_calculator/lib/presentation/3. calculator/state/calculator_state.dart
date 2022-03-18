import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_calendar/domain/model/calculator/calculator.dart';

part 'calculator_state.freezed.dart';

@freezed
class CalculatorState with _$CalculatorState {
  factory CalculatorState({
    List<Calculator>? resultList,
    double? srcValue,
    String? operator,
    double? destValue,
    double? result,
  }) = _CalculatorState;
}
