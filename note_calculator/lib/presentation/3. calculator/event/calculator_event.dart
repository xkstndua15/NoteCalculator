import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_event.freezed.dart';

@freezed
abstract class CalculatorEvent with _$CalculatorEvent {
  const factory CalculatorEvent.clickNumber(double number) = ClickNumber;

  const factory CalculatorEvent.clickOperator(String operator) = ClickOperator;

  const factory CalculatorEvent.clickString(String string) = ClickString;

  const factory CalculatorEvent.calculation(
      double src, double dest, String operator) = Calculation;

  const factory CalculatorEvent.clearResult() = ClearResult;

  const factory CalculatorEvent.getResultList() = GetResultList;
}
