import 'package:note_calendar/domain/model/calculator/calculator.dart';

abstract class CalculatorRepo {
  Future<void> saveResult(Calculator calculator);

  Future<void> clearResult();

  Future<List<Calculator>> getResults();
}
