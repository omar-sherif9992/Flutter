import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double spendingAmount;
  final double percentTotal;
  ChartBar(
      {@required this.day,
      @required this.spendingAmount,
      @required this.percentTotal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(children: [
        FittedBox(
          child: Text(
            '\$' + spendingAmount.toStringAsFixed(0),
          ),
        ),
        SizedBox(height: 3),
        Container(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: percentTotal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
          height: 110,
          width: 14,
        ),
        SizedBox(
          height: 3,
        ),
        Text(day)
      ]),
    );
  }
}
