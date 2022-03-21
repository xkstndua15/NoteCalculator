import 'package:flutter/material.dart';
import 'package:note_calendar/presentation/3.%20calculator/calculator_view_model.dart';
import 'package:note_calendar/presentation/3.%20calculator/component/calculator_keypad.dart';
import 'package:note_calendar/presentation/3.%20calculator/event/calculator_event.dart';
import 'package:provider/provider.dart';

import 'component/result_list.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('계산기'),
        actions: [
          IconButton(
            onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
            icon: const Icon(
              Icons.history,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      viewModel.returnSrc(),
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      viewModel.state.operator == null
                          ? ''
                          : viewModel.state.operator!,
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      viewModel.returnDest(),
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
                Text(
                  viewModel.returnResult().length > 22
                      ? 'error'
                      : viewModel.returnResult(),
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CalculatorKeypad(
              onPressedNumber: (number) {
                viewModel.onEvent(ClickNumber(number.toDouble()));
              },
              onPressedOperator: (operator) {
                viewModel.onEvent(ClickOperator(operator));
              },
              onPressedString: (string) {
                viewModel.onEvent(ClickString(string));
              },
            ),
          ),
        ],
      ),
      endDrawer: drawer(context),
    );
  }
}
