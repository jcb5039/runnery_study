// 11주차 4일 — 실습 파일 쓰기와 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day04.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day04.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

import 'dart:io';

Future<void> main() async {
  // [짧은 실행 예제]
  final exampleDir = Directory('week11/data');
  await exampleDir.create(recursive: true);
  final exampleFile = File('week11/data/example.txt');
  await exampleFile.writeAsString('연습');
  print(await exampleFile.readAsString());

  // [한 줄씩 읽기]
  // 1. 경로는 터미널의 현재 폴더 기준이에요. 안내한 학습 폴더에서 실행하세요.
  // 2. create가 실습 데이터 폴더를 준비해요.
  // 3. writeAsString은 같은 경로의 기존 내용을 덮어써요.
  // 4. await로 쓰기가 끝난 뒤 읽어요. 브라우저에서는 dart:io 파일 접근을 쓸 수 없어요.
  // [예제 예상 출력]
  // 연습

  // [직접 풀 문제]
  // main의 TODO에서 week11/data 폴더를 준비하고 File('week11/data/day04.json')을 만드세요.
  // 문자열 '{"km":5}'를 쓰고 다시 읽어 출력하세요. 학습용 파일에만 써요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // {"km":5}
  //
  // [값을 바꾸어 다시 실행]
  // 문자열의 5를 3으로 바꿔 다시 실행하면 파일 내용도 바뀌어요.
  //
  // [내 말로 설명]
  // 메모리 변수와 디스크 파일 중 실행 종료 뒤에도 남는 것은 무엇인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
