import 'package:note_calendar/domain/repo/calculator_repo_sqflite.dart';

class ClearResultUseCase {
  CalculatorRepo calcRepo;

  ClearResultUseCase(this.calcRepo);

  Future<void> call() async {
    await calcRepo.clearResult();
  }
}
