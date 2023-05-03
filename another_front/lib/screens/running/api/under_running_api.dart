import 'dart:convert';
import 'package:http/http.dart' as http;

class Kafka {

  static const _baseUrl = "https://k8b308.p.ssafy.io/topics";

  static Future<void> sendTopic({

    required String runningId,
    required String runningTime,
    required double runningDistance,
    required int userCalories,
    required String userPace,
    required double latitude,
    required double longitude
    })
  async {
    var url = Uri.parse('$_baseUrl/$runningId');
    Map<String, dynamic> runData = {
      'runningId': runningId,
      'runningTime': runningTime,
      'runningDistance': runningDistance,
      'userCalories': userCalories,
      'userPace': userPace,
      'latitude': latitude,
      'longitude': longitude
    };

    Map<String, dynamic> forTopic = {
      'value': runData
    };

    Map<String, dynamic> requestBody = {
      'records': [forTopic]
    };
    print(json.encode(requestBody));
    // 요청
    var response = await http.post(
        url,
        headers: {"Content-Type": "application/vnd.kafka.json.v2+json"},
        body: json.encode(requestBody));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('topic 전송 성공');
    } else {
      print('topic 전송 실패');
    }
  }
}