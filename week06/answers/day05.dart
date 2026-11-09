// 6주차 5일 해설 — 실패를 잡아 처리하기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: number(5.2)는 통과해서 5.2가 출력돼요. number(-1)에서 throw가 일어나는 순간
//            try의 나머지 줄은 건너뛰고 catch로 가요. finally는 항상 마지막에 실행돼요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  try {
    print(int.parse('42'));
  } catch (error) {
    print('실패');
  } finally {
    print('끝');
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final text = '잘못된 값';
  try {
    print(int.parse(text));
  } catch (error) {
    print('입력 오류');
  } finally {
    print('정리 완료');
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
double number(double value) {
  if (value < 0) {
    throw const FormatException('Invalid record metric');
  }
  return value;
}

void step3() {
  print('--- 3단계 ---');
  try {
    print(number(5.2));
    print(number(-1));
    print('여기는 안 옴');
  } catch (error) {
    print('잘못된 기록');
  } finally {
    print('읽기 끝');
  }
}
