// 11주차 5일 — 파일에서 목록 불러오기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week11/README.md의 "3. 파일 쓰기와 읽기 — 4~5일, 7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  // [짧은 실행 예제]
  print(await exampleLoad());

  // [한 줄씩 읽기]
  // 1. Future<List<double>>은 나중에 거리 목록이 준비된다는 뜻이에요.
  // 2. await로 기다린 결과는 List<double>이에요.
  // [예제 예상 출력]
  // [1.0, 3.0]

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

Future<List<double>> exampleLoad() async {
  return [1.0, 3.0];
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 File('week11/data/day05_step1.json')에 '[1,2]'를 쓰세요(폴더는 먼저 준비해요).
//        다시 읽은 글자를 jsonDecode해서 출력하세요.
// [예상 출력]
// --- 1단계 ---
// [1, 2]

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 폴더 준비, 쓰기, 읽기, jsonDecode 결과 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Future<List<double>> loadDistances(File file) async를 정의하세요.
//        파일이 없으면 빈 목록을 반환하세요. 있으면 readAsString → jsonDecode → List의 num을 double로 변환해 반환하세요.
//        step2 안에서 week11/data/day05.json에 [2,4,6] 문자열을 쓰고 loadDistances(file)를 기다려 출력하세요.
// [예상 출력]
// --- 2단계 ---
// [2.0, 4.0, 6.0]
// [값을 바꾸어 다시 실행] 저장 문자열을 '[]'로 바꾸면 []예요. 존재하지 않는 새 파일 경로를 함수에 전달해도 []예요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 폴더 준비, 파일 쓰기, loadDistances 결과 출력을 작성하세요.
}

// TODO ②: 여기에 Future<List<double>> loadDistances(File file) async를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 폴더의 기록 파일만 읽기 ━━━━━━━━━━
// Runnery 저장소의 load예요(record/data/running_record_store.dart). 핵심만 남겼어요.
//
//   await for (final file in folder.list()) {
//     if (file is! File || !file.path.endsWith('.json')) continue;
//     records.add(RunningRecord.fromJson(
//       jsonDecode(await file.readAsString()) as Map<String, dynamic>,
//     ));
//   }
//
// 읽는 법: 폴더 안 파일을 하나씩 보며, 이름이 .json으로 끝나지 않으면 continue로 건너뛰어요.
//   .json 파일만 읽어서 기록으로 되살려 목록에 더해요. await for는 13주차에 배워요.
// 바로 아래 [주어진 코드]는 폴더 대신 파일 목록을 받고, 기록 대신 거리만 모아요.
// sampleFiles는 연습용 파일 세 개(.json 두 개, .txt 한 개)를 만들어 돌려줘요.
// [문제]
// (1) step3 안에서 final files = await sampleFiles();로 파일 목록을 받으세요.
// (2) files.length와 await loadAll(files)를 차례로 출력하세요.
// (3) 실행 전에 두 출력을 [내 예측]에 적고 비교하세요. memo.txt는 어디서 빠지나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 3
// [5.0, 3.2]

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
Future<List<File>> sampleFiles() async {
  await Directory('week11/data/records').create(recursive: true);
  final a = File('week11/data/records/r1.json');
  final b = File('week11/data/records/r2.json');
  final c = File('week11/data/records/memo.txt');
  await a.writeAsString('{"distanceKm":5}');
  await b.writeAsString('{"distanceKm":3.2}');
  await c.writeAsString('메모');
  return [a, b, c];
}

Future<List<double>> loadAll(List<File> files) async {
  final kms = <double>[];
  for (final file in files) {
    if (!file.path.endsWith('.json')) continue;
    final data = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    kms.add((data['distanceKm'] as num).toDouble());
  }
  return kms;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)~(2)의 코드를 쓰세요.
}

// [내 말로 설명]
// 파일 읽기, JSON 변환, 목록 반환 중 어느 단계에서 await가 필요한가요?
