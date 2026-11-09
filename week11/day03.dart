// 11주차 3일 — 객체를 저장하고 복원하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day03.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day03.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

import 'dart:convert';

void main() {
  // [짧은 실행 예제]
  final example = ExampleRun(2.0);
  final text = jsonEncode(example.toJson());
  final restored = ExampleRun.fromJson(
    jsonDecode(text) as Map<String, dynamic>,
  );
  print(restored.km);

  // [한 줄씩 읽기]
  // 1. toJson 메서드가 객체의 필드를 Map으로 꺼내요.
  // 2. JSON 문자열로 바꿨다가 다시 Map으로 돌려요.
  // 3. factory 생성자는 Map을 읽어 새 객체를 반환해요.
  // [예제 예상 출력]
  // 2.0

  // [직접 풀 문제]
  // main 아래 PracticeRun 클래스를 만들고 final double km, final int seconds와 위치 매개변수 생성자를 정의하세요.
  // Map<String, Object> toJson()과 factory PracticeRun.fromJson(Map<String, dynamic> data)를 만드세요.
  // main에서 PracticeRun(5.0, 1800)을 JSON 문자열로 바꾼 뒤 복원하고 km, seconds를 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 5.0
  // 1800
  //
  // [값을 바꾸어 다시 실행]
  // 거리 0.0, 시간 0으로 바꿔도 두 값이 유지되어야 해요.
  //
  // [내 말로 설명]
  // 복원한 객체는 원래 객체와 값이 같은 새 객체인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

class ExampleRun {
  final double km;
  ExampleRun(this.km);
  Map<String, Object> toJson() => {'km': km};
  factory ExampleRun.fromJson(Map<String, dynamic> data) {
    return ExampleRun((data['km'] as num).toDouble());
  }
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
