// 11주차 5일 — Future로 기록 목록 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day05.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day05.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

// TODO: 문제를 작성할 때 아래 두 import를 주석 해제하세요.
// import 'dart:convert';
// import 'dart:io';

Future<void> main() async {
  // [짧은 실행 예제]
  print(await exampleLoad());

  // [한 줄씩 읽기]
  // 1. Future<List<double>>은 나중에 거리 목록이 준비된다는 뜻이에요.
  // 2. await로 기다린 결과는 List<double>이에요.
  // [예제 예상 출력]
  // [1.0, 3.0]

  // [직접 풀 문제]
  // main 아래 Future<List<double>> loadDistances(File file) async를 정의하세요.
  // 파일이 없으면 빈 목록을 반환하세요. 있으면 readAsString → jsonDecode → List의 num을 double로 변환해 반환하세요.
  // main에서 week11/data/day05.json에 [2,4,6] 문자열을 쓰고 loadDistances(file)를 기다려 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // [2.0, 4.0, 6.0]
  //
  // [값을 바꾸어 다시 실행]
  // 저장 문자열을 '[]'로 바꾸면 []예요. 존재하지 않는 새 파일 경로를 함수에 전달해도 []예요.
  //
  // [내 말로 설명]
  // 파일 읽기, JSON 변환, 목록 반환 중 어느 단계에서 await가 필요한가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

Future<List<double>> exampleLoad() async {
  return [1.0, 3.0];
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
