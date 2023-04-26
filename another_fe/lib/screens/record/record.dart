import 'package:flutter/material.dart';
import '../account/login.dart';

class RecordTab extends StatelessWidget {
  const RecordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Records Tab'),
            ElevatedButton(
              onPressed: () {
                // 로그인 페이지로 이동하는 로직을 작성
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('로그인 페이지'),
            ),
          ],
        ),
      ),
    );
  }
}