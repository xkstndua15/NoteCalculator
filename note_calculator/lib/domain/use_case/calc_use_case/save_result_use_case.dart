import 'package:note_calendar/domain/model/calculator/calculator.dart';
import 'package:note_calendar/domain/repo/calculator_repo_sqflite.dart';

class SaveResultUseCase {
  CalculatorRepo calcRepo;

  SaveResultUseCase(this.calcRepo);

  Future<void> call(Calculator calc) async {
    calcRepo.saveResult(calc);
  }
}
