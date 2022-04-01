import 'package:flutter/material.dart';
import 'package:note_calendar/domain/model/calculator/calculator.dart';

Widget drawer(List<Calculator>? resultList) {
  return Drawer(
    child: Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: resultList != null
                ? <Widget>[
                    ...resultList.map(
                      (result) => SizedBox(
                        child: Row(
                          children: [
                            SizedBox(child: Text(result.srcValue.toString())),
                            SizedBox(child: Text(result.operator.toString())),
                            SizedBox(child: Text(result.destValue.toString())),
                            const SizedBox(child: Text('=')),
                            SizedBox(child: Text(result.result.toString()))
                          ],
                        ),
                      ),
                    )
                  ]
                : [],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ],
    ),
  );
}
