// 1주차 3일 — 계산과 문자열에 값 넣기
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week01/day03.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// +는 더하기, -는 빼기, *는 곱하기, /는 나누기예요.
// 문자열 안의 $변수는 그 변수의 값으로 바뀌어요.
// 변수 바로 뒤에 글자가 붙으면 ${변수}처럼 경계를 표시해요.

void main() {
  // [따라 읽는 예제]
  final price = 1000;
  final amount = 2;
  print('합계: ${price * amount}원');

  // [직접 풀 문제]
  // todayKm에 3, yesterdayKm에 2를 직접 넣으세요.
  // 두 값을 더한 결과를 totalKm이라는 변수에 저장하세요.
  // 계산한 totalKm을 사용해 '이틀 동안 5km'를 출력하세요.
  // 5를 출력 문장에 직접 써넣지 말고 변수를 사용하세요.
  // todayKm을 4로 바꾸면 '이틀 동안 6km'가 되어야 해요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 이틀 동안 5km

  // TODO: 이 아래에 직접 작성하세요.
  var todayKm = 4;
  var yesterdayKm = 2;
  var totalKm = todayKm + yesterdayKm;
  print('이틀 동안 ${totalKm}km');
}
