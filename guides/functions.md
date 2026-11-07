# 함수는 어디서 값을 받나

이 설명은 3주차에 읽습니다. 아래 코드를 새 `function_practice.dart` 파일에 직접 입력하고 `dart run function_practice.dart`로 실행하세요.

```dart
void main() {
  final answer = addOne(4);
  print(answer);
}

int addOne(int number) {
  return number + 1;
}
```

출력은 `5`입니다. 파일에 적힌 모든 줄이 위에서부터 무조건 실행되는 것은 아닙니다. 실행은 `main()` 안에서 시작하고, 다른 함수는 호출할 때 실행됩니다. 함수 정의를 `main` 아래에 써도 호출할 수 있습니다.

실행 순서:

1. `main()` 안에서 `addOne(4)`를 만납니다.
2. `addOne`으로 이동합니다. 전달한 `4`를 함수 안에서 `number`라고 부릅니다.
3. `number + 1`을 계산하면 `5`입니다.
4. `return`이 `5`를 호출한 곳으로 돌려줍니다.
5. `answer`에 `5`가 저장됩니다.
6. `print(answer)`가 화면에 `5`를 보여줍니다.

`return`만 쓴다고 콘솔에 숫자가 나타나지는 않습니다. 출력하는 역할은 `print`가 맡습니다.

## 바꿔보기

`addOne(4)`의 4를 10으로 바꿉니다. 결과가 11이 되는지 확인하세요. 값을 바꾸는 위치는 호출하는 괄호 안입니다.

## 직접 만들어보기

이번에는 `doubleNumber` 함수를 새로 만드세요.

- 함수 정의 위치: `main`의 닫는 `}` 아래.
- 전달받는 값: `int number`.
- 반환 타입: `int`.
- 해야 할 일: 전달받은 수의 2배를 `return`.
- 호출 위치: `main`의 `{ }` 안.
- 호출 코드: `final doubled = doubleNumber(6);` 다음에 `print(doubled);`.
- 예상 출력: `12`.

6을 3으로 바꾸었을 때 함수의 어느 변수에 3이 들어가는지 말해보세요. 그 설명이 되면 함수의 첫 단계를 이해한 것입니다.

[Dart 공식 함수 설명](https://dart.dev/language/functions)은 이 과정을 익힌 뒤 이름 있는 매개변수를 찾아볼 때 참고하세요.
