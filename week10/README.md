# 10주차 — 기록 모델과 계산

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

Dart가 제공하는 날짜·시간 도구와, 계산 결과를 보기 좋은 글자로 바꾸는 방법을 배워요. 대부분 5주차의 클래스·getter와 6주차의 null을 다시 쓰는 내용이에요.

| 종류 | 이번 주 예 |
| --- | --- |
| 기호 | `조건 ? A : B`, `%`, `!=`, `${ }` |
| Dart가 제공 | `DateTime`, `Duration`, `inHours`, `inMinutes`, `round`, `toString`, `padLeft`, `toDouble` |
| 작성자가 붙인 이름 | `trip`, `movie`, `score`, `result`, `bonuses` |

### 1. DateTime과 Duration — 1~2일

→ 1·2일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
void main() {
  final trip = DateTime(2025, 3, 9);
  print('${trip.month}월 ${trip.day}일');

  final movie = Duration(minutes: 135);
  print(movie.inHours);
  print(movie.inMinutes % 60);
}
```

- `DateTime(2025, 3, 9)`: Dart가 제공하는 날짜 클래스로 객체를 만들어요(5주차 생성자). 입력은 순서대로 연, 월, 일이에요.
- `trip.month`, `trip.day`: 그 날짜 객체의 월과 일을 읽어요.
- `Duration(minutes: 135)`: "135분 동안"이라는 **시간의 길이**예요. 언제(`DateTime`)와 얼마 동안(`Duration`)은 서로 다른 클래스예요.
- `inHours`: 다 채운 시간만 세요(2시간). 남은 분은 1주차의 `%`(나머지)로 구해요. `135 % 60`은 15예요.
- `${ }`: 문자열 안에 `.`이 들어간 식을 넣을 때는 중괄호로 감싸요. `'$trip.month'`라고 쓰면 `trip`만 값으로 바뀌고 `.month`는 글자 그대로 남아요.

**예상 출력**

```text
3월 9일
2
15
```

**1일 3단계에 필요한 것: 요일 번호 weekday**

```dart
void main() {
  final names = ['월', '화', '수', '목', '금', '토', '일'];
  final day = DateTime(2025, 3, 9);
  print(day.weekday);
  print('${names[day.weekday - 1]}요일');
}
```

- `weekday`: 요일을 숫자로 알려줘요. **월요일이 1, 일요일이 7**이에요.
- 목록의 위치 번호는 0부터라서 `weekday - 1`로 꺼내요(4주차 1일).

**예상 출력**

```text
7
일요일
```

**2일 3단계에 필요한 것: remainder**

```dart
void main() {
  final movie = Duration(minutes: 135);
  print(movie.inMinutes);
  print(movie.inMinutes.remainder(60));
  print(movie.inMinutes % 60);
}
```

- `remainder(60)`: 60으로 나눈 **나머지**예요. 양수에서는 `% 60`과 같아요. Runnery 코드는 이 모양을 많이 써요.
- `inMinutes`는 전체 분(135)이에요. 시간을 뺀 나머지 분(15)이 필요하면 `remainder(60)`을 붙여요.

**예상 출력**

```text
135
15
15
```

→ [1일](day01.dart), [2일](day02.dart)

### 2. 단위 바꾸기와 0으로 나누기 — 3~4일

→ 3·4일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
void main() {
  print(10 / 4);
  print((10 / 4).round());
  print(5 / 0);
}
```

- `/`의 결과는 언제나 `double`이에요.
- `.round()`: 가장 가까운 정수로 반올림해요. 2.5는 3이 돼요.
- `5 / 0`은 오류가 아니라 `Infinity`(무한대)가 나와요. 이런 값을 화면에 그대로 보여줄 수는 없어요. 그래서 나누기 **전에** 0인지 검사하고 0을 돌려줘요.
- 계산하기 전에 단위를 적어 두세요. 초를 시간으로 바꿀 때는 `/ 3600`, 미터를 km로 바꿀 때는 `/ 1000`이에요.

**예상 출력**

```text
2.5
3
Infinity
```

**3일 문제에 필요한 것: `||`, 밀리초, Duration의 고정값**

```dart
void main() {
  final a = 0;
  final b = 5;
  print(a <= 0 || b <= 0);

  final walk = Duration(minutes: 15);
  print(walk.inMilliseconds);
  print(walk.inMilliseconds / Duration.millisecondsPerHour);
  print(Duration.zero.inSeconds);
}
```

- `||`: "또는"이에요(2주차). 둘 중 **하나라도** 참이면 참이에요. 거리나 시간 중 하나라도 0이면 계산하지 않을 때 써요.
- `inMilliseconds`: 길이를 밀리초(1/1000초)로 알려줘요. 15분은 900,000밀리초예요.
- `Duration.millisecondsPerHour`: 1시간의 밀리초(3,600,000)예요. 5주차의 `static const`처럼 클래스 이름으로 바로 읽어요. 이 값으로 나누면 "시간" 단위가 돼요(0.25시간).
- `Duration.zero`: 0초짜리 길이예요.
- `a / b / c`는 왼쪽부터 차례로 나눠요. `distance / 1000 / hours`는 먼저 km로 바꾼 뒤 시간으로 나눠요.

**예상 출력**

```text
true
900000
0.25
0
```

**4일 3단계에 필요한 것: 계산할 수 없으면 null 돌려주기**

```dart
const minCount = 3;

double? average(int total, int count) {
  if (count < minCount) return null;
  return total / count;
}

void main() {
  print(average(30, 5));
  print(average(30, 2));
}
```

- 반환 타입 `double?`: 계산할 수 없을 때 **null**을 돌려줄 수 있어요(6주차). 0을 돌려주면 "평균이 0"인지 "계산 안 함"인지 구분할 수 없어요.
- `const minCount = 3;`: 함수 바깥에 둔 바뀌지 않는 값이에요. 기준 숫자에 이름을 붙여 두면 읽기 쉬워요.

**예상 출력**

```text
6.0
null
```

→ [3일](day03.dart), [4일](day04.dart)

### 3. 삼항 연산자와 자릿수 채우기 — 5일

→ 5일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
void main() {
  final score = 7;
  final result = score >= 5 ? '합격' : '재시험';
  print(result);
  print(score.toString().padLeft(3, '0'));
}
```

- `조건 ? A : B`: 조건이 참이면 A, 거짓이면 B, **값 하나**를 골라요. `if/else`를 값 자리에 한 줄로 쓴 모양이에요. 8주차의 `loading ? null : load`도 같은 문법이에요.
- `toString()`: 숫자를 문자열로 바꿔요.
- `padLeft(3, '0')`: 3글자가 될 때까지 **왼쪽**을 `'0'`으로 채워요. 시계처럼 `5`를 `05`로 보여줄 때 써요.

**예상 출력**

```text
합격
007
```

**5일 3단계에 필요한 것: 따옴표가 들어간 글자, `.01`, 고르지 않은 쪽은 실행 안 함**

```dart
String inch(int n) => "$n\"";

void main() {
  print("It's 5'");
  print(inch(3));
  final size = .5;
  print(size < .01 || size > 1 ? '범위 밖' : inch(2));
}
```

- 글자 안에 `'`를 넣고 싶으면 바깥을 큰따옴표 `" "`로 감싸요. 큰따옴표 안에서 `"`를 쓰려면 앞에 `\`를 붙여 `\"`로 써요.
- `.5`, `.01`은 `0.5`, `0.01`을 줄여 쓴 모양이에요.
- `조건 ? A : B`에서 **골라지지 않은 쪽은 실행되지 않아요**. 조건이 참이면 B 자리의 함수는 호출되지 않아요.

**예상 출력**

```text
It's 5'
3"
2"
```

→ [5일](day05.dart)

### 4. 값이 있으면 쓰고, 없으면 다른 값 — 6일

→ 6일 문제는 이 섹션만 읽고 풀 수 있어요. 7일 복습은 1~4번 섹션을 함께 써요.

```dart
void main() {
  final bonuses = {'민': 20};
  final first = bonuses['민'];
  final second = bonuses['준'];
  print(first != null ? 100 + first : 100);
  print(second != null ? 100 + second : 100);
}
```

- Map에서 꺼낸 값은 없을 수도 있어서 `int?`예요(6주차).
- `!= null`: "null이 아니면"이에요. 확인한 뒤에는 그 값을 숫자로 계산할 수 있어요.
- `0`과 `null`은 달라요. 0은 "재 봤더니 0"이고, null은 "잰 값이 없음"이에요.
- 정수를 `double`로 맞출 때는 `toDouble()`을 써요. `3.toDouble()`은 `3.0`이에요.

**예상 출력**

```text
120
100
```

→ [6일](day06.dart), 7일은 [복습](day07.dart)이에요.

**6일 3단계에 필요한 것: 이름 앞의 `_`, `??`를 계산식 안에 쓰기**

```dart
class Cup {
  Cup(this.cups, {this.exactMl});

  final int cups;
  final int? exactMl;

  double get _liters => (exactMl ?? cups * 200) / 1000;
  String get label => '${_liters}L';
}

void main() {
  print(Cup(3).label);
  print(Cup(3, exactMl: 750).label);
}
```

- `_liters`: 이름이 `_`로 시작하면 **이 파일 안에서만** 쓰는 이름이에요. 다른 파일에서는 보이지 않아요. 그 외에는 보통 getter와 같아요.
- `(exactMl ?? cups * 200) / 1000`: 괄호 안부터 계산해요. 정밀한 값(`exactMl`)이 있으면 그걸, 없으면 `cups * 200`을 쓴 뒤 1000으로 나눠요.

**예상 출력**

```text
0.6L
0.75L
```

### 확인 질문

1. `Duration(seconds: 200)`의 `inMinutes`와 `inSeconds % 60`을 예측해 보세요.
2. `final t = 0; print(t > 0 ? '기록' : '기록 없음');`의 출력을 예측하고, 0일 때 따로 표시하는 이유를 말해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [DateTime으로 날짜 표현하기](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [Duration과 분·초 표시](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [평균 속도의 단위](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [페이스와 round](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [삼항 연산자와 두 자리 표시](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [밀리초가 있으면 우선 사용하기](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 기록 계산 모델](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week10/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. 먼저 그날 파일 맨 위 "오늘의 강의"에 적힌 README 섹션을 읽어요. 날짜마다 1단계(예제 따라 하기) → 2단계(직접 작성) → 3단계(Runnery 코드 읽기) 문제가 있고, 단계마다 문제 바로 아래에 코드를 쓰는 자리가 있어요. 한 단계의 결과가 예상과 같으면 다음 단계로 넘어가요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

5km/1800초를 10km/h·360초/km로 계산하고 0 처리와 단위를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RunningRecord의 averageSpeed, paceSeconds, paceText`를 [코드 지도](../project-map.md)에서 찾아요. 밀리초가 있을 때 어떤 조건으로 우선하는지 원본과 연습 규칙을 비교해요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
