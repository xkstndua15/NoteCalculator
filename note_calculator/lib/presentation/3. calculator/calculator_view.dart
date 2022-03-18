import 'package:flutter/material.dart';
import 'package:note_calendar/presentation/3.%20calculator/calculator_view_model.dart';
import 'package:note_calendar/presentation/3.%20calculator/component/calculator_keypad.dart';
import 'package:note_calendar/presentation/3.%20calculator/event/calculator_event.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('계산기'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.history,
              ),
            ),
          ],
        ),
        body: Column(children: [
          SizedBox(
            height: 150,
            child: Text(viewModel.state.srcValue == null
                ? '0'
                : viewModel.state.srcValue.toString()),
          ),
          CalculatorKeypad(
            onPressedNumber: (number) {
              print(number.runtimeType);
              viewModel.onEvent(ClickNumber(number.toDouble()));
            },
            onPressedOperator: (operator) {
              print(operator);
            },
            onPressedString: (string) {
              print(string);
              viewModel.onEvent(ClickString(string));
            },
          ),
        ]));
  }
}
