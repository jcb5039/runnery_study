// 4주차 3일 해설 — Map은 이름표로 값을 찾기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: recordMap이 돌려준 Map에는 'distanceKm'과 'movingSeconds' 두 이름표만 있어요.
//            'memo' 이름표는 없어서 null이 나와요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final shoe = <String, String>{'brand': '빠른신발', 'size': '260'};
  print(shoe['brand']);
  print(shoe['size']);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final record = <String, Object>{'name': '민수', 'km': 3.0};
  print(record['name']);
  print(record['km']);
  record['km'] = 5.0;
  print(record['km']);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Map<String, Object> recordMap(double km, int seconds) {
  return {'distanceKm': km, 'movingSeconds': seconds};
}

void step3() {
  print('--- 3단계 ---');
  final saved = recordMap(5.2, 1800);
  print(saved['distanceKm']);
  print(saved['movingSeconds']);
  print(saved['memo']);
}
