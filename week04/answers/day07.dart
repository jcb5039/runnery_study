// 4주차 7일 해설 — 복습: 기록 목록에서 이름 모으기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: for-in이 꺼내는 것은 이름인가요, Map인가요?
// 예상 결과:
// 민수
// 지우
// [민수, 지우]

void main() {
  final records = <Map<String, String>>[
    {'name': '민수'},
    {'name': '지우'},
  ];
  for (final record in records) {
    print(record['name']);
  }
  print(records.map((record) => record['name']).toList());
}
