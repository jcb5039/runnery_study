// 13주차 2일 해설 — listen으로 구독하기
// 문제의 결과만 출력해요. 먼저 단계마다 직접 시도한 뒤 읽고, 닫은 다음 입력을 바꾸어 다시 풀어 보세요.
// 3단계 설명: listen에 넘긴 onPosition은 값이 올 때마다 Stream이 불러요. 5와 9가 차례로 와요.
//            값이 다 오고 Stream이 끝나면 onDone이 불려요. 기다리는 동안 이 일들이 일어나요.

Future<void> main() async {
  await step1();
  await step2();
  await step3();
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
Future<void> step1() async {
  print('--- 1단계 ---');
  final bell = Stream<String>.fromIterable(['딩', '동']).listen((sound) {
    print(sound);
  });
  await bell.asFuture<void>();
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
Future<void> step2() async {
  print('--- 2단계 ---');
  final subscription = Stream<int>.fromIterable([3, 5]).listen((km) {
    print(km);
  });
  await subscription.asFuture<void>();
  print('완료');
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
void onPosition(int meters) {
  print('위치: ${meters}m');
}

void onDone() {
  print('위치 스트림 끝');
}

Future<void> step3() async {
  print('--- 3단계 ---');
  Stream<int>.fromIterable([5, 9]).listen(onPosition, onDone: onDone);
  await Future<void>.delayed(const Duration(milliseconds: 50));
}
