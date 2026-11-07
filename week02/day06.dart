// 2주차 6일 — List의 값 하나씩 꺼내기
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week02/day06.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// List는 여러 값을 순서대로 담아요. 첫 번째 번호는 0이에요.
// .length는 개수, .add(값)는 끝에 값 추가예요.
// for (final 값이름 in 목록)으로 하나씩 꺼낼 수 있어요.
// final로 만든 List도 항목을 추가할 수 있어요. 변수에 다른 List를 다시 대입할 수 없다는 뜻이에요.

void main() {
  // [따라 읽는 예제]
  final fruits = ['사과', '배'];
  print(fruits[0]);
  for (final fruit in fruits) {
    print(fruit);
  }

  // [직접 풀 문제]
  // distances라는 List에 [2, 4, 6]을 넣으세요.
  // 첫 번째 값과 개수를 각각 출력하세요.
  // 8을 추가한 뒤 List 전체를 출력하세요.
  // for-in문으로 각 값을 한 줄씩 출력하세요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 2
  // 3
  // [2, 4, 6, 8]
  // 2
  // 4
  // 6
  // 8

  // TODO: 이 아래에 직접 작성하세요.
  var distance = [2, 4, 6];
  print(distance[0]);
  print(distance.length);
  distance.add(8);
  print(distance);
  for(var i in distance) {
    print(i);
  }
}
