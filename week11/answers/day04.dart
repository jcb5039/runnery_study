// 11주차 4일 해설 — 실습 파일 쓰기와 읽기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 메모리 변수와 디스크 파일 중 실행 종료 뒤에도 남는 것은 무엇인가요?
// 예상 결과:
// {"km":5}

import 'dart:io';

Future<void> main() async {
  await Directory('week11/data').create(recursive: true);
  final file = File('week11/data/day04.json');
  await file.writeAsString('{"km":5}');
  print(await file.readAsString());
}
