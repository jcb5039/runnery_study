// 6주차 6일 — 비동기 함수의 실패도 기다려 처리하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day06.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day06.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  try {
    print(await exampleLoad(false));
  } catch (error) {
    print('불러오기 실패');
  }

  // [한 줄씩 읽기]
  // 1. false가 succeed로 전달돼요.
  // 2. 기다린 뒤 throw가 오류를 발생시켜요.
  // 3. 호출 쪽이 await하고 있으므로 try/catch에서 오류를 받아요.
  // [예제 예상 출력]
  // 불러오기 실패

  // [직접 풀 문제]
  // main 아래에 Future<double> loadDistance(bool succeed) async를 정의하세요.
  // 100밀리초를 기다리고 succeed가 false이면 StateError('불러오기 실패')를 throw하세요. 성공이면 3.0을 반환하세요.
  // main에서 succeed = true를 선언하고 try에서 await loadDistance(succeed)를 출력하세요.
  // catch에서는 '불러오기 실패', finally에서는 '처리 끝'을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 3.0
  // 처리 끝
  //
  // [값을 바꾸어 다시 실행]
  // succeed를 false로 바꾸면 불러오기 실패, 처리 끝이에요.
  //
  // [내 말로 설명]
  // await를 빼면 catch가 기다린 뒤 발생한 오류를 같은 방식으로 받을까요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

Future<double> exampleLoad(bool succeed) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!succeed) throw StateError('실패');
  return 2.0;
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
