// 6주차 6일 — 기다린 작업의 실패
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day06.dart
// 정답은 answers/day06.dart에 있어요.
// 오늘의 강의: week06/README.md의 "4. 실패 처리: try, catch, finally, throw — 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

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

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

Future<double> exampleLoad(bool succeed) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!succeed) throw StateError('실패');
  return 2.0;
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 예제와 같은 try/catch를 쓰되 exampleLoad(true)를 기다려 출력하세요.
//        catch에서는 '불러오기 실패'를 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 2.0

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기에 try/catch를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] Future<double> loadDistance(bool succeed) async를 정의하세요.
//        100밀리초를 기다리고 succeed가 false이면 StateError('불러오기 실패')를 throw하세요. 성공이면 3.0을 반환하세요.
//        step2 안에서 succeed = true를 선언하고 try에서 await loadDistance(succeed)를 출력하세요.
//        catch에서는 '불러오기 실패', finally에서는 '처리 끝'을 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 3.0
// 처리 끝
// [값을 바꾸어 다시 실행] succeed를 false로 바꾸면 불러오기 실패, 처리 끝이에요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 succeed 선언과 try/catch/finally를 작성하세요.
}

// TODO ②: 여기에 Future<double> loadDistance(bool succeed) async를 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 실패해도 이전 기록 지키기 ━━━━━━━━━━
// 홈 화면 _reload의 전체 모양이에요(home/home_page.dart). setState와 mounted는 8주차에 배워요.
//
//   Future<void> _reload() async {
//     try {
//       final loaded = ... await _store.load();
//       ... _records = loaded; _error = null; ...
//     } catch (error) {
//       ... _error = error ...
//     }
//   }
//
// 읽는 법: 성공하면 기록을 바꾸고 오류를 지워요(null). 실패하면 오류만 남기고 기록은 그대로 둬요.
// 바로 아래 [주어진 코드]는 setState를 빼고, 성공·실패를 입력 ok로 정하게 바꾼 거예요.
// [문제]
// (1) step3 안에서 아래 순서로 쓰세요.
//       await reload(true);  → records와 error 출력
//       await reload(false); → records와 error 출력
// (2) 실행 전에 출력 네 줄을 [내 예측]에 적고 비교하세요.
// (3) 두 번째 reload는 실패했는데 records가 왜 비지 않았나요? records = loaded; 줄은 실행됐나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// [3.0, 5.0]
// null
// [3.0, 5.0]
// 불러오기 실패

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
List<double> records = [];
String? error;

Future<List<double>> load(bool ok) async {
  await Future<void>.delayed(const Duration(milliseconds: 100));
  if (!ok) throw StateError('저장소 읽기 실패');
  return [3.0, 5.0];
}

Future<void> reload(bool ok) async {
  try {
    final loaded = await load(ok);
    records = loaded;
    error = null;
  } catch (e) {
    error = '불러오기 실패';
  }
}

Future<void> step3() async {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)의 코드를 쓰세요.
}

// [내 말로 설명]
// await를 빼면 catch가 기다린 뒤 발생한 오류를 같은 방식으로 받을까요?
