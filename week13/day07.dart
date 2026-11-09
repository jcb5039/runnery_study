// 13주차 7일 — 복습: 권한 확인과 구간 합산
// 실행 위치: ~/src/runnery-study
// 실행: dart run week13/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week13/README.md의 "1~3번 섹션과 README의 "7일" 안내" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 예제를 실행해 본 뒤 아래로 내려가며 1단계 → 2단계 → 3단계 순서로 풀어요.
// 단계마다 [문제] 바로 아래에 코드를 쓰는 자리(①)와, 필요하면 함수를 만드는 자리(②)가 붙어 있어요.
// 한 단계를 저장·실행해서 예상 출력과 같으면 다음 단계로 넘어가요.

Future<void> main() async {
  // [짧은 실행 예제]
  print('권한 확인 → 구독 → 값 처리 → 종료');

  // [한 줄씩 읽기]
  // 1. 실제 위치 권한을 요청하지 않고 bool 입력으로 흐름을 연습해요.
  // 2. 실제 권한 처리 위치는 project-map의 RunningSession에서 찾아요.
  // [예제 예상 출력]
  // 권한 확인 → 구독 → 값 처리 → 종료

  // [단계 문제 실행]
  // 아래 세 줄은 이 파일 아래쪽의 step1, step2, step3 함수를 차례로 호출해요.
  // 각 단계의 문제와 풀 자리는 그 함수 바로 위아래에 있어요.
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] void go(bool ready)를 정의하세요. ready가 false이면 '준비 안 됨'을 출력하고 return해요.
//        그 아래에는 print('출발');을 써요. step1 안에서 go(false), go(true)를 차례로 호출하세요.
// [예상 출력]
// --- 1단계 ---
// 준비 안 됨
// 출발

Future<void> step1() async {
  print('--- 1단계 ---');
  // TODO ①: 여기서 go(false), go(true)를 차례로 호출하세요.
}

// TODO ②: 여기에 void go(bool ready)를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] 파일 아래쪽 TODO ② 자리에 bool permissionGranted = true;를 선언하세요. 눈에 보이는 권한 입력이에요.
//        step2 안에서 이 값을 확인해 false이면 '위치 권한 없음'을 출력하고 return하세요.
//        true이면 Stream<int>.fromIterable([100, 120, 80])의 구간 거리를 await for로 합산하세요.
//        끝나면 '총 300m' 형태로 출력하세요.
// [예상 출력]
// --- 2단계 ---
// 총 300m
// [값을 바꾸어 다시 실행] permissionGranted가 false이면 위치 권한 없음만 출력돼요.

Future<void> step2() async {
  print('--- 2단계 ---');
  // TODO ①: 여기에 권한 확인, await for 합산, 출력을 작성하세요.
}

// TODO ②: 여기에 bool permissionGranted = true;를 선언하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 위치 권한 확인 순서 ━━━━━━━━━━
// Runnery의 checkRunningLocation이에요(home/running/running_home_page.dart). 핵심만 남겼어요.
//
//   if (!await Geolocator.isLocationServiceEnabled()) {
//     return RunningLocationState.serviceDisabled;
//   }
//   var permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//   }
//   ... whileInUse나 always면 ready, 아니면 denied ...
//
// 읽는 법: ① 폰의 위치 기능이 꺼져 있으면 바로 끝 ② 저장된 권한을 확인 ③ 아직 거절 상태면 한 번 물어봐요.
// 바로 아래 [주어진 코드]는 실제 권한 대신 입력값으로 결과를 정해요. 권한 이름은 글자로 바꿨어요.
// [문제]
// (1) 실행 전에 아래 세 호출의 출력을 [내 예측]에 적으세요.
//       await checkRunningLocation(gpsOn: false, saved: 'denied', answer: 'always')
//       await checkRunningLocation(gpsOn: true, saved: 'whileInUse', answer: 'denied')
//       await checkRunningLocation(gpsOn: true, saved: 'denied', answer: 'always')
// (2) step3 안에서 세 결과를 각각 출력하고 비교하세요.
// (3) '권한을 물어봄'은 세 호출 중 언제만 나오나요? 왜 그런가요?
// [내 예측]
//
// [예상 출력]
// --- 3단계 ---
// serviceDisabled
// ready
// 권한을 물어봄
// ready

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
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
  // TODO ①: 여기서 세 결과를 각각 출력하세요.
}

// [내 말로 설명]
// 권한 없음, 앱 비활성화, 화면 제거는 서로 어떤 상태인가요?
