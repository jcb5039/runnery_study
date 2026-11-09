// 11주차 1일 — Map과 JSON 문자열
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day01.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day01.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

import 'dart:convert';

void main() {
  // [짧은 실행 예제]
  final example = {'km': 2, 'seconds': 600};
  final text = jsonEncode(example);
  print(text);

  // [한 줄씩 읽기]
  // 1. import dart:convert가 변환 도구를 가져와요.
  // 2. Map은 코드에서 키로 꺼낼 수 있는 자료예요.
  // 3. jsonEncode는 자료를 저장·전송할 문자열로 바꿔요.
  // [예제 예상 출력]
  // {"km":2,"seconds":600}

  // [직접 풀 문제]
  // main에서 record = {'km': 5, 'seconds': 1800}을 선언하세요.
  // Map의 km를 출력하고 jsonEncode(record)도 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 5
  // {"km":5,"seconds":1800}
  //
  // [값을 바꾸어 다시 실행]
  // km를 3으로 바꾸면 두 출력의 거리만 3으로 바뀌어요.
  //
  // [내 말로 설명]
  // Map과 JSON 문자열은 각각 어떤 조작에 쓰나요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
