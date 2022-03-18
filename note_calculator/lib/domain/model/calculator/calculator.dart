import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator.freezed.dart';

part 'calculator.g.dart';

@freezed
class Calculator with _$Calculator {
  factory Calculator({
    required double srcValue,
    required String operator,
    required double destValue,
    required double result,
  }) = _Calculator;

  factory Calculator.fromJson(Map<String, dynamic> json) =>
      _$CalculatorFromJson(json);
}
