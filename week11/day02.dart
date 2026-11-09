// 11주차 2일 — JSON 문자열을 Map으로
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day02.dart
// 정답은 answers/day02.dart에 있어요.
// 오늘의 강의: week11/README.md의 "1. Map과 JSON 문자열 — 1~2일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:convert';

void main() {
  // [짧은 실행 예제]
  final decoded = jsonDecode('{"km":2}');
  final example = decoded as Map<String, dynamic>;
  print((example['km'] as num).toDouble());

  // [한 줄씩 읽기]
  // 1. jsonDecode의 결과는 dynamic이라 구조 확인이 필요해요.
  // 2. as는 기대한 타입으로 다룬다는 표시이며, 실제 타입이 다르면 오류예요.
  // 3. num은 int와 double을 함께 다루고 toDouble로 통일해요.
  // [예제 예상 출력]
  // 2.0

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 jsonDecode('{"name":"민수"}')를 Map<String, dynamic>으로 다뤄 data에 담으세요.
//        data['name']을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 민수

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 data 선언과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 text = '{"km":5,"seconds":1800}'을 선언하세요.
//        jsonDecode 결과를 Map<String, dynamic>으로 다뤄 km를 double, seconds를 int로 꺼내 출력하세요.
//        이 입력의 구조는 알고 있다고 가정해요. 실패 처리는 6일에 해요.
// [예상 출력]
// --- 2단계 ---
// 5.0
// 1800
// [값을 바꾸어 다시 실행] JSON의 km를 2.5로 바꾸면 2.5, 1800이에요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 text 선언, jsonDecode, 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 저장된 숫자와 날짜 되살리기 ━━━━━━━━━━
// RunningRecord.fromJson 안의 두 부분이에요(record/models/running_record.dart).
//
//   double number(dynamic value) {
//     if (value is! num || !value.isFinite || value < 0) {
//       throw const FormatException('Invalid record metric');
//     }
//     return value.toDouble();
//   }
//   ...
//   startedAt: DateTime.parse(json['startedAt'] as String),
//
// 읽는 법: value is! num은 "value가 숫자가 아니면"이에요. 숫자가 아니거나 음수면 실패를 던지고, 아니면 double로 바꿔요.
//   DateTime.parse는 toIso8601String()으로 만든 글자를 다시 DateTime으로 되돌려요.
// 바로 아래 [주어진 코드]는 isFinite 검사만 뺀 number예요.
// [문제]
// (1) step3 안에서 jsonDecode('{"distanceKm":5,"startedAt":"2026-11-09T07:30:00.000"}')를
//     Map<String, dynamic>으로 다뤄 json에 담으세요.
// (2) number(json['distanceKm'])를 출력하세요.
// (3) DateTime.parse(json['startedAt'] as String)을 started에 담고 started.hour를 출력하세요.
// (4) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요. 5가 5.0으로 바뀌는 곳은 어디인가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.0
// 7

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
double number(dynamic value) {
  if (value is! num || value < 0) {
    throw const FormatException('Invalid record metric');
  }
  return value.toDouble();
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)~(3)의 코드를 쓰세요.
}

// [내 말로 설명]
// as는 잘못된 문자열을 올바른 숫자로 바꾸는 기능인가요?
