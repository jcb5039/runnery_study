// 5주차 2일 해설 — 생성자와 this
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: first는 memo를 주지 않아 기본값 ''가 들어가서 [ ] 사이가 비어 보여요.
//            second는 memo: '비 옴'을 넣었어요. id는 required라서 빼면 실행 전에 오류가 나요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final shoe = Shoe('가벼운신발', 270);
  print(shoe.brand);
  print(shoe.size);
}

class Shoe {
  final String brand;
  final int size;
  Shoe(this.brand, this.size);
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final first = PracticeRun(2.0, 1200);
  final second = PracticeRun(5.0, 1800);
  print(first.distanceKm);
  print(second.distanceKm);
}

class PracticeRun {
  final double distanceKm;
  final int seconds;
  PracticeRun(this.distanceKm, this.seconds);
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  RecordLite({required this.id, required this.distanceKm, this.memo = ''});

  final String id;
  final double distanceKm;
  final String memo;
}

void step3() {
  print('--- 3단계 ---');
  final first = RecordLite(id: 'r1', distanceKm: 5.0);
  final second = RecordLite(id: 'r2', distanceKm: 3.2, memo: '비 옴');
  print(first.distanceKm);
  print('[${first.memo}]');
  print(second.memo);
}
