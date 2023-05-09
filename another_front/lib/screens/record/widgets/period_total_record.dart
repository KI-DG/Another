import 'package:flutter/material.dart';
import 'package:another/constant/color.dart';

class PeriodTotalRecord extends StatelessWidget {
  const PeriodTotalRecord(
      {Key? key,
      required this.selectedIndex,
      this.selectedDay,
      required this.recordData})
      : super(key: key);

  final int selectedIndex;
  final selectedDay;
  final Map<String, dynamic> recordData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: CONTOUR_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            minHeight: 150.0,
            minWidth: 320.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 12, bottom: 4),
                child: Text(
                  recordData['Date'] ?? '-',
                  style: TextStyle(color: SERVETWO_COLOR),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigTargetBox(
                      data: (recordData['runningDistance'] * 1000).round() / 1000 ?? '-',
                      unit: 'km',
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SmallTargetBox(
                          data: recordData['runningTime'] ?? '-',
                          unit: '시간',
                        ),
                        SizedBox(width: 40),
                        SmallTargetBox(
                          data: (recordData['userCalories'] * 1000).round() / 1000 ?? '-',
                          unit: 'kcal',
                        ),
                        SizedBox(width: 40),
                        SmallTargetBox(
                          data: (recordData['runningDistance'] * 1000).round() / 1000 ?? '-',
                          unit: '페이스',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BigTargetBox extends StatelessWidget {
  final dynamic data;
  final String unit;
  const BigTargetBox({Key? key, required this.data, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$data',
          style: TextStyle(
              color: MAIN_COLOR, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Text('$unit', style: TextStyle(color: SERVEONE_COLOR, fontSize: 16))
      ],
    );
  }
}

class SmallTargetBox extends StatelessWidget {
  final dynamic data;
  final String unit;
  const SmallTargetBox({Key? key, required this.data, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$data',
          style: TextStyle(
              color: WHITE_COLOR, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('$unit', style: TextStyle(color: SERVEONE_COLOR, fontSize: 16))
      ],
    );
  }
}
