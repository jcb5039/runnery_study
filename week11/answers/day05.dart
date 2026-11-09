// 11주차 5일 해설 — 파일에서 목록 불러오기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 파일은 세 개지만 memo.txt는 이름이 .json으로 끝나지 않아 continue로 건너뛰어요.
//            r1의 5는 5.0으로, r2의 3.2는 그대로 모여요.

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  await Directory('week11/data').create(recursive: true);
  final file = File('week11/data/day05_step1.json');
  await file.writeAsString('[1,2]');
  print(jsonDecode(await file.readAsString()));
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  await Directory('week11/data').create(recursive: true);
  final file = File('week11/data/day05.json');
  await file.writeAsString('[2,4,6]');
  print(await loadDistances(file));
}

Future<List<double>> loadDistances(File file) async {
  if (!await file.exists()) return [];
  final text = await file.readAsString();
  final values = jsonDecode(text) as List<dynamic>;
  return values.map((value) => (value as num).toDouble()).toList();
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
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
  final files = await sampleFiles();
  print(files.length);
  print(await loadAll(files));
}
