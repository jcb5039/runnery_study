// 6주차 2일 해설 — 값이 있을 때만 읽기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: '  runner  '는 trim으로 양끝 공백이 지워져 runner예요. null은 ?? 때문에 ''가 돼요.
//            ''는 null이 아니라서 trim()을 하지만 결과도 ''예요. v.trim()은 v가 null일 수 있어서 오류예요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(nameLength(null));
  print(nameLength('가나다라'));
}

int? nameLength(String? name) => name?.length;

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(memoLength(null));
  print(memoLength('달리기'));
}

int memoLength(String? memo) => memo?.length ?? 0;

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String cleanInput(String? v) {
  final value = v?.trim() ?? '';
  return '[$value]';
}

void step3() {
  print('--- 3단계 ---');
  print(cleanInput('  runner  '));
  print(cleanInput(null));
  print(cleanInput(''));
}
