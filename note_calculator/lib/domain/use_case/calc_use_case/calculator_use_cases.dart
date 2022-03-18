import 'package:note_calendar/domain/use_case/calc_use_case/clear_result_use_case.dart';
import 'package:note_calendar/domain/use_case/calc_use_case/get_results_use_case.dart';
import 'package:note_calendar/domain/use_case/calc_use_case/save_result_use_case.dart';

class CalculatorUseCases {
  ClearResultUseCase clearResultUseCase;
  SaveResultUseCase saveResultUseCase;
  GetResultUseCase getResultUseCase;

  CalculatorUseCases({
    required this.clearResultUseCase,
    required this.saveResultUseCase,
    required this.getResultUseCase,
  });
}
