// 11주차 2일 해설 — JSON 문자열을 Map으로
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: JSON의 5는 정수로 돌아와요. number 안의 value.toDouble()이 5.0으로 바꿔요.
//            DateTime.parse가 글자를 날짜 객체로 되돌려서 hour로 7시를 읽을 수 있어요.

import 'dart:convert';

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final data = jsonDecode('{"name":"민수"}') as Map<String, dynamic>;
  print(data['name']);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final text = '{"km":5,"seconds":1800}';
  final data = jsonDecode(text) as Map<String, dynamic>;
  print((data['km'] as num).toDouble());
  print(data['seconds'] as int);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
double number(dynamic value) {
  if (value is! num || value < 0) {
    throw const FormatException('Invalid record metric');
  }
  return value.toDouble();
}

void step3() {
  print('--- 3단계 ---');
  final json = jsonDecode('{"distanceKm":5,"startedAt":"2026-11-09T07:30:00.000"}') as Map<String, dynamic>;
  print(number(json['distanceKm']));
  final started = DateTime.parse(json['startedAt'] as String);
  print(started.hour);
}
