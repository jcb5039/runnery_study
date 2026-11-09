# 3주차 — 함수와 실행 순서

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

먼저 [함수 안내](../guides/functions.md)를 읽어요. [1~2주 심화 확인](../checkpoint02/README.md)의 반복 종료 이유를 설명할 수 있는지 확인한 뒤 시작하세요. 도움받아 푼 문제는 입력을 바꿔 혼자 다시 풀어봐요.

## 이번 주 처음 만나는 개념

지금까지는 `main()` 안에 코드를 위에서 아래로 썼어요. 이번 주에는 코드 묶음에 **이름을 붙여 두고, 필요할 때 그 이름으로 실행하는 방법**인 함수를 배워요. 더 긴 설명은 [함수 안내](../guides/functions.md)에 있어요.

### 코드 속 이름은 세 종류예요

| 종류 | 뜻 | 이번 주 예 |
| --- | --- | --- |
| 언어가 정한 단어(키워드) | Dart가 뜻을 정해 둔 단어예요. 변수나 함수 이름으로 쓸 수 없어요. | `void`, `return`, `final`, `required` |
| Dart가 미리 만들어 둔 것 | 설치된 Dart에 이미 들어 있어서 만들지 않고 바로 써요. | `print`, `int`, `double`, `String`, `bool` |
| 작성자가 붙인 이름 | 코드를 쓴 사람이 지은 이름이에요. 다른 이름으로 바꿔도 돼요. | `showExample`, `addOne`, 아래 예제의 `sayCheer` |

`main`은 조금 특별해요. Dart는 프로그램을 시작할 때 **`main`이라는 이름의 함수를 찾아서** 실행해요. 그래서 이름은 정해져 있지만, 안의 내용은 우리가 써요.

### 1. 함수 정의와 호출 — 1일

→ 1일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
void main() {
  print('출발');
  sayCheer();
  print('도착');
}

void sayCheer() {
  print('힘내!');
}
```

**줄과 기호 읽기**

- 7~9번째 줄 `void sayCheer() { ... }`이 **함수 정의**예요. "sayCheer라는 이름으로 이런 일을 한다"고 적어 두기만 해요. 이 줄을 읽는 순간에 실행되지는 않아요.
  - `void`: 이 함수는 일을 마친 뒤 **돌려주는 값이 없다**는 표시예요.
  - `sayCheer`: 예제를 쓴 사람이 붙인 이름이에요. Dart에 원래 있는 명령어가 아니에요.
  - `()`: 함수가 받을 입력을 적는 자리예요. 비어 있으면 **입력이 없다**는 뜻이에요.
  - `{ }`: 함수가 실행될 때 할 일을 담는 묶음이에요.
- 3번째 줄 `sayCheer();`가 **함수 호출**이에요. "지금 sayCheer를 실행해"라는 뜻이에요.
  - 이름 뒤의 `()`가 "지금 실행해"라는 표시예요. `()`를 빼면 함수를 가리키기만 하고 실행하지 않아요. 이 차이는 8주차 버튼에서 다시 만나요.
  - `;`: 명령 하나가 끝났다는 표시예요. `print('출발');`의 `;`와 같아요.
- `print('출발')`도 사실 함수 호출이에요. Dart가 미리 만들어 둔 `print` 함수에 `'출발'`을 입력으로 넘기는 거예요. 그래서 `print`는 정의를 쓰지 않고 바로 호출해요.

**실행 순서**

1. `main`에서 시작해 `print('출발')`을 실행해요.
2. `sayCheer();`를 만나면 아래 정의로 가서 `print('힘내!')`를 실행해요.
3. 함수의 닫는 `}`에 닿으면 호출했던 줄 다음으로 돌아와 `print('도착')`을 실행해요.

| 정의 위치 | 호출 위치 | 입력값 | 반환값 |
| --- | --- | --- | --- |
| 7~9번째 줄 | `main` 안 3번째 줄 | 없음 | 없음 (`void`) |

**예상 출력**

```text
출발
힘내!
도착
```

**함수 안에서 다른 함수 부르기** (1일 3단계, 7일)

```dart
void main() {
  morning();
  print('출근');
}

void morning() {
  wakeUp();
  print('세수');
}

void wakeUp() {
  print('기상');
}
```

- `main`이 `morning()`을 부르고, `morning`이 다시 `wakeUp()`을 불러요. 함수 안에서도 다른 함수를 호출할 수 있어요.
- 어느 함수든 끝(`}`)에 닿으면 **자기를 부른 자리**로 돌아가요. `wakeUp`이 끝나면 `morning`으로, `morning`이 끝나면 `main`으로 돌아가요.
- 정의가 파일의 위에 있든 아래에 있든 상관없어요. 실행 순서는 **호출한 순서**로 정해져요.
- 함수 안에서 **자기 자신**을 부르면 끝없이 반복되다가 `Stack Overflow` 오류로 멈춰요. 부르는 함수와 불리는 함수는 따로 만들어요.

**예상 출력**

```text
기상
세수
출근
```

실습 파일의 `main`에 있는 `step1(); step2(); step3();`도 같은 원리예요. 파일 아래쪽의 단계 함수를 차례로 호출해요.

[1일 실습](day01.dart)의 `showExample`도 `sayCheer`와 같아요. `showExample`은 예제 작성자가 붙인 함수 이름이고, 파일 아래쪽 `void showExample() {`가 정의예요. `main` 안의 `showExample();`은 그 함수를 실행하는 호출이에요.

### 2. 입력을 받고 값을 돌려주는 함수 — 2~4일

→ 2·3·4일 문제는 이 섹션만 읽고 풀 수 있어요. 날짜별로 필요한 내용은 아래 "2일·3일·4일 문제에 필요한 것"에 따로 정리했어요.

```dart
void main() {
  final total = addKm(2, 3);
  print(total);
  print(addKm(10, 1));
}

int addKm(int first, int second) {
  return first + second;
}
```

**줄과 기호 읽기**

- `int addKm(int first, int second)`
  - 맨 앞 `int`: 이 함수가 **정수 하나를 돌려준다**는 표시예요(반환 타입). 1번 예제의 `void` 자리에 들어가요.
  - `(int first, int second)`: 입력을 받을 변수 두 개예요(매개변수). 호출할 때 넣은 값이 **순서대로** 들어가요.
- `return first + second;`: 계산한 값을 **호출한 자리로 돌려주고** 함수를 끝내요. `return`은 키워드예요.
- `final total = addKm(2, 3);`: 함수가 돌려준 값을 `total`에 담아요. `final`은 `var`처럼 변수를 만들지만, 한 번 담은 뒤에는 다시 대입할 수 없어요.
- `print(addKm(10, 1))`: 돌려받은 값을 변수에 담지 않고 바로 `print`에 넘겨요.

| 호출 | `first` | `second` | 돌려주는 값 | 쓰이는 곳 |
| --- | --- | --- | --- | --- |
| `addKm(2, 3)` | 2 | 3 | 5 | `total`에 저장 |
| `addKm(10, 1)` | 10 | 1 | 11 | 바로 출력 |

**예상 출력**

```text
5
11
```

- `return`은 값을 **돌려주기만** 해요. 화면에 보여주는 건 `print`예요. `return`만 있고 `print`가 없으면 아무것도 출력되지 않아요. → [2일 실습](day02.dart)
- `/`로 나누면 결과가 소수(`double`)가 돼요. `7 / 2`는 `3.5`예요. 그래서 나눗셈 결과를 돌려주는 함수의 반환 타입은 `double`이에요. → [3일 실습](day03.dart)
- 함수 안에서 `return`을 만나면 그 아래 줄은 실행하지 않고 바로 끝나요. `if`와 함께 쓰면 조건마다 다른 값을 돌려줄 수 있어요. → [4일 실습](day04.dart)

**2일 문제에 필요한 것: 입력은 있고 반환은 없는 함수**

```dart
void main() {
  printHalf(10);
  final half = returnHalf(10);
  print(half + 1);
  returnHalf(50);
}

void printHalf(int n) {
  print(n ~/ 2);
}

int returnHalf(int n) {
  return n ~/ 2;
}
```

- `printHalf`는 입력 `n`을 받지만 반환 타입이 `void`예요. 계산한 값을 **화면에 출력만** 하고 돌려주지는 않아요.
- `returnHalf`는 값을 **돌려주기만** 해요. 그래서 `final half = ...`처럼 받아서 `half + 1` 같은 계산을 더 할 수 있어요.
- 마지막 줄 `returnHalf(50);`은 25를 돌려받지만 아무도 받아서 출력하지 않아요. 그래서 **화면에는 아무것도 안 나와요**.

**예상 출력**

```text
5
6
```

**3일 문제에 필요한 것: 소수(double) 입력과 출력**

```dart
void main() {
  print(litersToCups(1.0));
  print(litersToCups(0.5));
}

double litersToCups(double liters) {
  return liters / 0.25;
}
```

- `double liters`: 소수를 입력으로 받아요. `1.0`처럼 소수점이 있는 숫자가 double이에요.
- double을 나누면 결과도 double이에요. 딱 떨어져도 `4`가 아니라 **`4.0`**으로 출력돼요.

**예상 출력**

```text
4.0
2.0
```

**4일 문제에 필요한 것: `if (조건) return 값;`과 글자를 돌려주는 함수**

```dart
void main() {
  print(sizeName(80));
  print(sizeName(120));
  print(evenOrOdd(7));
}

String sizeName(int cm) {
  if (cm < 100) return '작음';
  return '큼';
}

String evenOrOdd(int n) {
  if (n % 2 == 0) return '짝수';
  return '홀수';
}
```

- `if (조건) return 값;`: 할 일이 `return` 한 줄이면 `{ }` 없이 한 줄로 써도 돼요. 조건이 참이면 거기서 함수가 끝나요.
- 조건이 거짓이면 다음 줄로 내려가서 아래 `return`이 실행돼요. 두 `return` 중 **하나만** 실행돼요.
- 반환 타입 `String`: `'작음'` 같은 글자를 돌려줘요.
- `%`는 1주차에 배운 **나머지**예요. `n % 2 == 0`은 2로 나눈 나머지가 0, 곧 짝수인지 묻는 조건이에요.

**예상 출력**

```text
작음
큼
홀수
```

### 3. 이름으로 값을 넘기기 — 5일

→ 5일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
void main() {
  print(introduce(name: '하나', age: 20));
  print(introduce(age: 31, name: '두리'));
}

String introduce({required String name, required int age}) {
  return '$name($age살)';
}
```

- 정의의 `({ ... })`: 괄호 안의 중괄호는 **이름으로 받는 입력**이라는 표시예요. 함수 몸통을 감싸는 `{ }`와 모양은 같지만 역할이 달라요.
- `required`: 이 입력은 호출할 때 **반드시** 넣어야 한다는 키워드예요. 빼먹으면 실행 전에 빨간 오류가 나요.
- 호출의 `name: '하나'`: "name 자리에 '하나'를 넣어"라는 뜻이에요. 이름으로 연결되기 때문에 두 번째 줄처럼 순서를 바꿔도 같은 자리에 들어가요.
- 반환 타입 `String`: 문자열을 돌려줘요.

**예상 출력**

```text
하나(20살)
두리(31살)
```

**5일 3단계에 필요한 것: 입력이 많은 함수**

```dart
void main() {
  print(boxVolume(width: 2, height: 3, depth: 4));
}

double boxVolume({
  required double width,
  required double height,
  required double depth,
}) {
  if (width <= 0) return 0;
  var result = width * height;
  result = result * depth;
  return result;
}
```

- 입력이 많으면 `({`와 `})` 사이를 한 줄에 하나씩 적어요. 각 줄 끝의 `,`는 그냥 줄을 나누는 쉼표예요.
- `double` 자리에 `2`처럼 정수를 넣어도 돼요. 함수 안에서는 `2.0`으로 쓰여요. 그래서 결과도 `24.0`이에요.
- 함수 안에서도 `var`로 변수를 만들고 값을 바꿀 수 있어요. 이 변수는 함수 안에서만 쓸 수 있어요.

**예상 출력**

```text
24.0
```

→ [5일 실습](day05.dart)

### 4. 한 줄로 쓰는 함수 `=>` — 6일

→ 6일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
void main() {
  print(triple(4));
  print(tripleShort(4));
}

int triple(int number) {
  return number * 3;
}

int tripleShort(int number) => number * 3;
```

- `=>` 뒤에 계산식 **하나**를 쓰면 그 결과를 돌려줘요. `{ return 식; }`을 줄여 쓴 모양이라서 `return`을 따로 쓰지 않아요.
- 할 일이 한 줄짜리 계산일 때만 써요. 여러 줄이 필요하면 `{ }`를 써요.

**예상 출력**

```text
12
12
```

**6일 3단계에 필요한 것: 숫자를 화면용 글자로 바꾸기**

```dart
void main() {
  print(priceText(3.14159));
  print(priceText(2));
  print(roundText(7.6));
}

String priceText(double won) => won.toStringAsFixed(1);

String roundText(double n) {
  return n.round().toString();
}
```

- `toStringAsFixed(1)`: 숫자를 **소수 첫째 자리까지 맞춘 글자**로 바꿔요. 괄호 안 숫자가 자릿수예요. `2`는 `'2.0'`, `(2)`로 쓰면 `'2.00'`처럼 0을 채워요.
- `round()`: 가장 가까운 정수로 **반올림**해요. 7.6은 8이 돼요.
- `toString()`: 숫자를 **글자(String)**로 바꿔요. 반환 타입이 `String`이라서 마지막에 글자로 바꿔 돌려줘요.
- `.`으로 이어 쓰면 왼쪽부터 차례로 적용돼요. `n.round().toString()`은 반올림한 다음 글자로 바꿔요.

**예상 출력**

```text
3.1
2.0
8
```

→ [6일 실습](day06.dart), 7일에는 예제 없이 [복습](day07.dart)해요.

**7일 복습**은 1~4번 섹션으로 풀어요. 3단계 `clock`은 1번의 "함수 안에서 다른 함수 부르기"와 4일의 `if (조건) return 값;` 모양이에요. `~/`(몫)와 `%`(나머지)는 1주차에 배웠어요. `125 ~/ 60`은 2, `125 % 60`은 5예요.

### 확인 질문

1. 아래 코드를 실행하기 전에 출력을 종이에 적고, 새 파일에 붙여 실행해서 비교해 보세요.

   ```dart
   void main() {
     print('A');
     final result = plusTen(5);
     print('B');
     print(result);
   }

   int plusTen(int n) {
     print('계산 중');
     return n + 10;
   }
   ```

2. `showExample`과 `print`는 둘 다 함수예요. 하나는 정의가 파일 안에 있고 하나는 없어요. 왜 그런지 자기 말로 설명해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [함수 정의와 호출](day01.dart) | Dart 콘솔 | [해설](answers/day01.dart) |
| 2일 | [print와 return](day02.dart) | Dart 콘솔 | [해설](answers/day02.dart) |
| 3일 | [단위를 바꾸는 함수](day03.dart) | Dart 콘솔 | [해설](answers/day03.dart) |
| 4일 | [두 입력과 조건부 반환](day04.dart) | Dart 콘솔 | [해설](answers/day04.dart) |
| 5일 | [이름 있는 매개변수](day05.dart) | Dart 콘솔 | [해설](answers/day05.dart) |
| 6일 | [한 줄 함수와 일반 함수](day06.dart) | Dart 콘솔 | [해설](answers/day06.dart) |
| 7일 | [복습: 계산을 함수로 나누기](day07.dart) | Dart 콘솔 | [해설](answers/day07.dart) |

## 실행

Dart 파일은 학습 폴더에서 실행해요.

```bash
cd ~/src/runnery-study
dart run week03/day01.dart
```

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. 먼저 그날 파일 맨 위 "오늘의 강의"에 적힌 README 섹션을 읽어요. 날짜마다 1단계(예제 따라 하기) → 2단계(직접 작성) → 3단계(Runnery 코드 읽기) 문제가 있고, 단계마다 문제 바로 아래에 코드를 쓰는 자리가 있어요. 한 단계의 결과가 예상과 같으면 다음 단계로 넘어가요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

정의·호출·입력·반환을 가리키고, 1500m와 3200m의 결과를 실행 전에 예측한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`RunningCalc.hetbahnCount`를 [코드 지도](../project-map.md)에서 찾아요. 나눗셈에 들어가는 값과 반환값만 읽어요. static은 5주에 다시 연결해요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
