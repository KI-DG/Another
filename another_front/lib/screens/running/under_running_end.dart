import 'dart:typed_data';

import 'package:another/constant/color.dart';
import 'package:another/constant/main_layout.dart';
import 'package:another/screens/running/under_challenge_end_feed.dart';
import 'package:another/screens/running/widgets/running_end.dart';
import 'package:another/widgets/target.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import './api/under_running_end_api.dart';

class UnderRunningScreenEnd extends StatelessWidget {
  final String runningDistance;
  final String runningTime;
  final String userCalorie;
  final String userPace;
  UnderRunningScreenEnd({
    required this.runningDistance,
    required this.runningTime,
    required this.userCalorie,
    required this.userPace,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("빌드빌드end빌드예예");
    final Size size = MediaQuery.of(context).size;
    return MainLayout(
      body: Column(
        children: [
          Target(
            targetname: '내 기록',
            runningDistance: runningDistance,
            runningTime: runningTime,
            userCalorie: userCalorie,
            userPace: userPace,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: SizedBox(
              height: size.width,
              width: size.width,
              child: EndRunningMap(),
            )
          ),
          SizedBox(
            height: 120,
          ),
          ButtonConponent(
            onPressed: () => endFeed(context),
          ),
        ],
      ),
    );
  }

  void endFeed(BuildContext context) {
    var runningData = Provider.of<RunningData>(context, listen: false);
    var userId = Provider.of<UserInfo>(context, listen: false).userId;
    // api 요청
    // // mySQL 저장
    saveRunningTime.saveRunData(userId: userId, runningId: runningData.runningId, runningTime: runningData.runningTime, runningDistance: runningData.runningDistance, userCalories: runningData.userCalories, userPace: runningData.userPace, runningPic: runningData.runningPic);
    // // hdfs 저장
    saveRunningTime.sendTopic(runningId: runningData.runningId, userId: userId);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => UnderChallengeScreenEndFeed(
          ),
        ),
        (route) => route.settings.name == '/');
  }
}

class ButtonConponent extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonConponent({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height * 0.08,
            width: size.width * 0.4,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                primary: SERVETWO_COLOR,
                elevation: 10.0,
              ),
              child: Text(
                '다음에 할래요!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.08,
            width: size.width * 0.4,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: MAIN_COLOR,
                elevation: 10.0,
              ),
              child: Text(
                '오운완 등록하기',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
