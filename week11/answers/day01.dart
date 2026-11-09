// 11주차 1일 해설 — Map과 JSON 문자열
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: Map과 JSON 문자열은 각각 어떤 조작에 쓰나요?
// 예상 결과:
// 5
// {"km":5,"seconds":1800}

import 'dart:convert';

void main() {
  final record = {'km': 5, 'seconds': 1800};
  print(record['km']);
  print(jsonEncode(record));
}
