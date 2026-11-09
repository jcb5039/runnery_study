# 7주차 — Flutter 기본 구조와 위젯

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

[Flutter 기본 구조](../guides/flutter-structure.md)를 함께 읽어요. Widget, child/children, build, BuildContext, extends, @override를 한 번에 외우지 않고 하루 예제에서 하나씩 연결해요.

## 이번 주 처음 만나는 개념

이번 주부터 콘솔 출력 대신 **화면**을 만들어요. Flutter는 화면을 **위젯**이라는 조각으로 쌓아 만드는 도구예요. 지금까지 배운 함수와 이름 있는 입력([3주](../week03/README.md)), 클래스와 객체([5주](../week05/README.md))가 그대로 쓰여요. 긴 설명은 [Flutter 기본 구조](../guides/flutter-structure.md)에 있어요.

### 1. 앱의 시작: main → runApp → 첫 화면 — 1~2일

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HelloPage()));
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('안녕, Flutter')),
    );
  }
}
```

| 종류 | 이 예제의 이름 |
| --- | --- |
| 키워드 | `import`, `void`, `const`, `class`, `extends`, `super`, `return` |
| Flutter가 제공 | `runApp`, `MaterialApp`, `StatelessWidget`, `Widget`, `BuildContext`, `Scaffold`, `Center`, `Text`, 이름이 정해진 메서드 `build` |
| 작성자가 붙인 이름 | `HelloPage` |

**줄과 기호 읽기**

- `import 'package:flutter/material.dart';`: Flutter의 화면 도구를 가져와요. 5주차 `import`와 같아요.
- `runApp(...)`: Flutter가 제공하는 함수예요. 넘겨받은 위젯을 앱의 가장 바깥 화면으로 띄워요.
- `MaterialApp(home: HelloPage())`: 앱 전체의 틀이에요. `home:`은 3주차의 **이름 있는 입력**이고, 첫 화면을 넣는 자리예요.
- **위젯**: 화면의 한 조각을 설명하는 객체예요. `Text('안녕')`은 5주차의 `Dog('초코', 3)`처럼 클래스로 객체를 만드는 코드예요.
- `class HelloPage extends StatelessWidget`: 우리가 만든 화면이에요. `extends StatelessWidget`은 "Flutter의 StatelessWidget이 가진 기본 기능을 물려받는다"는 뜻이에요. Stateless는 "스스로 바꾸는 값(상태)이 없다"는 뜻이에요.
- `const HelloPage({super.key});`: 생성자예요. 지금은 위젯마다 붙이는 정해진 모양으로 받아들이면 돼요.
- `@override`: 물려받은 메서드 `build`를 여기서 **직접 채운다**는 표시예요.
- `Widget build(BuildContext context)`: 이 화면이 어떻게 생겼는지 **위젯을 돌려주는** 메서드예요.
- `const`: 실행 중에 바뀌지 않는 고정 위젯이라는 표시예요. 빼도 화면은 같고, 넣으면 Flutter가 다시 만들지 않고 재사용할 수 있어요.

**build는 누가 호출하나요?**

| 정의 위치 | 호출하는 쪽 | 입력 | 반환 |
| --- | --- | --- | --- |
| `HelloPage` 안의 `build` | 화면을 그릴 때 **Flutter**가 호출해요. 우리 코드에는 `build()`를 호출하는 줄이 없어요. | `context`: 이 위젯이 화면 트리의 어디에 있는지에 대한 정보예요. Flutter가 넣어 줘요. | `Widget`: 여기서는 `Scaffold` |

**실행 순서**: `main` → `runApp` → `MaterialApp` → Flutter가 `HelloPage`의 `build` 호출 → `Scaffold` → `Center` → `Text`

**화면**: 흰 화면 가운데에 **안녕, Flutter**가 보여요.

실습 파일의 `home: showPractice ? const PracticePage() : const ExamplePage()`는 "showPractice가 true면 PracticePage, 아니면 ExamplePage"라는 뜻이에요. 예제와 문제 화면을 바꿔 보여주는 스위치예요. → [1일](../practice_app/lib/week07/day01.dart), [2일](../practice_app/lib/week07/day02.dart)

### 2. 위젯 안에 위젯 넣기: child와 children — 3~5일

```dart
body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      const Text('오늘의 할 일'),
      const SizedBox(height: 8),
      Row(
        children: const [Text('물 마시기'), SizedBox(width: 12), Text('스트레칭')],
      ),
    ],
  ),
),
```

- `child:`는 위젯 **하나**를 넣는 자리이고, `children:`은 위젯 **목록**(4주차 List의 `[ ]`)을 넣는 자리예요.
- `Column`은 children을 **위에서 아래로**, `Row`는 **왼쪽에서 오른쪽으로** 놓아요.
- `Padding`은 자식 주변에 여백을 둬요. `EdgeInsets.all(16)`은 네 방향 모두 16만큼이에요.
- `SizedBox`는 빈 공간(간격)을 만들어요. 글자를 그리는 건 `Text`뿐이고, 나머지 위젯은 **배치**를 맡아요.
- 들여쓰기는 "어느 위젯 안에 어느 위젯이 있는지"를 보여줘요.

```text
Padding
└─ Column
   ├─ Text('오늘의 할 일')
   ├─ SizedBox(height: 8)
   └─ Row
      ├─ Text('물 마시기')
      ├─ SizedBox(width: 12)
      └─ Text('스트레칭')
```

**화면**: 위쪽에 "오늘의 할 일", 그 아래 한 줄에 "물 마시기"와 "스트레칭"이 간격을 두고 나란히 보여요.

→ [3일 Column](../practice_app/lib/week07/day03.dart), [4일 Row](../practice_app/lib/week07/day04.dart), [5일 Padding과 Card](../practice_app/lib/week07/day05.dart)

### 3. 내 위젯을 만들고 값 넘기기 — 6~7일

```dart
class NoteCard extends StatelessWidget {
  final String label;

  const NoteCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(8), child: Text(label)),
    );
  }
}
```

쓰는 쪽: `Column(children: const [NoteCard(label: '물'), NoteCard(label: '산책')])`

- `final String label;`과 `required this.label`: 5주차 생성자와 같아요. 만들 때 받은 값을 이 위젯의 필드에 저장해요.
- `NoteCard(label: '물')`: 이 위젯을 만드는(생성자를 호출하는) 곳이에요. 같은 클래스로 글자가 다른 카드를 여러 개 만들 수 있어요.
- 값이 들어가는 길: 호출의 `'물'` → 생성자의 `this.label` → 필드 `label` → `build` 안의 `Text(label)`

**화면**: 카드 두 개가 위아래로 보이고, 각각 **물**과 **산책**이 적혀 있어요.

이번 주 화면은 값이 바뀌지 않아요. 버튼으로 값을 바꾸는 건 [8주차](../week08/README.md)에서 배워요. → [6일](../practice_app/lib/week07/day06.dart), [7일 복습](../practice_app/lib/week07/day07.dart)

### 확인 질문

1. 1번 예제에서 `'안녕, Flutter'`를 다른 글자로 바꾸고 저장하면 어느 위젯의 글자가 바뀌나요? 우리 코드에 `build`를 호출하는 줄이 없는데 화면이 그려지는 이유는 무엇인가요?
2. `Row` 안에 위젯을 넣을 때는 `child`와 `children` 중 무엇을 쓰고, 왜 그런지 설명해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [main → runApp → MaterialApp → Scaffold](../practice_app/lib/week07/day01.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day01.dart) |
| 2일 | [StatelessWidget과 build](../practice_app/lib/week07/day02.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day02.dart) |
| 3일 | [Column으로 세로 배치](../practice_app/lib/week07/day03.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day03.dart) |
| 4일 | [Row로 가로 배치](../practice_app/lib/week07/day04.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day04.dart) |
| 5일 | [Padding과 Card](../practice_app/lib/week07/day05.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day05.dart) |
| 6일 | [작은 위젯으로 분리하고 값 전달하기](../practice_app/lib/week07/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day06.dart) |
| 7일 | [복습: 정적인 기록 카드](../practice_app/lib/week07/day07.dart) | Flutter 화면 | [해설](../practice_app/lib/week07/answers/day07.dart) |

## 실행

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week07/day01.dart
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

main → runApp → MaterialApp → build → Scaffold → Text를 연결하고 Row·Column의 배치를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`main.dart의 runApp, MaterialApp, home`를 [코드 지도](../project-map.md)에서 찾아요. 큰 파일 전체 대신 앱 시작과 첫 화면 연결만 읽어요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
