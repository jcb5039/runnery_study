// 2주차 7일 해설 — 2주차 복습: 거리 합계와 목표
// 이 파일은 문제의 정답만 출력해요.
// 거리의 개수가 바뀌어도 for-in이 각 값을 꺼내요. 합계가 완성된 다음에 목표와 비교해요.

void main() {
  final distances = [2, 3, 4];
  final targetKm = 10;
  var total = 0;
  for (final distance in distances) {
    total += distance;
  }
  print('총 ${total}km');
  if (total >= targetKm) {
    print('목표 달성');
  } else {
    print('목표 미달');
  }
}
