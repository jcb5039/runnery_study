// 11주차 2일 해설 — JSON에서 Map으로 돌아오기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: as는 잘못된 문자열을 올바른 숫자로 바꾸는 기능인가요?
// 예상 결과:
// 5.0
// 1800

import 'dart:convert';

void main() {
  final text = '{"km":5,"seconds":1800}';
  final data = jsonDecode(text) as Map<String, dynamic>;
  print((data['km'] as num).toDouble());
  print(data['seconds'] as int);
}
