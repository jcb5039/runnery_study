// 11주차 7일 — 복습: 재실행해도 남는 기록
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day07.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day07.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

// TODO: 문제를 작성할 때 아래 두 import를 주석 해제하세요.
// import 'dart:convert';
// import 'dart:io';

Future<void> main() async {
  // [짧은 실행 예제]
  print('실습 파일: week11/data/day07.json');

  // [한 줄씩 읽기]
  // 1. 오늘은 write와 read 모드를 나누어 각각 별도로 실행해요.
  // 2. writeAsString은 저장, readAsString은 불러오기예요.

  // [직접 풀 문제]
  // main에서 mode = 'write', distances = [2.0, 4.0]을 선언하세요.
  // week11/data 폴더와 day07.json 파일 객체를 준비하세요.
  // write이면 JSON을 쓰고 '저장 완료'를 출력하세요.
  // read이면 파일 존재를 확인하고, 있으면 읽어서 double 목록을 출력하고 없으면 '저장 파일 없음'을 출력하세요.
  // 그 외 mode는 '모드 오류'를 출력하세요. read에서 파일을 먼저 쓰면 안 돼요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 저장 완료
  //
  // [값을 바꾸어 다시 실행]
  // 저장한 뒤 mode만 'read'로 바꾸어 새로 실행하면 [2.0, 4.0]이에요. 변수 distances를 바꾸어도 read의 결과는 저장된 파일 값이에요.
  //
  // [내 말로 설명]
  // 객체 → Map 또는 List → JSON → 파일, 그리고 역순을 말해보세요.

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
