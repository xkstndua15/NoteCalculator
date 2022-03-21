import 'package:flutter/material.dart';

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({
    Key? key,
    this.onPressedNumber,
    this.onPressedOperator,
    this.onPressedString,
  }) : super(key: key);
  final Function? onPressedNumber;
  final Function? onPressedOperator;
  final Function? onPressedString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                onPressedString?.call('C');
              },
              child: const Text('C'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedString?.call('<');
              },
              child: const Icon(Icons.arrow_back),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedOperator?.call('%');
              },
              child: const Text('%'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedOperator?.call('÷');
              },
              child: const Text('÷'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(7);
              },
              child: const Text('7'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(8);
              },
              child: const Text('8'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(9);
              },
              child: const Text('9'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedOperator?.call('x');
              },
              child: const Text('x'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(4);
              },
              child: const Text('4'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(5);
              },
              child: const Text('5'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(6);
              },
              child: const Text('6'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedOperator?.call('-');
              },
              child: const Text('-'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(1);
              },
              child: const Text('1'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(2);
              },
              child: const Text('2'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(3);
              },
              child: const Text('3'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedOperator?.call('+');
              },
              child: const Text('+'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                onPressedString?.call('+/-');
              },
              child: const Text('+/-'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedNumber?.call(0);
              },
              child: const Text('0'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('.'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressedOperator?.call('=');
              },
              child: const Text('='),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ],
    );
  }
}
