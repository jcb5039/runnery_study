// 1주차 7일 — 1주차 복습: 오늘의 기록
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week01/day07.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// 새 문법 없이 이번 주에 배운 내용을 연결해요.
// 입력값을 직접 선언하고 계산한 뒤 출력하는 순서로 작성하세요.

void main() {
  // [따라 읽는 예제]
  print('오늘은 앞선 파일을 보지 않고 먼저 풀어보세요.');

  // [직접 풀 문제]
  // name은 '찬범', distanceKm는 4, totalSeconds는 150으로 직접 선언하세요.
  // 이름과 거리를 사용해 '찬범: 4km'를 출력하세요.
  // 시간을 계산해 '2분 30초'를 출력하세요.
  // 거리 5 이상이면 '목표 달성', 아니면 '목표 미달'을 출력하세요.
  // 완성 후 거리를 5로 바꾸고 마지막 문장이 바뀌는 이유를 설명하세요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 찬범: 4km
  // 2분 30초
  // 목표 미달

  // TODO: 이 아래에 직접 작성하세요.
  var name = '찬범';
  var distance = 4;
  var totalSeconds = 150;
  var minutes = totalSeconds ~/ 60;
  var seconds = totalSeconds % 60;
  print('$name: ${distance}km');
  print('${minutes}분 $seconds초');
  if (distance >= 5) {
    print('목표 달성');
  }
  else {
    print('목표 미달');
  }
}
