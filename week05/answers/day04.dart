// 5주차 4일 해설 — getter로 계산한 값 읽기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 1800 ÷ 5.0 = 360.0을 반올림해 360, 거리 0은 if에서 0, 357.14...는 357이에요.
//            getter라서 필드처럼 () 없이 읽어요. 읽는 순간 계산해요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  print(Water(3).ml);
}

class Water {
  final int cups;
  Water(this.cups);
  int get ml => cups * 200;
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  print(PracticeRun(2.0, 1200).averageSpeed);
  print(PracticeRun(2.0, 0).averageSpeed);
}

class PracticeRun {
  final double distanceKm;
  final int seconds;
  PracticeRun(this.distanceKm, this.seconds);

  double get averageSpeed {
    if (seconds <= 0) return 0;
    return distanceKm / (seconds / 3600);
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class RecordLite {
  final double distanceKm;
  final int movingSeconds;
  RecordLite(this.distanceKm, this.movingSeconds);

  int get paceSeconds {
    if (distanceKm <= 0) return 0;
    return (movingSeconds / distanceKm).round();
  }
}

void step3() {
  print('--- 3단계 ---');
  print(RecordLite(5.0, 1800).paceSeconds);
  print(RecordLite(0, 0).paceSeconds);
  print(RecordLite(4.2, 1500).paceSeconds);
}
