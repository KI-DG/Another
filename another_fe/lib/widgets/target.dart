import 'package:another/widgets/target_box.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';

class Target extends StatelessWidget {
  final String targetRecord;

  const Target({
    required this.targetRecord,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '${targetRecord}',
            style: TextStyle(
              color: WHITE_COLOR,
              fontSize: 20.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: BLACK_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            minHeight: 80.0,
            minWidth: 320.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TargetBox(
                name: 'km',
                textColor: MAIN_COLOR,
                recordColor: SERVEONE_COLOR,
              ),
              TargetBox(
                name: '시간',
                textColor: MAIN_COLOR,
                recordColor: SERVEONE_COLOR,
              ),
              TargetBox(
                name: 'kacl',
                textColor: MAIN_COLOR,
                recordColor: SERVEONE_COLOR,
              ),
              TargetBox(
                name: '평균 페이스',
                textColor: MAIN_COLOR,
                recordColor: SERVEONE_COLOR      ,
              ),
            ],
          ),
        )
      ],
    );
  }
}