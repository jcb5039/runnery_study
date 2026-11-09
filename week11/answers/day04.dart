// 11주차 4일 해설 — 파일 쓰기와 읽기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 처음엔 파일이 없어서 저장해요. 두 번째는 파일 내용이 같아서 건너뛰어요.
//            세 번째는 내용이 달라서 다시 저장해요.

import 'dart:io';

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final file = File('week11/data/day04_step1.txt');
  await file.writeAsString('안녕 파일');
  print(await file.readAsString());
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  await Directory('week11/data').create(recursive: true);
  final file = File('week11/data/day04.json');
  await file.writeAsString('{"km":5}');
  print(await file.readAsString());
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Future<String> saveIfChanged(File target, String content) async {
  if (await target.exists() && await target.readAsString() == content) {
    return '같은 내용이라 건너뜀';
  }
  await target.writeAsString(content);
  return '저장함';
}

Future<void> step3() async {
  print('--- 3단계 ---');
  final file = File('week11/data/day04_record.json');
  if (await file.exists()) await file.delete();
  print(await saveIfChanged(file, '{"km":5}'));
  print(await saveIfChanged(file, '{"km":5}'));
  print(await saveIfChanged(file, '{"km":6}'));
}
