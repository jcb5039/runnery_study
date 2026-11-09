// 11주차 7일 — 복습: 저장하고 다시 읽기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week11/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week11/README.md의 "1~4번 섹션 전체(파일은 3. 파일 쓰기와 읽기 — 4~5일, 7일)" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  // [짧은 실행 예제]
  print('실습 파일: week11/data/day07.json');

  // [한 줄씩 읽기]
  // 1. 오늘은 write와 read 모드를 나누어 각각 별도로 실행해요.
  // 2. writeAsString은 저장, readAsString은 불러오기예요.
  // [예제 예상 출력]
  // 실습 파일: week11/data/day07.json

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] step1 안에서 jsonEncode([3.0, 4.5])를 text에 담고 출력하세요.
//        그다음 jsonDecode(text)도 출력하세요.
// [예상 출력]
// --- 1단계 ---
// [3.0,4.5]
// [3.0, 4.5]

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 text 선언과 두 줄 출력을 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 mode = 'write', distances = [2.0, 4.0]을 선언하세요.
//        week11/data 폴더와 day07.json 파일 객체를 준비하세요.
//        write이면 JSON을 쓰고 '저장 완료'를 출력하세요.
//        read이면 파일 존재를 확인하고, 있으면 읽어서 double 목록을 출력하고 없으면 '저장 파일 없음'을 출력하세요.
//        그 외 mode는 '모드 오류'를 출력하세요. read에서 파일을 먼저 쓰면 안 돼요.
// [예상 출력]
// --- 2단계 ---
// 저장 완료
// [값을 바꾸어 다시 실행] 저장한 뒤 mode만 'read'로 바꾸어 다시 실행하면 [2.0, 4.0]이에요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 mode, distances 선언과 if / else if / else를 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 임시 파일에 쓰고 이름 바꾸기 ━━━━━━━━━━
// Runnery 저장소의 _saveLocal과 기록 하나 읽기예요(record/data/running_record_store.dart).
//
//   final target = File('${folder.path}/${record.id}.json');
//   final temporary = File('${target.path}.tmp');
//   await temporary.writeAsString(content, flush: true);
//   await temporary.rename(target.path);
//   ...
//   final file = File('${(await _folder()).path}/$id.json');
//   if (!await file.exists()) return null;
//
// 읽는 법: 바로 진짜 파일에 쓰지 않고 .tmp 파일에 다 쓴 다음 이름을 바꿔요(rename).
//   쓰는 도중 앱이 꺼져도 진짜 파일이 반쯤 쓰인 채로 남지 않게 하려는 거예요.
//   읽을 때는 파일이 없으면 null을 돌려줘요.
// 바로 아래 [주어진 코드]는 두 부분을 함수 두 개로 나눈 거예요.
// [문제]
// (1) step3 안에서 final folder = await Directory('week11/data/store').create(recursive: true);를 쓰세요.
// (2) await saveRecord(folder, 'r1', {'distanceKm': 5.0}); 로 저장하세요.
// (3) await loadRecord(folder, 'r1'), await loadRecord(folder, 'r9'),
//     await File('${folder.path}/r1.json.tmp').exists()를 차례로 출력하세요.
// (4) 실행 전에 세 출력을 [내 예측]에 적고 비교하세요. .tmp 파일은 왜 없나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// {distanceKm: 5.0}
// null
// false

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
  // TODO ①: 여기에 문제 (1)~(3)의 코드를 쓰세요.
}

// [내 말로 설명]
// 객체 → Map 또는 List → JSON → 파일, 그리고 역순을 말해보세요.
