// 10주차 1일 해설 — DateTime으로 날짜 표현하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: DateTime 객체와 출력용 문자열은 무엇이 다른가요?
// 예상 결과:
// 2026년 12월 3일

void main() {
  final date = DateTime(2026, 12, 3);
  print('${date.year}년 ${date.month}월 ${date.day}일');
}
