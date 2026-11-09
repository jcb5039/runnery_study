// 11주차 4일 — 파일 쓰기와 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day04.dart
// 정답은 answers/day04.dart에 있어요.
// 오늘의 강의: week11/README.md의 "3. 파일 쓰기와 읽기 — 4~5일, 7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

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

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 File('week11/data/day04_step1.txt')을 만들고 '안녕 파일'을 쓰세요.
//        다시 읽어 출력하세요. week11/data 폴더는 위 예제가 이미 만들어 뒀어요.
// [예상 출력]
// --- 1단계 ---
// 안녕 파일

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 파일 객체, 쓰기, 읽어서 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 week11/data 폴더를 준비하고 File('week11/data/day04.json')을 만드세요.
//        문자열 '{"km":5}'를 쓰고 다시 읽어 출력하세요. 학습용 파일에만 써요.
// [예상 출력]
// --- 2단계 ---
// {"km":5}
// [값을 바꾸어 다시 실행] 문자열의 5를 3으로 바꿔 다시 실행하면 파일 내용도 바뀌어요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 폴더 준비, 파일 객체, 쓰기, 읽어서 출력을 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 같은 내용이면 다시 쓰지 않기 ━━━━━━━━━━
// Runnery 저장소의 _saveLocal 일부예요(record/data/running_record_store.dart).
//
//   final content = jsonEncode(record.toJson());
//   // 이미 같은 내용이면 다시 쓰지 않아 화면이 불필요하게 새로 그려지지 않게 합니다.
//   if (await target.exists() && await target.readAsString() == content) {
//     return;
//   }
//   ... 파일에 content를 씀 ...
//
// 읽는 법: 파일이 있고(&&) 그 내용이 지금 저장할 글자와 같으면 쓰지 않고 바로 끝내요.
// 바로 아래 [주어진 코드]는 무슨 일을 했는지 글자로 돌려주게 바꾼 거예요.
// [문제]
// (1) step3 안에서 file = File('week11/data/day04_record.json')을 만드세요.
//     매번 처음 상태로 시작하도록 if (await file.exists()) await file.delete(); 를 먼저 쓰세요.
// (2) saveIfChanged(file, '{"km":5}')를 두 번, 그다음 saveIfChanged(file, '{"km":6}')를 한 번 기다려 출력하세요.
// (3) 실행 전에 세 출력을 [내 예측]에 적고 비교하세요.
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 저장함
// 같은 내용이라 건너뜀
// 저장함

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Future<String> saveIfChanged(File target, String content) async {
  if (await target.exists() && await target.readAsString() == content) {
    return '같은 내용이라 건너뜀';
  }
  await target.writeAsString(content);
  return '저장함';
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)~(2)의 코드를 쓰세요.
}

// [내 말로 설명]
// 메모리 변수와 디스크 파일 중 실행 종료 뒤에도 남는 것은 무엇인가요?
