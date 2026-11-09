# 5주차 — 클래스와 객체

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

4주차에는 Map으로 이름과 거리를 묶었어요. 이번 주에는 **값을 묶는 모양을 직접 설계하는 방법**인 클래스를 배워요. 클래스는 설계도이고, 객체는 그 설계도로 만든 실물이에요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `class`, `final`, `this`, `get`, `static`, `import`, `as` |
| Dart가 제공 | `dart:math`(수학 도구 묶음), `sqrt`, `int`, `String` |
| 작성자가 붙인 이름 | `Dog`, `name`, `age`, `Box`, `area`, `perimeter`, `Converter`, `square`, 가져온 묶음의 별명 `math` |

### 1. 클래스, 객체, 필드 — 1일

```dart
void main() {
  final myDog = Dog();
  print(myDog.name);
  myDog.name = '보리';
  print(myDog.name);
}

class Dog {
  String name = '초코';
}
```

- `class Dog { ... }`: `Dog`라는 설계도를 정의해요. 클래스 이름은 보통 대문자로 시작해요. 3주차 함수처럼 `main` 아래에 정의해도 돼요.
- `String name = '초코';`: 클래스 안의 변수를 **필드**라고 해요. 이 설계도로 만든 객체마다 하나씩 가져요.
- `Dog()`: 설계도로 **객체를 하나 만들어요**. 함수 호출처럼 이름 뒤에 `()`를 붙여요.
- `myDog.name`: `.`은 "myDog의"라고 읽어요. 그 객체가 가진 필드를 읽거나 바꿔요.

**예상 출력**

```text
초코
보리
```

→ [1일](day01.dart)

### 2. 생성자와 this — 2일, 7일

객체마다 다른 값을 가지게 하려면 만들 때 값을 넣어요.

```dart
void main() {
  final first = Dog('초코', 3);
  final second = Dog('보리', 5);
  print(first.name);
  print(second.age);
}

class Dog {
  final String name;
  final int age;

  Dog(this.name, this.age);
}
```

- `Dog(this.name, this.age);`: 클래스 이름과 같은 이름의 이 줄이 **생성자**예요. 객체를 만들 때 실행돼요.
- `this.name`: "지금 만들어지는 **이 객체의** name"이라는 뜻이에요. 첫 번째 입력은 그 객체의 `name`에, 두 번째 입력은 `age`에 들어가요.
- `final` 필드: 객체를 만든 뒤에는 바꾸지 않아요.

| 만드는 줄 | 담긴 변수 | `name` | `age` |
| --- | --- | --- | --- |
| `Dog('초코', 3)` | `first` | 초코 | 3 |
| `Dog('보리', 5)` | `second` | 보리 | 5 |

**예상 출력**

```text
초코
5
```

같은 설계도로 만들었지만 `first`와 `second`는 서로 다른 값을 가진 별개의 객체예요. 생성자도 3주차처럼 이름으로 받을 수 있어요. `Dog({required this.name, required this.age});`로 정의하면 `Dog(name: '초코', age: 3)`처럼 만들어요. → [2일](day02.dart), [7일](day07.dart)

### 3. 메서드와 getter — 3~4일

```dart
void main() {
  final box = Box(3, 4);
  print(box.area());
  print(box.perimeter);
}

class Box {
  final int width;
  final int height;

  Box(this.width, this.height);

  int area() => width * height;

  int get perimeter => 2 * (width + height);
}
```

- `int area() => ...`: 클래스 안의 함수를 **메서드**라고 해요. 입력이 없어도 자기 객체의 `width`, `height`를 읽어요. 부를 때는 `box.area()`처럼 `()`를 붙여요.
- `int get perimeter => ...`: `get`이 붙은 **getter**예요. 필드처럼 `box.perimeter`로 `()` 없이 읽지만, 읽는 순간 계산해요.

| 이름 | 정의 | 호출 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `area` | `int area() => width * height;` | `box.area()` | 없음(객체의 width·height를 읽음) | 12 |
| `perimeter` | `int get perimeter => ...` | `box.perimeter` | 없음 | 14 |

**예상 출력**

```text
12
14
```

→ [3일](day03.dart), [4일](day04.dart)

### 4. static과 import — 5~6일

```dart
import 'dart:math' as math;

void main() {
  print(Converter.square(5));
  print(math.sqrt(16));
}

class Converter {
  static int square(int n) => n * n;
}
```

- `static`: 객체를 만들지 않고 **클래스 이름으로 바로** 호출하는 메서드예요. `Converter.square(5)`의 앞부분은 클래스 이름이고, `box.area()`의 앞부분은 객체예요.
- `import 'dart:math' as math;`: Dart가 미리 만들어 둔 수학 도구 묶음 `dart:math`를 이 파일로 가져와요. `as math`는 이 파일에서 그 묶음을 부를 이름이에요. `import`는 파일 맨 위에 써요.
- `math.sqrt(16)`: 가져온 묶음 안의 `sqrt`(제곱근) 함수를 호출해요. 나눗셈처럼 결과가 `double`이에요.

**예상 출력**

```text
25
4.0
```

→ [5일](day05.dart), [6일](day06.dart)

### 확인 질문

1. 2번 예제에서 `Dog('보리', 5)`를 `Dog('보리', 7)`로 바꾸면 출력 중 어느 줄이 바뀌나요? `first.name`은 왜 그대로인가요?
2. `box.area()`와 `box.perimeter`는 둘 다 계산을 하는데 왜 하나에만 `()`가 붙는지 자기 말로 설명해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [클래스와 객체](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [생성자와 this](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [객체 안의 함수: 메서드](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [getter로 계산한 값 읽기](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [static 메서드](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [import로 도구 가져오기](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 두 기록의 평균 속도](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week05/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. TODO 영역에 문제를 직접 풀어요. 예상 결과는 파일 안에 공개되어 있어요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

두 객체가 각각 가진 필드를 구분하고 0초일 때 속도 계산을 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RunningRecord 생성자와 distanceKm, movingSeconds`를 [코드 지도](../project-map.md)에서 찾아요. 객체를 만드는 곳에서 어떤 값이 전달되는지 찾아요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
