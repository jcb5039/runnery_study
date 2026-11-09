# 6주차 — 없는 값과 비동기 작업

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

두 가지를 배워요. 하나는 **값이 없을 수도 있는 변수**를 안전하게 다루는 방법이고, 다른 하나는 **시간이 걸리는 작업의 결과를 기다리는** 방법이에요. 4주차에 없는 Map 키에서 본 `null`이 다시 나와요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `null`, `async`, `await`, `try`, `catch`, `finally`, `throw`, `const` |
| 기호 | 타입 뒤 `?`, `??`, `?.`, `!` |
| Dart가 제공 | `Future`, `Duration`, `int.parse`, `StateError`, `length` |
| 작성자가 붙인 이름 | `nickname`, `hometowns`, `cook`, `food`, `error` |

### 1. null, `?`, `??` — 1일

```dart
void main() {
  String? nickname;
  print(nickname);
  print(nickname ?? '이름 없음');

  nickname = '번개';
  print(nickname);
}
```

- `null`: "값이 없다"는 뜻의 키워드예요. 빈 문자열 `''`과 달라요. `''`은 "글자가 0개인 값이 있다"는 뜻이에요.
- `String?`: 타입 뒤의 `?`는 "String이거나 null일 수 있다"는 표시예요. `?`가 없는 `String` 변수에는 null을 넣을 수 없어요. `?`가 붙은 변수는 처음 값을 주지 않으면 null로 시작해요.
- `??`: 왼쪽 값이 null이면 오른쪽 값을 써요. null이 아니면 왼쪽 값을 그대로 써요.

**예상 출력**

```text
null
이름 없음
번개
```

→ [1일](day01.dart)

### 2. 값이 있을 때만 읽기 `?.`, 단정하기 `!` — 2일

```dart
void main() {
  final hometowns = {'민수': '서울'};
  final first = hometowns['민수'];
  final second = hometowns['지우'];
  print(first?.length);
  print(second?.length);
  print(second?.length ?? 0);
}
```

- Map에서 꺼낸 값은 없을 수도 있어서 `String?`이에요. `second`는 없는 키라 null이에요.
- `second?.length`: `second`가 null이면 길이를 읽지 않고 null을 줘요. 값이 있을 때만 `.length`를 읽어요.
- `?? 0`을 붙이면 null 대신 0을 써요.
- `!`(예: `second!.length`)는 "이 값은 null이 아니야"라고 **단정**하는 표시예요. 실제로 null이면 실행 중에 오류로 멈춰요. 이번 주 실습에서는 `!` 대신 `?.`와 `??`를 써요.

**예상 출력**

```text
2
null
0
```

→ [2일](day02.dart)

### 3. Future, async, await — 3~4일

```dart
Future<void> main() async {
  print('주문');
  final food = await cook();
  print(food);
  print('식사');
}

Future<String> cook() async {
  await Future<void>.delayed(const Duration(milliseconds: 300));
  return '라면';
}
```

- `Future<String>`: "**나중에** String 하나가 준비된다"는 약속 상자예요. 상자 안에 `String`이 바로 들어 있는 게 아니에요.
- `async`: 이 함수 안에서 `await`를 쓰겠다는 표시예요. `async` 함수는 결과를 `Future`에 담아 돌려줘요. 그래서 `main`도 `Future<void> main() async`로 바뀌었어요.
- `Future<void>`: 끝났다는 것만 알리고, 꺼낼 값은 없는 약속이에요.
- `await cook()`: 약속이 완료될 때까지 기다렸다가 안의 값(`'라면'`)을 꺼내요. 그동안 이 줄 아래는 실행되지 않아요.
- `Future<void>.delayed(const Duration(milliseconds: 300))`: Dart가 제공하는 기능이에요. 0.3초 뒤에 완료되는 약속을 만들어서 서버 요청처럼 시간이 걸리는 일을 흉내 내요. `Duration`은 시간의 길이, `const`는 실행 중에 바뀌지 않는 고정 값이라는 표시예요.

| 함수 | 정의 | 호출 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `cook` | `Future<String> cook() async` | `main` 안 `await cook()` | 없음 | `Future<String>`, await로 꺼내면 `'라면'` |

**예상 출력** (`주문` 뒤 0.3초 쉬었다가 나머지가 나와요)

```text
주문
라면
식사
```

`await`를 빼고 `print(cook())`이라고 쓰면 `Instance of 'Future<String>'`이 출력돼요. 값이 아니라 약속 상자 자체를 출력한 거예요. → [3일](day03.dart), [4일](day04.dart)

### 4. 실패 처리: try, catch, finally, throw — 5~6일

```dart
void main() {
  try {
    print(int.parse('12'));
    print(int.parse('열둘'));
    print('이 줄은 실행되지 않아요');
  } catch (error) {
    print('숫자로 바꿀 수 없어요');
  } finally {
    print('검사 끝');
  }
}
```

- `try { }`: 실패할 수 있는 코드를 넣어요. `int.parse`는 Dart가 제공하는 함수로, 글자를 정수로 바꿔요. `'열둘'`은 숫자 모양이 아니라서 실패해요.
- 실패하는 순간 `try`의 나머지 줄은 건너뛰고 `catch`로 가요. `error`에는 실패 정보가 담겨요. 이름은 작성자가 정해요.
- `finally { }`: 성공해도 실패해도 마지막에 항상 실행돼요.
- `throw`: 우리가 직접 실패를 만드는 키워드예요. 예를 들어 `throw StateError('연결 끊김');`처럼 써요. `async` 함수 안에서 던진 실패도, 호출한 쪽이 `await`로 기다리고 있으면 `catch`에서 받을 수 있어요. → [6일](day06.dart)

**예상 출력**

```text
12
숫자로 바꿀 수 없어요
검사 끝
```

→ [5일](day05.dart), 7일은 [복습](day07.dart)이에요.

### 확인 질문

1. 3번 예제에서 `print('식사');`를 `final food = await cook();` 줄 **위로** 옮기면 출력 순서가 어떻게 될까요?
2. `null`, `''`, `0`은 각각 어떤 상황을 나타내는지 자기 말로 구분해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [null과 기본 문구](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [없는 값에 안전하게 접근하기](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [기다리는 결과 Future](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [Future 값을 기다려 받기](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [실패 처리와 마무리](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [비동기 함수의 실패도 기다려 처리하기](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 거리와 메모 불러오기](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week06/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. TODO 영역에 문제를 직접 풀어요. 예상 결과는 파일 안에 공개되어 있어요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

null과 빈 문자열, Future<double>과 double을 구분하고 출력 순서를 예측한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`home_page.dart의 _reload`를 [코드 지도](../project-map.md)에서 찾아요. await _store.load() 앞뒤에서 언제 값이 준비되는지 설명해요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
