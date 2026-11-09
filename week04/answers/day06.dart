// 4주차 6일 해설 — 조건과 변환을 연결하기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: 거르는 기준 4의 단위는 무엇인가요? 변환을 먼저 하면 기준도 바꿔야 하나요?
// 예상 결과:
// [4000.0, 6000.0]

void main() {
  print(selectedMeters([2.0, 4.0, 6.0]));
}

List<double> selectedMeters(List<double> distances) {
  return distances.where((km) => km >= 4).map((km) => km * 1000).toList();
}
