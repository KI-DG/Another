import 'package:another/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../account/login.dart';
import '../account/signup_userinfo.dart';
import '../record/challenge.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'widgets/category_title.dart';

class RecordTab extends StatelessWidget {
  const RecordTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 뒤로가기
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // 로그인 페이지로 이동하는 로직을 작성
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 페이지로 이동하는 로직을 작성
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupUserInfoPage()),
                );
              },
              child: Text('키 몸무게'),
            ),
            ElevatedButton(
              onPressed: () {
                // 로그인 페이지로 이동하는 로직을 작성
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChallengePage()),
                );
              },
              child: Text('챌린지'),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/img/logo_small.png'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('안녕하세요 왕현석님!\n오늘도 함께 달려볼까요?',
                      style: TextStyle(color: Colors.white)),
                  Column(
                    children: [
                      Text('Lv.1', style: TextStyle(color: Colors.white)),
                      CircularPercentIndicator(
                        radius: 40.0,
                        lineWidth: 10.0,
                        percent: 0.6,
                        header: Text("Icon header"),
                        center: CircleAvatar(
                          backgroundImage: AssetImage('assets/img/kazuha.jpg'),
                          radius: 35,
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    ],
                  )
                ],
              ),
              Row(children: [
                CategoryTitle(title: 'MY 챌린지'),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                  color: Colors.white,
                  iconSize: 14,
                )
              ]),
              MyChallenge(), // 나의 챌린지
              CategoryTitle(title: '나의 활동 기록'),
              MyRecord(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyChallenge extends StatelessWidget {
  const MyChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Image.asset('assets/img/10min_gold.png', height: 64, width: 64),
              SizedBox(width: 5),
              Image.asset('assets/img/10min_gold.png', height: 64, width: 64),
              SizedBox(width: 5),
              Image.asset('assets/img/10min_gold.png', height: 64, width: 64),
              SizedBox(width: 5),
              Image.asset('assets/img/10min_gold.png', height: 64, width: 64),
              SizedBox(width: 5),
              Image.asset('assets/img/10min_gold.png', height: 64, width: 64),
              SizedBox(width: 5),
              Image.asset('assets/img/10min_gold.png', height: 64, width: 64),
            ])));
  }
}

class MyRecord extends StatefulWidget {
  const MyRecord({Key? key}) : super(key: key);

  @override
  State<MyRecord> createState() => _MyRecordState();
}

class _MyRecordState extends State<MyRecord> {
  int _selectedIndex = 0;
  bool _isCalendarOpen = false;

  void _updateContent(int index, bool isCalendarOpen) {
    setState(() {
      _selectedIndex = index;
      _isCalendarOpen = isCalendarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                side: BorderSide(
                    color: _selectedIndex == 0 ? MAIN_COLOR : SERVEONE_COLOR,
                    width: 2),
              ),
              onPressed: () => _updateContent(0, false),
              child: Text('오늘',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 0 ? MAIN_COLOR : SERVEONE_COLOR,
                  )),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                side: BorderSide(
                    color: _selectedIndex == 1 ? MAIN_COLOR : SERVEONE_COLOR,
                    width: 2),
              ),
              onPressed: () => _updateContent(1, false),
              child: Text('이번 주',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 1 ? MAIN_COLOR : SERVEONE_COLOR,
                  )),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                side: BorderSide(
                    color: _selectedIndex == 2 ? MAIN_COLOR : SERVEONE_COLOR,
                    width: 2),
              ),
              onPressed: () => _updateContent(2, false),
              child: Text('이번 달',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 2 ? MAIN_COLOR : SERVEONE_COLOR,
                  )),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                side: BorderSide(
                    color: _selectedIndex == 3 ? MAIN_COLOR : SERVEONE_COLOR,
                    width: 2),
              ),
              onPressed: () => _updateContent(3, false),
              child: Text('전체',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 3 ? MAIN_COLOR : SERVEONE_COLOR,
                  )),
            ),
            OutlinedButton(
                onPressed: () {
                  if (_selectedIndex != 4) {
                    return _updateContent(4, true);
                  } else if (_selectedIndex == 4 && _isCalendarOpen == true) {
                    return _updateContent(4, false);
                  } else if (_selectedIndex == 4 && _isCalendarOpen == false) {
                    return _updateContent(4, true);
                  }
                },
                child: Icon(
                  Icons.calendar_today,
                  color: _isCalendarOpen == true ? MAIN_COLOR : SERVEONE_COLOR,
                )),
          ],
        ),
        MyRecordContents(
            selectedIndex: _selectedIndex, isCalendarOpen: _isCalendarOpen)
      ],
    );
  }
}

class MyRecordContents extends StatefulWidget {
  final int selectedIndex;
  final bool isCalendarOpen;

  const MyRecordContents(
      {Key? key, required this.selectedIndex, required this.isCalendarOpen})
      : super(key: key);

  @override
  State<MyRecordContents> createState() => _MyRecordContentsState();
}

class _MyRecordContentsState extends State<MyRecordContents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.isCalendarOpen == true
            ? TableCalendarScreen()
            : Text('달력 없음', style: TextStyle(color: Colors.white)),

// 나중에 Pageview 써봐라
        widget.selectedIndex == 0
            ? Text('인덱스 0임', style: TextStyle(color: Colors.white))
            : widget.selectedIndex == 1
                ? Text('인덱스 1임', style: TextStyle(color: Colors.white))
                : widget.selectedIndex == 2
                    ? Text('인덱스 2임', style: TextStyle(color: Colors.white))
                    : widget.selectedIndex == 3
                        ? Text('인덱스 3임', style: TextStyle(color: Colors.white))
                        : widget.selectedIndex == 4
                            ? Text('인덱스 4임',
                                style: TextStyle(color: Colors.white))
                            : Text('잘못된 인덱스')
      ],
    );
  }
}

class TableCalendarScreen extends StatefulWidget {
  const TableCalendarScreen({Key? key}) : super(key: key);
  @override
  State<TableCalendarScreen> createState() => _TableCalendarScreenState();
}

class _TableCalendarScreenState extends State<TableCalendarScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        locale: 'ko_KR',
        firstDay: DateTime.utc(2021),
        lastDay: DateTime.utc(2025),
        focusedDay: focusedDay,
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextFormatter: (date, locale) =>
              DateFormat.yMMMM(locale).format(date),
          formatButtonVisible: false,
          titleTextStyle: TextStyle(fontSize: 16, color: Colors.white),
          headerPadding: EdgeInsets.symmetric(vertical: 4.0),
          leftChevronIcon:
              Icon(Icons.arrow_left, size: 32, color: Colors.white),
          rightChevronIcon:
              Icon(Icons.arrow_right, size: 32, color: Colors.white),
        ),
        calendarStyle: CalendarStyle(
            canMarkersOverflow: false, // marker 여러개 일 때 cell 영역을 벗어날지 여부
            markerSize: 10, // 마커 크기 조절
            markerSizeScale: 10, // 마커 크기 비율 조절
            markerMargin: EdgeInsets.symmetric(horizontal: 0.3), // 마커 margin 조절
            markerDecoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            defaultTextStyle: TextStyle(
              color: Colors.white,
            ),
            // today 글자 스타일
            todayTextStyle: TextStyle(
              color: MAIN_COLOR,
            ),
            // today 모양 스타일
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: MAIN_COLOR,
              ),
            ),
            // selectedDay 모양 조정
            selectedDecoration: BoxDecoration(
              color: MAIN_COLOR,
              shape: BoxShape.circle,
            ),
            // disabledDay 글자 조정
            disabledTextStyle:
                TextStyle(color: SERVEONE_COLOR.withOpacity(0.2)),
            weekendTextStyle: TextStyle(color: Colors.white)),
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          // 선택된 날짜의 상태를 갱신
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
            print('selectedDay는 $selectedDay');
            print('focusedDay $focusedDay');
          });

          // 현재 선택된 달력의 월과 다른 경우, 해당 달력으로 이동
          if (selectedDay.month != focusedDay.month) {
            setState(() {
              focusedDay = DateTime(selectedDay.year, selectedDay.month, 1);
            });
          }
        },
        selectedDayPredicate: (DateTime day) {
          // selectedDay 와 동일한 날짜의 모양을 바꿔줌
          return isSameDay(selectedDay, day);
        });
  }
}
