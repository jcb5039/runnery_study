// 1주차 4일 — 값 바꾸기: var, final, const
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week01/day04.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// var는 처음 넣은 값으로 타입을 정하고, 같은 타입의 새 값을 넣을 수 있어요.
// final은 한 번 정한 변수에 새 값을 다시 넣을 수 없어요.
// const는 코드에서 미리 정할 수 있는 상수예요.
// a += b;는 a = a + b;와 같아요.

void main() {
  // [따라 읽는 예제]
  var apples = 1;
  apples += 2;
  print(apples);

  // [직접 풀 문제]
  // var walkedKm = 2;를 직접 작성하세요.
  // final targetKm = 5;와 const unit = 'km';도 작성하세요.
  // walkedKm에 1을 더해 저장한 뒤 세 변수를 사용해서 출력하세요.
  // 예상 문장: '오늘 3km, 목표 5km'
  // walkedKm의 처음 값을 4로 바꿨을 때 결과를 먼저 예상해 보세요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 오늘 3km, 목표 5km

  // TODO: 이 아래에 직접 작성하세요.
  var walkedKm = 2;
  final targetKm = 5;
  const unit = 'km';
  walkedKm += 1;
  print('오늘 ${walkedKm}${unit}, 목표 $targetKm$unit');
}
