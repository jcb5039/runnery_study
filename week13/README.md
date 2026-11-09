# 13주차 — Stream, Timer, 앱 생명주기

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

1~5일·7일은 Dart 콘솔, **6일은 Flutter 화면**이에요. [생명주기 안내](../guides/flutter-lifecycle.md)의 앱 상태 부분을 다시 읽어요. 실제 GPS나 위치 권한 요청 없이 이벤트와 조건 분기를 연습해요.

## 이번 주 처음 만나는 개념

6주차의 `Future`는 값을 **한 번** 받았어요. 이번 주의 `Stream`은 값을 **여러 번, 시간에 따라** 받아요. GPS 위치처럼 계속 들어오는 값을 흉내 내요. 마지막으로 앱 전체가 앞에 보이는지, 뒤로 갔는지를 알려주는 **앱 생명주기**를 배워요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `await for`, `break`, `late`, `with`, `this` |
| Dart·Flutter가 제공 | `Stream`, `fromIterable`, `periodic`, `take`, `listen`, `StreamSubscription`, `cancel`, `Timer`, `Completer`, `WidgetsBindingObserver`, `AppLifecycleState` |
| 작성자가 붙인 이름 | `bell`, `sound`, `ticks`, `subscription`, `alarm` |

### 1. Stream과 await for — 1일, 3일

```dart
Future<void> main() async {
  final bell = Stream<String>.fromIterable(['딩', '동']);
  await for (final sound in bell) {
    print(sound);
  }
  print('끝');
}
```

- `Stream<String>`: String 값이 **여러 번 도착하는 통로**예요. `fromIterable`은 목록의 값을 차례로 흘려보내는 Stream을 만들어요.
- `await for`: 2주차의 `for-in`과 비슷하지만, **다음 값이 도착할 때까지 기다렸다가** 하나씩 꺼내요. Stream이 끝나면 반복 다음 줄로 가요.
- `Stream.periodic(시간, (i) => ...)`은 정해진 간격마다 값을 보내는 Stream이에요. 스스로 끝나지 않아서 `.take(3)`처럼 받을 개수를 정하거나 직접 멈춰야 해요. → [3일](day03.dart)

**예상 출력**

```text
딩
동
끝
```

→ [1일](day01.dart)

### 2. listen과 구독 취소 — 2일, 4일

```dart
Future<void> main() async {
  final ticks = Stream<int>.periodic(
    const Duration(milliseconds: 100),
    (i) => i,
  );
  final subscription = ticks.listen((n) {
    print('틱 $n');
  });

  await Future<void>.delayed(const Duration(milliseconds: 350));
  await subscription.cancel();
  print('구독 취소');
}
```

- `listen(...)`: 값이 올 때마다 호출할 함수(콜백)를 맡겨요. `listen` 자체는 **바로** 끝나고, 구독 객체(`StreamSubscription`)를 돌려줘요.
- `subscription.cancel()`: 구독을 끊어서 더 이상 값을 받지 않아요. 끊지 않으면 periodic Stream은 계속 값을 보내요. 화면에서 구독했다면 8주차의 `dispose`에서 끊어요.
- `await for` 반복 안에서 `break`로 빠져나와도 구독이 끝나요.
- 4일 실습의 `late`는 "값은 나중에 넣을 변수"라는 키워드예요(8주차). `Completer`는 콜백 안에서 "끝났다"고 알려줄 Future를 만드는 도구예요. 실습 파일의 설명을 따라가면 돼요.

**예상 출력** (컴퓨터가 바쁘면 틱이 하나 적게 나올 수 있어요)

```text
틱 0
틱 1
틱 2
구독 취소
```

→ [2일](day02.dart), [4일](day04.dart)

### 3. Timer — 5일

```dart
import 'dart:async';

void main() {
  final alarm = Timer(const Duration(seconds: 1), () {
    print('울림');
  });
  alarm.cancel();
  print('알람 취소');
}
```

- `import 'dart:async';`: Timer가 들어 있는 Dart 도구 묶음이에요.
- `Timer(시간, 함수)`: 시간이 지나면 함수를 **한 번** 호출해요. `Timer.periodic`은 취소할 때까지 반복해요.
- 이 예제는 1초가 지나기 전에 `cancel()`을 해서 `울림`은 출력되지 않아요. 타이머도 Stream 구독처럼 다 쓰면 정리해요.

**예상 출력**

```text
알람 취소
```

→ [5일](day05.dart)

### 4. 앱 생명주기 — 6일 (Flutter 화면)

8주차의 생명주기는 **화면 하나(State)**가 만들어지고 정리되는 흐름이었어요. 앱 생명주기는 **앱 전체**가 지금 보이고 입력을 받는지에 대한 소식이에요. [6일 파일](../practice_app/lib/week13/day06.dart)의 `ExamplePage`에서 아래 네 곳을 찾아보세요.

| 코드 조각 | 뜻 |
| --- | --- |
| `extends State<...> with WidgetsBindingObserver` | `with`는 클래스에 **역할을 덧붙이는** 키워드예요. 이 역할을 붙이면 앱 상태 소식을 받을 수 있어요. |
| `initState`의 `WidgetsBinding.instance.addObserver(this)` | 이 State를 소식 받는 쪽으로 등록해요. `this`는 지금 이 State 객체예요. |
| `didChangeAppLifecycleState(AppLifecycleState state)` | 앱 상태가 바뀔 때 **Flutter가 호출**해요. 입력 `state`가 새 상태예요. 반환값은 없어요. |
| `dispose`의 `WidgetsBinding.instance.removeObserver(this)` | 등록을 해제해요. 12주차의 리스너 등록·해제와 같은 짝이에요. |

| 앱 상태 | 뜻 |
| --- | --- |
| `resumed` | 보이고 입력도 받는 상태 |
| `inactive` | 보이지만 입력 포커스를 잃은 상태 |
| `hidden` | 화면이 보이지 않는 상태 |
| `paused` | (모바일) 백그라운드에 있는 상태 |

- 다른 탭으로 갔다 와도 화면의 `dispose`는 호출되지 않아요. 앱 상태가 바뀐 것과 화면이 제거된 것은 **다른 사건**이에요.
- 플랫폼마다 오는 상태와 순서가 달라요. 앱을 강제로 끄면 소식을 못 받을 수도 있어요.

**화면**: 처음에는 대기 문구가 보여요. 브라우저의 다른 탭으로 갔다 돌아오면 전달받은 상태 이름이 보여요. 긴 설명은 [위젯과 앱 생명주기](../guides/flutter-lifecycle.md)에 있어요.

7일의 위치 권한은 실제 권한 대신 눈에 보이는 `bool` 값으로 "권한 없음" 흐름을 연습해요. → [7일](day07.dart)

### 확인 질문

1. `Future<int>` 하나와 `Stream<int>` 하나는 각각 값을 몇 번 줄 수 있나요?
2. 사용자가 다른 앱으로 갔다 돌아왔을 때, 8주차의 `dispose`와 이번 주의 `didChangeAppLifecycleState` 중 무엇이 호출될까요?

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [여러 번 도착하는 값 Stream](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [listen으로 구독하기](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [일정 간격의 가짜 위치 이벤트](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [StreamSubscription 취소](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [Timer 시작과 정리](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [앱 생명주기와 백그라운드](../practice_app/lib/week13/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week13/answers/day06.dart) |
| 7일 | [복습: 가짜 GPS 합산과 권한 분기](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week13/day01.dart
```

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week13/day06.dart
```

`showPractice = false`로 예제를 보고, `PracticePage`에 문제를 푼 뒤 `true`로 바꿔요. 저장 후 `R`로 다시 시작해요. 다른 날짜는 `q`로 종료한 뒤 `-t` 경로를 바꿔 실행해요. 해설은 경로에 `answers/`를 넣어 실행해요. 각 파일은 자기 `main()`을 가진 독립 실습이에요.

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. TODO 영역에 문제를 직접 풀어요. 예상 결과는 파일 안에 공개되어 있어요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

Future와 Stream을 구분하고 구독 취소·타이머 정리·앱 상태 변화를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RunningSession의 _subscription, _ticker, 위치 수신과 정리`를 [코드 지도](../project-map.md)에서 찾아요. 위치 권한과 앱 상태가 흐름을 어떻게 바꾸는지 읽어요. GPS 필터 수정은 다음 심화 범위예요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
