// 11주차 2일 — JSON에서 Map으로 돌아오기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day02.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day02.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

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

  // [직접 풀 문제]
  // main에서 text = '{"km":5,"seconds":1800}'을 선언하세요.
  // jsonDecode 결과를 Map<String, dynamic>으로 다뤄 km를 double, seconds를 int로 꺼내 출력하세요.
  // 이 입력의 구조는 알고 있다고 가정해요. 실패 처리는 6일에 해요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 5.0
  // 1800
  //
  // [값을 바꾸어 다시 실행]
  // JSON의 km를 2.5로 바꾸면 2.5, 1800이에요.
  //
  // [내 말로 설명]
  // as는 잘못된 문자열을 올바른 숫자로 바꾸는 기능인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
