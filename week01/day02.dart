// 1주차 2일 — 변수와 타입
// 실행 위치: ~/src/runnery-study
// 실행 명령: dart run week01/day02.dart
// 저장한 뒤 실행하세요. 이 파일의 main 하나만 실행돼요.
// 아래 예제는 먼저 실행해 보고, 실습은 작성 위치에 직접 풀어요.
// 정답은 answers 폴더에 따로 있어요.

// 변수는 값에 붙인 이름이에요. 타입 변수이름 = 값; 모양으로 만들어요.
// String은 글자, int는 정수, double은 소수, bool은 true 또는 false예요.
// String만 대문자로 시작해요. print(변수이름)으로 저장된 값을 봐요.

void main() {
  // [따라 읽는 예제]
  String fruit = '사과';
  int fruitCount = 2;
  print(fruit);
  print(fruitCount);

  // [직접 풀 문제]
  // name에 '찬범', age에 25, distance에 3.5, isRunning에 true를 저장하세요.
  // 각각 String, int, double, bool 타입으로 직접 선언하세요.
  // 각 변수의 값을 위 순서대로 한 줄씩 출력하세요.
  // 끝나면 이름과 나이를 원하는 값으로 바꿔서 다시 실행하세요.

  // [문제 부분의 예상 출력 — 예제 출력 다음에 이어져요]
  // 찬범
  // 25
  // 3.5
  // true

  // TODO: 이 아래에 직접 작성하세요.
  String name = '찬범';
  int age = 25;
  double distance = 3.5;
  bool isRunning = true;

  print(name);
  print(age);
  print(distance);
  print(isRunning);
}
