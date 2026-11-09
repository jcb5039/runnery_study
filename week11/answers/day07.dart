// 11주차 7일 해설 — 복습: 저장하고 다시 읽기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: saveRecord는 r1.json.tmp에 쓴 뒤 이름을 r1.json으로 바꿔요. 그래서 .tmp는 남지 않아요.
//            r1은 읽혀서 Map이 출력되고, r9는 파일이 없어 null이에요.

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
  final text = jsonEncode([3.0, 4.5]);
  print(text);
  print(jsonDecode(text));
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final mode = 'write';
  final distances = [2.0, 4.0];
  await Directory('week11/data').create(recursive: true);
  final file = File('week11/data/day07.json');
  if (mode == 'write') {
    await file.writeAsString(jsonEncode(distances));
    print('저장 완료');
  } else if (mode == 'read') {
    if (await file.exists()) {
      final values = jsonDecode(await file.readAsString()) as List<dynamic>;
      print(values.map((value) => (value as num).toDouble()).toList());
    } else {
      print('저장 파일 없음');
    }
  } else {
    print('모드 오류');
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Future<void> saveRecord(Directory folder, String id, Map<String, Object> json) async {
  final target = File('${folder.path}/$id.json');
  final temporary = File('${target.path}.tmp');
  await temporary.writeAsString(jsonEncode(json));
  await temporary.rename(target.path);
}

Future<Map<String, dynamic>?> loadRecord(Directory folder, String id) async {
  final file = File('${folder.path}/$id.json');
  if (!await file.exists()) return null;
  return jsonDecode(await file.readAsString()) as Map<String, dynamic>;
}

Future<void> step3() async {
  print('--- 3단계 ---');
  final folder = await Directory('week11/data/store').create(recursive: true);
  await saveRecord(folder, 'r1', {'distanceKm': 5.0});
  print(await loadRecord(folder, 'r1'));
  print(await loadRecord(folder, 'r9'));
  print(await File('${folder.path}/r1.json.tmp').exists());
}
