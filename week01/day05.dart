// 1주차 5일 — 몫과 나머지
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week01/day05.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// ~/는 정수 나눗셈의 몫, %는 나머지를 구해요.
// 예를 들어 8 ~/ 3은 2이고, 8 % 3은 2예요.
// 1분은 60초이므로 초를 60으로 나누어 분과 남은 초를 구할 수 있어요.

void main() {
  // [따라 읽는 예제]
  print(8 ~/ 3);
  print(8 % 3);

  // [직접 풀 문제]
  // totalSeconds에 125를 넣으세요.
  // minutes에 분, seconds에 남은 초를 계산해서 저장하세요.
  // 두 변수를 사용해 '2분 5초'를 출력하세요.
  // 125를 90으로 바꾸면 '1분 30초', 60으로 바꾸면 '1분 0초'가 되어야 해요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 2분 5초

  // TODO: 이 아래에 직접 작성하세요.
  var totalSeconds = 125;
  var minutes = totalSeconds ~/ 60;
  var seconds = totalSeconds % 60;
  print('$minutes분 $seconds초');

}
