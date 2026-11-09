// 13주차 7일 해설 — 복습: 권한 확인과 구간 합산
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: 첫 호출은 위치 기능이 꺼져 있어 권한을 보지도 않고 끝나요.
//            두 번째는 이미 whileInUse라 묻지 않아요. 세 번째만 저장된 값이 denied라서 한 번 물어봐요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  go(false);
  go(true);
}

void go(bool ready) {
  if (!ready) {
    print('준비 안 됨');
    return;
  }
  print('출발');
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  if (!permissionGranted) {
    print('위치 권한 없음');
    return;
  }
  var total = 0;
  await for (final meters in Stream<int>.fromIterable([100, 120, 80])) {
    total += meters;
  }
  print('총 ${total}m');
}

bool permissionGranted = true; // 입력: 실제 권한 요청을 대신하는 연습 값

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
Future<bool> serviceEnabled(bool on) async => on;
Future<String> checkPermission(String saved) async => saved;

Future<String> requestPermission(String answer) async {
  print('권한을 물어봄');
  return answer;
}

Future<String> checkRunningLocation({
  required bool gpsOn,
  required String saved,
  required String answer,
}) async {
  if (!await serviceEnabled(gpsOn)) return 'serviceDisabled';
  var permission = await checkPermission(saved);
  if (permission == 'denied') {
    permission = await requestPermission(answer);
  }
  if (permission == 'whileInUse' || permission == 'always') return 'ready';
  return 'denied';
}

Future<void> step3() async {
  print('--- 3단계 ---');
  print(await checkRunningLocation(gpsOn: false, saved: 'denied', answer: 'always'));
  print(await checkRunningLocation(gpsOn: true, saved: 'whileInUse', answer: 'denied'));
  print(await checkRunningLocation(gpsOn: true, saved: 'denied', answer: 'always'));
}
