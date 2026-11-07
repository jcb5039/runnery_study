// 2주차 6일 해설 — List의 값 하나씩 꺼내기
// 이 파일은 문제의 정답만 출력해요.
// for-in의 distance에는 2, 4, 6, 8이 차례로 들어가요. 함수 매개변수가 아니라 반복문에서 꺼낸 값이에요.

void main() {
  final distances = [2, 4, 6];
  print(distances[0]);
  print(distances.length);
  distances.add(8);
  print(distances);
  for (final distance in distances) {
    print(distance);
  }
}
