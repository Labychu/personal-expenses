import 'package:flutter/material.dart';

import '../models/constants.dart' as constants;

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentageTotalSpending;

  ChartBar({
    @required this.label,
    @required this.spendingAmount,
    @required this.percentageTotalSpending,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
					height: 20,
          child: FittedBox(
            child: Text(
              '€${spendingAmount.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: constants.barChartBgColor,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentageTotalSpending,
                child: Container(
                    decoration: BoxDecoration(
                  color: constants.barChartColor,
                  borderRadius: BorderRadius.circular(20),
                )),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}