# Flutter 기본 구조를 처음 읽을 때

7주차에 읽어요. 먼저 [실습 앱 실행 방법](../practice_app/README.md)을 확인하세요. Flutter 화면은 `flutter run`으로 실행해요.

## 짧은 실행 예제

아래 모양을 실행하는 파일은 [7주 1일](../practice_app/lib/week07/day01.dart)이에요. 그 파일에는 예제와 직접 풀 공간이 함께 있어요.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('달리기')),
        body: const Center(child: Text('3km')),
      ),
    ),
  );
}
```

실행하면 위에는 **달리기**, 가운데에는 **3km**가 보여요. 이 예제는 전체 파일로도 실행할 수 있는 최소 형태예요.

1. `import`는 Flutter의 화면 도구를 가져와요.
2. `main()`에서 실행을 시작해요.
3. `runApp(...)`에 앱의 가장 바깥 위젯을 전달해요.
4. `MaterialApp(...)`이 테마와 화면 이동 등에 필요한 앱의 틀을 제공해요.
5. `home:`에 첫 화면을 넣어요.
6. `Scaffold(...)`가 제목 영역과 본문을 배치할 화면 뼈대를 만들어요.
7. `AppBar(...)`는 위쪽 제목 영역이에요.
8. `body:`는 본문, `Center`는 가운데 배치, `Text`는 글자 표시예요.

들여쓰기는 어떤 위젯 안에 다른 위젯이 있는지 보여줘요.

```text
MaterialApp
└─ Scaffold
   ├─ appBar: AppBar → Text('달리기')
   └─ body: Center → Text('3km')
```

직접 실습: [7주 1일](../practice_app/lib/week07/day01.dart)의 `PracticePage`를 작성해서 제목을 **나의 달리기**, 본문을 **오늘 3km**로 만드세요. 실행 전에 어느 줄이 화면의 어느 부분을 바꿀지 말해보세요.

## build는 화면의 모양을 반환해요

[7주 2일](../practice_app/lib/week07/day02.dart)에서 이 부분을 읽어요.

```dart
class RunPage extends StatelessWidget {
  const RunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('3km');
  }
}
```

`class`는 앞 주에 배운 클래스예요. `extends StatelessWidget`은 Flutter의 기본 화면 구성 역할을 이어받고, `@override`는 정해진 `build`를 여기서 구현한다는 표시예요. `build`는 숫자 대신 `Widget`을 반환해요. Flutter가 필요할 때 호출하므로 우리가 직접 반복 호출할 필요가 없어요.

`BuildContext`는 위젯 트리에서 이 위젯이 있는 위치와 관련된 정보를 이용하게 해줘요. 나중에 `Navigator.of(context)`로 화면 이동 도구를 찾을 때 연결하세요.

`const`는 만들 때 값이 정해지는 상수 구성을 나타내요. `super.key`는 위젯을 구분하는 선택 입력을 부모 쪽으로 전달해요. 처음에는 생성자의 이 모양을 사용하고, 변하는 상태는 8주차에서 다뤄요.

## 자식 하나와 자식 목록

| 이름 | 값의 모양 | 예 |
| --- | --- | --- |
| `child` | 위젯 하나 | `Center(child: Text('3km'))` |
| `children` | 위젯 목록 | `Column(children: [Text('민수'), Text('3km')])` |
| `body` | Scaffold 본문 위젯 하나 | `Scaffold(body: Column(...))` |

`Column`은 세로, `Row`는 가로 배치를 해요. `Padding`은 자식 주변 여백, `SizedBox`는 크기나 간격을 만들 때 사용해요. [7주 3~5일](../week07/README.md)에서 각각 실행해요.

## 프로젝트 파일은 이렇게 읽어요

| 위치 | 역할 |
| --- | --- |
| `practice_app/pubspec.yaml` | 앱 이름, 사용할 패키지, Flutter 설정 |
| `practice_app/lib/main.dart` | 기본 실행 안내 화면 |
| `practice_app/lib/week07/day01.dart` 등 | `-t`로 선택해서 실행하는 그날의 시작 파일 |
| 각 주의 `answers/` | 별도 해설. 문제를 먼저 풀고 확인 |
| `practice_app/web/` | 브라우저에서 앱을 띄우는 바깥 파일 |
| `.dart_tool/`, `build/` | 도구가 만든 임시·빌드 결과 |

위젯으로 화면을 구성하고 상태 변화에 따라 다시 구성한다는 관점은 [Flutter 공식 UI 안내](https://docs.flutter.dev/ui)에서 더 읽을 수 있어요. 이 실습은 설치된 Flutter SDK의 `package:flutter/material.dart`를 사용해요.

다음으로 넘어가기 전: **숫자를 바꾸는 줄과 글자를 배치하는 줄을 구분하고, main부터 Text까지 설명할 수 있나요?**
