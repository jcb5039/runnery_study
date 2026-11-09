# 14주차 — 로그인과 서버의 역할

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

서버에 로그인을 요청하면 **기다림 → 성공 또는 실패**가 생겨요. 이번 주에는 실제 서버 대신 가짜 서비스로 이 세 가지 상태를 화면에 표시해요. 새 문법보다는 6주차(`Future`·`try`/`catch`)와 8~9주차(`setState`·`mounted`·`pushReplacement`)를 **한 흐름으로 잇는** 주예요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `try`, `catch`, `finally`, `throw`, `required` |
| Dart·Flutter가 제공 | `Future`, `StateError`, `CircularProgressIndicator` |
| 작성자가 붙인 이름 | `FakeWeather`, `fetch`, `ok`, `weather`, `loading`, `today` |

### 1. 로그인 상태를 값으로 표현하기 — 1일

`String? userId;`처럼 로그인한 사람이 없으면 `null`, 있으면 `'user-7'` 같은 ID로 표현해요(6주차의 `?`). 화면에서는 `userId ?? '손님'`처럼 표시할 수 있어요. 화면에 ID를 넣는 것과, 서버가 "정말 이 사용자가 맞다"고 확인(인증)하는 것은 다른 일이에요. → [1일](../practice_app/lib/week14/day01.dart)

### 2. 화면과 요청을 나누기: 서비스 클래스 — 2일

Flutter 없이 Dart 콘솔에서 먼저 흐름을 봐요.

```dart
Future<void> main() async {
  final weather = FakeWeather();
  var loading = true;
  print('불러오는 중: $loading');

  try {
    final today = await weather.fetch(ok: false);
    print('결과: $today');
  } catch (error) {
    print('실패: 다시 시도하세요');
  } finally {
    loading = false;
    print('불러오는 중: $loading');
  }
}

class FakeWeather {
  Future<String> fetch({required bool ok}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!ok) throw StateError('연결 실패');
    return '맑음';
  }
}
```

- `FakeWeather`: 작성자가 만든 **서비스** 클래스예요. 요청을 보내고 결과를 돌려주는 일만 해요. 화면 위젯을 만들거나 화면을 이동하지 않아요.
- `fetch({required bool ok})`: 성공과 실패를 눈에 보이는 입력 `ok`로 정해요. 실제 서버 대신 0.3초 기다린 뒤 결과를 줘요.
- `loading`: 지금 기다리는 중인지 기억하는 값이에요. `finally`에서 성공·실패와 상관없이 `false`로 돌려놓아요.

| 함수 | 정의 위치 | 호출 위치 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `fetch` | `FakeWeather` 안 | `main`의 `await weather.fetch(ok: false)` | `ok = false` | 성공이면 `'맑음'`(`Future<String>`), 실패면 throw |

**예상 출력** (`ok: false`)

```text
불러오는 중: true
실패: 다시 시도하세요
불러오는 중: false
```

`ok: true`로 바꾸면 가운데 줄이 `결과: 맑음`으로 바뀌어요. → [2일](../practice_app/lib/week14/day02.dart)

### 3. Flutter 화면에서는 단계마다 화면을 갱신해요 — 3~6일

위 흐름을 State 안의 메서드로 옮기면 단계마다 `setState`가 붙어요.

| 단계 | 콘솔 예제 | Flutter 화면 |
| --- | --- | --- |
| 시작 | `loading = true` | `setState`로 `loading = true`. 버튼은 `onPressed: loading ? null : 함수`로 비활성화해서 중복 요청을 막아요. (3일) |
| 기다림 | `await weather.fetch(...)` | 같아요. 기다리는 동안 사용자가 화면을 나갈 수 있어요. |
| 성공 | `print('결과: ...')` | `if (!mounted) return;` 뒤 `setState`로 결과를 표시해요. 필요하면 `pushReplacement`로 다음 화면으로 바꿔요. (5일) |
| 실패 | `catch` | `mounted`를 확인한 뒤 실패 문구를 표시해요. (4일) |
| 끝 | `finally` | `mounted`일 때만 `loading = false`로 바꿔 버튼을 다시 켜요. |

- `CircularProgressIndicator`: Flutter가 제공하는, 빙글빙글 도는 로딩 표시예요. → [3일](../practice_app/lib/week14/day03.dart)
- `mounted` 확인은 요청을 **멈추지 않아요**. 화면이 사라졌으면 결과를 화면에 넣지 않을 뿐이에요. → [6일](../practice_app/lib/week14/day06.dart)
- 다음 화면으로 갈지는 서비스가 아니라 화면 쪽에서 정해요. 그래서 서비스는 다른 화면에서도 다시 쓸 수 있어요. → [4일](../practice_app/lib/week14/day04.dart), [5일](../practice_app/lib/week14/day05.dart), 7일은 [복습](../practice_app/lib/week14/day07.dart)이에요.

### 확인 질문

1. 2번 예제에서 `loading = false;`를 `finally`가 아니라 `try`의 마지막 줄로 옮기면, 실패했을 때 `loading`은 어떤 값으로 남을까요?
2. 서비스 함수 안에서 바로 화면을 이동하지 않고, 화면 쪽에서 정하게 나누는 이유를 자기 말로 설명해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [사용자 ID와 로그인 상태](../practice_app/lib/week14/day01.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day01.dart) |
| 2일 | [서비스 함수에서 가짜 로그인 결과 받기](../practice_app/lib/week14/day02.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day02.dart) |
| 3일 | [로딩 중 중복 요청 막기](../practice_app/lib/week14/day03.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day03.dart) |
| 4일 | [로그인 실패를 화면에 표시](../practice_app/lib/week14/day04.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day04.dart) |
| 5일 | [성공한 뒤 홈으로 이동](../practice_app/lib/week14/day05.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day05.dart) |
| 6일 | [요청 중 화면에서 나가기](../practice_app/lib/week14/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day06.dart) |
| 7일 | [복습: 로그인·로그아웃 상태](../practice_app/lib/week14/day07.dart) | Flutter 화면 | [해설](../practice_app/lib/week14/answers/day07.dart) |

## 실행

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week14/day01.dart
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

대기·성공·실패를 각각 재현하고 화면 처리·요청·다음 화면 결정을 구분한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`LoginPageV2.login → AccountStore.login → backend → _next`를 [코드 지도](../project-map.md)에서 찾아요. 실제 계정을 쓰지 않고 가짜 응답 실습을 먼저 완료해요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
