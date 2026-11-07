// 2주차 3일 — 반복하면서 합계 쌓기
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week02/day03.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// 반복 바깥의 변수에는 여러 번 계산한 결과를 쌓을 수 있어요.
// total을 반복문 안에서 매번 0으로 만들면 이전 합계가 사라져요.

void main() {
  // [따라 읽는 예제]
  var collected = 0;
  for (var i = 1; i <= 3; i++) {
    collected += 2;
  }
  print(collected);

  // [직접 풀 문제]
  // final n = 5;와 var total = 0;을 직접 작성하세요.
  // for문으로 1부터 n까지 반복하며 현재 숫자를 total에 더하세요.
  // 반복문이 끝난 뒤 total을 한 번 출력하세요.
  // n을 3으로 바꾸면 6, 10으로 바꾸면 55가 되어야 해요.
  // n은 이 파일에서 직접 정하는 값이에요. 함수 입력은 아직 사용하지 않아요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 15

  // TODO: 이 아래에 직접 작성하세요.
  final n = 5;
  var total = 0;
  for(var i = 1; i <= n; i++) {
    total = total + i;
  }
  print(total);
}
