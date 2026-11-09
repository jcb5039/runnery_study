// 4주차 4일 해설 — 함수를 값으로 전달하고 걸러내기
// 문제의 결과만 출력해요. 먼저 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 확인 질문: where 안의 함수는 누가 몇 번 호출하나요?
// 예상 결과:
// [4.0, 6.0]
// [4.0, 6.0]

void main() {
  final distances = [2.0, 4.0, 6.0];
  print(distances.where((km) => km >= 4).toList());
  final selected = <double>[];
  for (final km in distances) {
    if (km >= 4) selected.add(km);
  }
  print(selected);
}
