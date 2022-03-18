import 'package:note_calendar/domain/model/calculator/calculator.dart';
import 'package:note_calendar/domain/repo/calculator_repo_sqflite.dart';

class GetResultUseCase {
  CalculatorRepo calcRepo;

  GetResultUseCase(this.calcRepo);

  Future<List<Calculator>> call() async {
    return await calcRepo.getResults();
  }
}
