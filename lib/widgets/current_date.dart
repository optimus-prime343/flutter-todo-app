import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final currentTime = DateTime.now();

class CurrentDate extends StatelessWidget {
  const CurrentDate({Key? key}) : super(key: key);

  String currentWeekDay() => DateFormat('EEEE').format(currentTime);
  String currentDay() => DateFormat('d').format(currentTime);
  String currentMonthAbbr() => DateFormat('MMM').format(currentTime);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: 32.0,
              letterSpacing: 1.2,
            ),
        children: [
          TextSpan(
            text: '${currentWeekDay()}, ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: currentDay()),
          TextSpan(text: currentMonthAbbr()),
        ],
      ),
    );
  }
}
