// 11주차 5일 해설 — Future로 기록 목록 읽기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 파일 읽기, JSON 변환, 목록 반환 중 어느 단계에서 await가 필요한가요?
// 예상 결과:
// [2.0, 4.0, 6.0]

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
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
