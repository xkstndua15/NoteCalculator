import 'package:note_calendar/data/data_source/calculator/calculator_data_source.dart';
import 'package:note_calendar/domain/model/calculator/calculator.dart';
import 'package:note_calendar/domain/repo/calculator_repo_sqflite.dart';

class CalculatorRepoImpl extends CalculatorRepo {
  CalculatorDataSource db;

  CalculatorRepoImpl(this.db);

  @override
  Future<void> clearResult() async {
    await db.clearResult();
  }

  @override
  Future<void> saveResult(Calculator calculator) async {
    await db.addResult(calculator);
  }

  @override
  Future<List<Calculator>> getResults() async {
    return await db.getResults();
  }
}
