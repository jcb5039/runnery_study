// 10주차 7일 해설 — 복습: 속도와 페이스
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 3735초는 h = 1, m = 2, s = 15, _two(m) = '02', _two(s) = '15'라서 1:02:15예요.
//            1시간이 안 되면 ? : 뒤쪽 모양을 써서 분은 두 자리로 채우지 않아요.

void main() {
  step1();
  step2();
  step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
void step1() {
  print('--- 1단계 ---');
  final d = Duration(seconds: 75);
  print('${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
void step2() {
  print('--- 2단계 ---');
  final record = PracticeRun(5.0, 1800);
  print(record.averageSpeed);
  print(record.paceSeconds);
}

class PracticeRun {
  final double km;
  final int seconds;
  PracticeRun(this.km, this.seconds);

  double get averageSpeed =>
      km <= 0 || seconds <= 0 ? 0 : km / (seconds / 3600);
  int get paceSeconds => km <= 0 || seconds <= 0 ? 0 : (seconds / km).round();
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
String _two(int n) => n.toString().padLeft(2, '0');

String clock(Duration d) {
  final h = d.inHours;
  final m = d.inMinutes.remainder(60);
  final s = d.inSeconds.remainder(60);
  return h > 0 ? '$h:${_two(m)}:${_two(s)}' : '$m:${_two(s)}';
}

void step3() {
  print('--- 3단계 ---');
  print(clock(Duration(seconds: 1935)));
  print(clock(Duration(seconds: 3735)));
  print(clock(Duration(seconds: 59)));
}
