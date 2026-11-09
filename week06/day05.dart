// 6주차 5일 — 실패를 잡아 처리하기
// 실행 위치: ~/src/runnery-study
// 실행: dart run week06/day05.dart
// 정답은 answers/day05.dart에 있어요.
// 오늘의 강의: week06/README.md의 "4. 실패 처리: try, catch, finally, throw — 5~6일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

void main() {
  // [짧은 실행 예제]
  try {
    print(int.parse('abc'));
  } catch (error) {
    print('숫자로 바꿀 수 없음');
  } finally {
    print('확인 끝');
  }

  // [한 줄씩 읽기]
  // 1. try 안의 parse가 잘못된 문자열 때문에 실패해요.
  // 2. catch가 오류를 받아 실패 문구를 출력해요.
  // 3. finally는 성공과 실패 모두에서 실행돼요.
  // [예제 예상 출력]
  // 숫자로 바꿀 수 없음
  // 확인 끝

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] step1 안에서 예제와 같은 try/catch/finally를 쓰되, int.parse('42')를 출력하세요.
//        catch에서는 '실패', finally에서는 '끝'을 출력하세요.
// [예상 출력]
// --- 1단계 ---
// 42
// 끝

void step1() {
  print('--- 1단계 ---');
  // TODO ①: 여기에 try/catch/finally를 작성하세요.
}

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] step2 안에서 text = '잘못된 값'을 선언하세요. try에서 int.parse(text)를 출력하세요.
//        catch에서는 '입력 오류', finally에서는 '정리 완료'를 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 입력 오류
// 정리 완료
// [값을 바꾸어 다시 실행] text를 '120'으로 바꾸면 120, 정리 완료예요.

void step2() {
  print('--- 2단계 ---');
  // TODO ①: 여기에 text 선언과 try/catch/finally를 작성하세요.
}

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 잘못된 기록 값 막기 ━━━━━━━━━━
// RunningRecord.fromJson 안에는 저장된 숫자를 검사하는 작은 함수가 있어요.
//
//   double number(dynamic value) {
//     if (value is! num || !value.isFinite || value < 0) {
//       throw const FormatException('Invalid record metric');
//     }
//     return value.toDouble();
//   }
//
// 읽는 법: 값이 숫자가 아니거나 0보다 작으면 throw로 실패를 만들어요. 문제없으면 그 값을 돌려줘요.
//   is!, isFinite는 지금은 빼고 읽어요. 바로 아래 [주어진 코드]는 "0보다 작으면 실패"만 남긴 거예요.
// [문제]
// (1) step3 안에 try/catch/finally를 쓰세요.
//     try 안: print(number(5.2)); print(number(-1)); print('여기는 안 옴'); 세 줄
//     catch: '잘못된 기록' 출력 / finally: '읽기 끝' 출력
// (2) 실행 전에 출력 순서를 [내 예측]에 적고 비교하세요.
// (3) '여기는 안 옴'은 왜 출력되지 않나요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// 5.2
// 잘못된 기록
// 읽기 끝

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
double number(double value) {
  if (value < 0) {
    throw const FormatException('Invalid record metric');
  }
  return value;
}

void step3() {
  print('--- 3단계 ---');
  // TODO ①: 여기에 문제 (1)의 try/catch/finally를 작성하세요.
}

// [내 말로 설명]
// 성공했을 때 catch와 finally 중 어느 쪽이 실행되나요?
