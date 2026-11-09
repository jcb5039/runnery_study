// 5주차 3일 해설 — 객체 안의 함수: 메서드
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: toJson은 자기 객체(record)의 필드 id와 distanceKm를 읽어요. 생성할 때 넣은 'r7'과 4.5예요.
//            돌려받은 Map에 바로 ['distanceKm']를 붙여 값을 꺼낼 수 있어요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(Lap(150).minutes());
}

class Lap {
  final int seconds;
  Lap(this.seconds);
  int minutes() => seconds ~/ 60;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final record = PracticeRun(3.0);
  print(record.label());
}

class PracticeRun {
  final double distanceKm;
  PracticeRun(this.distanceKm);
  String label() => '${distanceKm}km';
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  final String id;
  final double distanceKm;
  RecordLite(this.id, this.distanceKm);

  Map<String, Object> toJson() => {'id': id, 'distanceKm': distanceKm};
}

void step3() {
  print('--- 3단계 ---');
  final record = RecordLite('r7', 4.5);
  print(record.toJson());
  print(record.toJson()['distanceKm']);
}
