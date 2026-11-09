// 4주차 3일 해설 — Map은 이름표로 값을 찾기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: List의 [0]과 Map의 ['name']은 어떻게 다른가요?
// 예상 결과:
// 민수
// 3.0
// 5.0

void main() {
  final record = <String, Object>{'name': '민수', 'km': 3.0};
  print(record['name']);
  print(record['km']);
  record['km'] = 5.0;
  print(record['km']);
}
