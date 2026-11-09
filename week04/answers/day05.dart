// 4주차 5일 해설 — map 변환과 fold 누적
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: map과 fold의 결과는 각각 목록인가요, 하나의 값인가요?
// 예상 결과:
// [2000.0, 4000.0, 6000.0]
// 12.0

void main() {
  final distances = [2.0, 4.0, 6.0];
  print(distances.map((km) => km * 1000).toList());
  print(distances.fold<double>(0.0, (sum, km) => sum + km));
}
