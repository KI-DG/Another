import 'package:another/screens/running/running_feed_complete.dart';
import 'package:another/screens/running/under_challenge.dart';
import 'package:another/widgets/target.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../feed/widgets/custom_image.dart';

class UnderChallengeScreenEndFeed extends StatelessWidget {
  const UnderChallengeScreenEndFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        title: Text('로고'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: MAIN_COLOR,
                      side: BorderSide(
                        color: MAIN_COLOR,
                        width: 2.5,
                      )),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CustomImage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera_outlined),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          '사진 추가하기',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  color: WHITE_COLOR,
                ),
              ),
              Target(
                targetname: '내 기록',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: MAIN_COLOR,
                    elevation: 20.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>
                        RunningFeedComplete()
                    ), (route) => route.settings.name == '/');
                  },
                  child: Text(
                    '오운완 등록하기',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}