# 4주차 — List, Map, 함수 전달

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

2주차에는 List에서 값을 `for-in`으로 하나씩 꺼냈어요([2주 6일](../week02/day06.dart)). 이번 주에는 세 가지를 배워요. 목록에서 **위치 번호로 꺼내기**, **이름표로 값을 찾는 Map**, 그리고 **함수를 다른 함수에 넘기기**예요. 함수의 입력과 반환은 [3주차](../week03/README.md)에서 배운 그대로예요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `final`, `for`, `in`, `if` |
| Dart가 제공 | `List`, `Map`, `length`, `isEmpty`, `where`, `map`, `fold`, `toList` |
| 작성자가 붙인 이름 | `laps`, `shoe`, `temps`, `prices`, 이름 없는 함수의 입력 `t`, `p`, `sum` |

### 1. List의 위치 번호와 길이 — 1~2일

```dart
void main() {
  final laps = <double>[1.5, 2.5, 3.0];
  print(laps[0]);
  print(laps[2]);
  print(laps.length);
  print(laps.isEmpty);
}
```

- `<double>[...]`: 이 목록에는 `double`(소수)만 담겠다는 표시예요. `< >` 안에 담을 값의 타입을 적어요. 함수 입력으로 목록을 받을 때도 `List<double>`이라고 써요.
- `laps[0]`: **0번** 칸의 값이에요. 위치 번호(인덱스)는 0부터 세요. 그래서 세 칸짜리 목록의 마지막 칸은 `[2]`예요.
- `.length`: 칸의 개수예요. `.isEmpty`: 비어 있으면 `true`예요. 둘 다 List가 원래 가진 기능이에요. `.`은 "laps의"라고 읽어요.

**예상 출력**

```text
1.5
3.0
3
false
```

평균을 구할 때 빈 목록이면 0으로 나누게 돼요. 그래서 `isEmpty`를 먼저 확인해요. → [1일](day01.dart), [2일](day02.dart)

### 2. Map: 이름표로 값 찾기 — 3일, 7일

```dart
void main() {
  final shoe = <String, String>{'brand': '가벼운신발', 'color': '파랑'};
  print(shoe['color']);
  shoe['color'] = '빨강';
  print(shoe['color']);
  print(shoe['size']);
}
```

- `{'키': 값, ...}`: Map은 **이름표(키)와 값을 짝지어** 담아요. 여기서 `{ }`는 함수 몸통이 아니라 Map을 만드는 기호예요. 같은 기호라도 놓인 자리에 따라 뜻이 달라요.
- `<String, String>`: 앞은 키의 타입, 뒤는 값의 타입이에요.
- `shoe['color']`: `'color'` 이름표가 붙은 값을 꺼내요. List는 `[0]`처럼 **위치 번호**로, Map은 `['color']`처럼 **이름표**로 꺼내요.
- `shoe['color'] = '빨강';`: 같은 이름표에 새 값을 넣으면 값이 바뀌어요.
- 없는 이름표를 꺼내면 `null`(값 없음)이 나와요. null은 [6주차](../week06/README.md)에 자세히 배워요.

**예상 출력**

```text
파랑
빨강
null
```

→ [3일](day03.dart). 7일에는 Map 여러 개를 List에 담은 `List<Map<String, String>>`을 다뤄요. 바깥은 목록이고 각 칸은 Map이에요. → [7일](day07.dart)

### 3. 이름 없는 함수를 넘겨서 거르기: where — 4일

3주차의 함수는 모두 이름이 있었어요. 이번에는 **이름 없이 그 자리에서 만든 함수**를 다른 함수에 넘겨요.

```dart
void main() {
  final temps = [12, 25, 30, 18];

  final hot = temps.where((t) => t >= 25).toList();
  print(hot);

  final hotByLoop = <int>[];
  for (final t in temps) {
    if (t >= 25) {
      hotByLoop.add(t);
    }
  }
  print(hotByLoop);
}
```

- `(t) => t >= 25`: 이름 없는 함수예요. `(t)`가 입력이고, `=>` 뒤의 `t >= 25`가 돌려주는 값(`true` 또는 `false`)이에요. `t`는 작성자가 붙인 이름이라 `(x) => x >= 25`라고 써도 같아요.
- `temps.where(...)`: `where`는 List가 원래 가진 기능이에요. 우리가 넘긴 함수를 **항목마다 한 번씩 대신 호출**하고, `true`가 나온 항목만 남겨요. 그래서 우리 코드에는 이 함수를 호출하는 줄이 없어요.
- `.toList()`: 남은 결과를 다시 List로 만들어요. 빼고 출력하면 `(25, 30)`처럼 괄호 모양으로 보여요.
- 아래 반복문은 위 한 줄과 같은 일을 해요. `where`가 낯설면 반복문으로 바꿔 생각해 보세요.

| 함수 | 정의 위치 | 호출하는 쪽 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `(t) => t >= 25` | `where(...)`의 괄호 안 | `where`가 항목마다 | 12, 25, 30, 18을 차례로 | `true` 또는 `false` |

**예상 출력**

```text
[25, 30]
[25, 30]
```

→ [4일](day04.dart)

### 4. 바꾸기 map, 하나로 모으기 fold — 5~6일

```dart
void main() {
  final prices = [1000, 2500];
  print(prices.map((p) => p * 2).toList());
  print(prices.fold<int>(0, (sum, p) => sum + p));
}
```

- `map`: 각 항목을 넘긴 함수에 넣고, **돌려받은 값으로 새 목록**을 만들어요. 원래 `prices`는 바뀌지 않아요. 2번의 Map 자료와 이름만 같고 다른 기능이에요.
- `fold<int>(0, ...)`: 처음 값 `0`에서 시작해 항목을 하나씩 더해 **값 하나로 모아요**. 넘긴 함수의 `sum`은 지금까지 모은 결과, `p`는 이번 항목이에요. `<int>`는 모은 결과의 타입이에요.
- fold 진행: `0 + 1000 = 1000` → `1000 + 2500 = 3500`
- `where(...).map(...)`처럼 이어 쓰면 왼쪽부터 차례로 실행돼요. 먼저 거르고, 남은 것만 바꿔요.

**예상 출력**

```text
[2000, 5000]
3500
```

→ [5일](day05.dart), [6일](day06.dart)

### 확인 질문

1. `final words = ['가', '나', '다'];`에서 `words[1]`과 `words.length`는 각각 무엇일까요? `words[3]`은 왜 오류일까요?
2. `[5, 10, 15].where((n) => n != 10).map((n) => n + 1).toList()`의 결과를 예측하세요. `where`에 넘긴 함수는 몇 번 호출되나요?

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [거리 목록 합산](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [빈 목록과 평균](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [Map은 이름표로 값을 찾기](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [함수를 값으로 전달하고 걸러내기](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [map 변환과 fold 누적](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [조건과 변환을 연결하기](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 기록 목록에서 이름 모으기](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week04/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. TODO 영역에 문제를 직접 풀어요. 예상 결과는 파일 안에 공개되어 있어요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

인덱스와 키를 구분하고, where·map·fold를 같은 반복문으로 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`record_from_session.dart의 speedSamples.map`를 [코드 지도](../project-map.md)에서 찾아요. map 콜백의 입력 s와 반환 s.kmh만 찾아요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
