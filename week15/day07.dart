// 15주차 7일 — 복습: 오프라인 저장 후 재시도
// 실행 위치: ~/src/runnery-study
// 실행: dart run week15/day07.dart
// 예제부터 실행한 뒤 TODO에 직접 작성하세요. 정답은 answers/day07.dart에 있어요.
// 오늘도 복습 10분 → 예제 20분 → 실습 45분 → 설명과 기록 15분으로 나눠 보세요.

Future<void> main() async {
  // [짧은 실행 예제]
  print('로컬 저장 → 대기 등록 → 전송 시도 → 성공한 작업 제거');

  // [한 줄씩 읽기]
  // 1. 오늘은 같은 프로세스 안에서 실패와 재시도를 연속으로 관찰해요.

  // [직접 풀 문제]
  // main 아래 Future<void> sync(Map<String, int> local, Map<String, int> server, List<String> pending, bool online) async를 정의하세요.
  // offline이면 '오프라인'을 출력하고 return하세요. online이면 List<String>.from(pending) 복사본을 반복하세요.
  // 각 ID의 local 값을 확인하고 서버에 넣은 뒤 원본 pending에서 그 ID를 제거하세요.
  // main에서 local = {'run-1': 5}, 빈 server, pending = ['run-1']을 만드세요.
  // sync(..., false)를 기다린 뒤 pending, sync(..., true)를 기다린 뒤 server와 pending을 출력하세요.
  //
  // [문제 부분의 예상 출력 — 예제 뒤에 이어져요]
  // 오프라인
  // [run-1]
  // {run-1: 5}
  // []
  //
  // [값을 바꾸어 다시 실행]
  // online 재시도를 한 번 더 해도 서버 개수는 1이에요.
  //
  // [내 말로 설명]
  // 반복 중 제거할 때 pending 복사본을 사용하는 이유는 무엇인가요?

  // TODO: 문제의 변수 선언과 함수 호출은 이 아래에 작성하세요.
}

// [직접 만들 함수·클래스 정의 위치]
// TODO: 문제에서 새 함수나 클래스를 요구하면 여기, main의 닫는 중괄호 아래에 정의하세요.
