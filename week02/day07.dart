// 2주차 7일 — 2주차 복습: 거리 합계와 목표
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week02/day07.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// 목록의 값을 하나씩 꺼내 합계에 더하고, 마지막에 조건을 확인해요.
// 오늘은 아래 문제를 읽고 직접 시작해 보세요.

void main() {
  // [따라 읽는 예제]
  print('변수 → 반복 → 합계 → 조건 순서로 생각해 보세요.');

  // [직접 풀 문제]
  // distances에 [2, 3, 4], targetKm에 10을 직접 넣으세요.
  // total을 0으로 만들고 for-in문으로 거리 합계를 구하세요.
  // 반복이 끝나면 '총 9km'를 출력하세요.
  // 합계가 targetKm 이상이면 '목표 달성', 아니면 '목표 미달'을 출력하세요.
  // 목록을 [2, 3, 5]로 바꾸면 총 10km와 목표 달성이 나와야 해요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 총 9km
  // 목표 미달

  // TODO: 이 아래에 직접 작성하세요.
  var distance = [2, 3, 4];
  var targetKm = 10;
  var total = 0;
  for (var i in distance) {
    total += i; 
  }
  print('총 ${total}km');
  if(total >= targetKm) {
    print('목표 달성');
  }
  else {
    print('목표 미달');
  }
}
