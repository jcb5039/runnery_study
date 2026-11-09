// 11주차 7일 해설 — 복습: 재실행해도 남는 기록
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 객체 → Map 또는 List → JSON → 파일, 그리고 역순을 말해보세요.
// 예상 결과:
// 저장 완료

import 'dart:convert';
import 'dart:io';

Future<void> main() async {
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
