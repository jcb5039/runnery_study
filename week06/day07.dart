// 6주차 7일 — 복습: 기다림과 없는 값
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week06/README.md의 "1~4번 섹션 전체" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  print('기다리기 전과 후의 실행 순서를 설명해 보세요.');

  // [한 줄씩 읽기]
  // 1. 오늘은 main의 실행 순서와 함수 반환값을 직접 연결해요.
  // [예제 예상 출력]
  // 기다리기 전과 후의 실행 순서를 설명해 보세요.

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] Future<int> countRuns() async를 정의하세요. 100밀리초를 기다린 뒤 4를 반환해요.
//        step1 안에서 '세는 중'을 출력하고, await countRuns()를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 세는 중
// 4

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기서 '세는 중'과 await countRuns()를 출력하세요.
}

// TODO ②: 여기에 Future<int> countRuns() async를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Future<double> loadDistance() async를 정의하고 100밀리초 뒤 3.0을 반환하세요.
//        step2 안에서 String? memo = null;을 선언하세요. '시작'을 출력한 뒤 거리를 기다려 출력하고,
//        memo ?? '메모 없음', '끝'을 차례로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 시작
// 3.0
// 메모 없음
// 끝
// [값을 바꾸어 다시 실행] memo를 '저녁'으로 바꾸면 세 번째 줄이 저녁이에요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 memo 선언과 네 줄 출력을 작성하세요.
}

// TODO ②: 여기에 Future<double> loadDistance() async를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — ??와 await를 한 줄에 ━━━━━━━━━━
// 홈 화면 _reload의 진짜 첫 줄이에요(home/home_page.dart).
//
//   final loaded = widget.records ?? await _store.load();
//
// 읽는 법: 미리 받은 기록(widget.records)이 있으면 그걸 쓰고, 없으면(null) 저장소에서 기다려 읽어요.
//   ?? 오른쪽은 왼쪽이 null일 때만 실행돼요. 그래서 미리 받은 기록이 있으면 저장소를 읽지 않아요.
// 바로 아래 [주어진 코드]의 preset이 widget.records, loadSaved가 _store.load 역할이에요.
// [문제]
// (1) step3 안에서 아래 순서로 쓰세요.
//       final first = preset ?? await loadSaved();  → first 출력
//       preset = [1.0, 2.0];
//       final second = preset ?? await loadSaved(); → second 출력
// (2) 실행 전에 출력 세 줄을 [내 예측]에 적고 비교하세요.
// (3) '저장소에서 읽음'은 왜 한 번만 나오나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 저장소에서 읽음
// [4.0]
// [1.0, 2.0]

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
List<double>? preset;

Future<List<double>> loadSaved() async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  print('저장소에서 읽음');
  return [4.0];
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)의 코드를 쓰세요.
}

// [내 말로 설명]
// 어느 줄에서 기다리고, 어느 값이 없을 수 있나요?
