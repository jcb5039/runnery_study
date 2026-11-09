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

→ 1일 문제는 이 섹션만 읽고 풀 수 있어요.

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

**1일 3단계에 필요한 것: 객체마다 필드를 따로 가져요**

```dart
void main() {
  final a = Dog();
  final b = Dog();
  b.name = '보리';
  print(a.name);
  print(b.name);
}

class Dog {
  String name = '초코';
}
```

- `Dog()`를 두 번 부르면 객체가 **두 개** 생겨요. 같은 설계도로 만들었어도 서로 다른 실물이에요.
- `b.name`을 바꾸면 `b`의 필드만 바뀌어요. `a`는 처음 값 `'초코'` 그대로예요.

**예상 출력**

```text
초코
보리
```

→ [1일](day01.dart)

### 2. 생성자와 this — 2일, 7일

→ 2일 문제는 이 섹션만 읽고 풀 수 있어요. 7일 복습은 1~4번 섹션을 함께 써요.

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

**2일 3단계에 필요한 것: 이름 있는 생성자와 기본값**

```dart
void main() {
  final a = Cat(name: '나비');
  final b = Cat(name: '치즈', color: '노랑');
  print(a.color);
  print(b.color);
}

class Cat {
  Cat({required this.name, this.color = '회색'});

  final String name;
  final String color;
}
```

- `{ }` 안에 쓰면 **이름으로 받는** 생성자예요. `required`가 붙은 `name`은 꼭 넣어야 해요. 빼면 실행 전에 빨간 오류가 나요.
- `this.color = '회색'`: 넣지 않으면 쓰는 **기본값**이에요. 그래서 `required`가 없어요.
- 필드를 생성자 **아래**에 적어도 돼요. Runnery는 이 순서로 써요.
- 빈 글자 `''`를 출력하면 아무것도 안 보여요. 그래서 실습에서는 `'[$값]'`처럼 감싸서 비었는지 확인해요.

**예상 출력**

```text
회색
노랑
```

**7일 복습에 필요한 것: 객체 목록 돌기**

```dart
void main() {
  final cats = [Cat('나비', 3), Cat('치즈', 5)];
  for (final cat in cats) {
    print(cat.name);
  }
  print(cats.fold<int>(0, (sum, c) => sum + c.age));
}

class Cat {
  final String name;
  final int age;
  Cat(this.name, this.age);
}
```

- 목록에 객체를 담을 수 있어요. `for-in`의 `cat`, `fold`의 `c`에는 **객체 하나**가 차례로 들어와요.
- 그래서 `cat.name`, `c.age`처럼 `.`으로 그 객체의 필드를 읽어요. `fold`는 4주차에 배웠어요.

**예상 출력**

```text
나비
치즈
8
```

### 3. 메서드와 getter — 3~4일

→ 3·4일 문제는 이 섹션만 읽고 풀 수 있어요.

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

**3일 3단계에 필요한 것: Map을 돌려주는 메서드**

```dart
void main() {
  final cat = Cat('나비', 3);
  print(cat.toMap());
  print(cat.toMap()['age']);
}

class Cat {
  final String name;
  final int age;
  Cat(this.name, this.age);

  Map<String, Object> toMap() => {'name': name, 'age': age};
}
```

- 메서드도 Map을 돌려줄 수 있어요(4주차 3일). 입력이 없어도 **자기 객체의 필드**를 읽어서 Map에 담아요.
- 돌려받은 Map에 바로 `['age']`를 붙여 값을 꺼낼 수 있어요. 왼쪽부터 차례로 실행돼요.

**예상 출력**

```text
{name: 나비, age: 3}
3
```

**4일 문제에 필요한 것: 여러 줄짜리 getter**

```dart
void main() {
  print(Score(170, 2).average);
  print(Score(0, 0).average);
}

class Score {
  final int total;
  final int count;
  Score(this.total, this.count);

  int get average {
    if (count <= 0) return 0;
    return (total / count).round();
  }
}
```

- getter도 `=>` 대신 `{ }`와 `return`으로 여러 줄을 쓸 수 있어요. `get` 뒤에는 `()`가 없어요.
- `if (count <= 0) return 0;`: 0으로 나누기 전에 먼저 끝내요(3주차 4일).
- `(total / count).round()`: 나눈 결과(85.0)를 반올림해 정수로 만들어요. 그래서 반환 타입이 `int`예요.

**예상 출력**

```text
85
0
```

→ [3일](day03.dart), [4일](day04.dart)

### 4. static과 import — 5~6일

→ 5·6일 문제는 이 섹션만 읽고 풀 수 있어요.

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

**5일 3단계에 필요한 것: static const 값**

```dart
void main() {
  print(Price.tax);
  print(Shop.withTax(1000));
}

class Price {
  static const tax = 0.1;
}

class Shop {
  static double withTax(int won) => won + won * Price.tax;
}
```

- `static const tax = 0.1;`: 객체 없이 `Price.tax`로 읽는 **바뀌지 않는 값**이에요. 앱 전체에서 같이 쓰는 설정값을 이렇게 둬요.
- `Shop.withTax` 안에서 다른 클래스의 값 `Price.tax`를 읽어요. 둘 다 static이라 객체를 만드는 줄이 없어요.

**예상 출력**

```text
0.1
1100.0
```

**6일 문제에 필요한 것: math.min, math.max**

```dart
import 'dart:math' as math;

void main() {
  print(math.min(9, 4));
  print(math.max(2.5, 1.5));
  print([3, 8, 5].fold<int>(0, (best, n) => math.max(best, n)));
}
```

- `math.min(a, b)`는 작은 값, `math.max(a, b)`는 큰 값을 돌려줘요. 소수에도 쓸 수 있어요.
- 마지막 줄은 4주차의 `fold`에 `math.max`를 넣었어요. 지금까지 가장 큰 값(`best`)과 이번 값 중 큰 쪽을 계속 남겨서 **목록의 최댓값**을 구해요.
- 맨 위 `import` 줄을 지우면 `math`라는 이름을 몰라서 실행 전에 빨간 오류가 나요.

**예상 출력**

```text
4
2.5
8
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
3. 먼저 그날 파일 맨 위 "오늘의 강의"에 적힌 README 섹션을 읽어요. 날짜마다 1단계(예제 따라 하기) → 2단계(직접 작성) → 3단계(Runnery 코드 읽기) 문제가 있고, 단계마다 문제 바로 아래에 코드를 쓰는 자리가 있어요. 한 단계의 결과가 예상과 같으면 다음 단계로 넘어가요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

두 객체가 각각 가진 필드를 구분하고 0초일 때 속도 계산을 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RunningRecord 생성자와 distanceKm, movingSeconds`를 [코드 지도](../project-map.md)에서 찾아요. 객체를 만드는 곳에서 어떤 값이 전달되는지 찾아요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
