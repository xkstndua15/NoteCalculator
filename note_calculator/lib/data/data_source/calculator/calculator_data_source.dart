import 'package:note_calendar/domain/model/calculator/calculator.dart';
import 'package:sqflite/sqflite.dart';

class CalculatorDataSource {
  Database db;

  CalculatorDataSource(this.db);

  Future<void> addResult(Calculator calculator) async {
    await db.insert('calculator', calculator.toJson());
  }

  Future<void> clearResult() async {
    await db.delete('calculator');
  }

  Future<List<Calculator>> getResults() async {
    final maps = await db.query('calculator');

    return maps.map((e) => Calculator.fromJson((e))).toList();
  }
}
