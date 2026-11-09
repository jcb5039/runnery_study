# 9주차 — 화면 이동과 전달값

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

화면 사이를 오가는 방법을 배워요. 다음 화면에 값을 넘기는 방법과, 화면을 닫으면서 값을 돌려받는 방법도 배워요. 7주차의 생성자 값 전달과 8주차의 콜백·`mounted`를 그대로 써요.

| 종류 | 이번 주 예 |
| --- | --- |
| Flutter가 제공 | `Navigator`, `push`, `pop`, `pushReplacement`, `MaterialPageRoute`, `builder`, `ListTile`, `onTap` |
| 작성자가 붙인 이름 | `HelpPage`, `ScorePage`, `score`, `FruitPage`, `pickFruit`, `fruit`, `MainPage` |

### 1. 화면 쌓기: push와 pop — 1일

Flutter는 열린 화면을 **접시처럼 위로 쌓아요**. 맨 위 접시가 지금 보이는 화면이에요.

```dart
ElevatedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (context) => const HelpPage()),
    );
  },
  child: const Text('도움말'),
)
```

- `Navigator`: Flutter가 제공하는, 화면 쌓기를 관리하는 도구예요. `Navigator.of(context)`는 7주차의 `context`(이 위젯의 위치 정보)로 가장 가까운 Navigator를 찾아요.
- `.push(...)`: 새 화면을 맨 위에 올려요.
- `MaterialPageRoute`: 화면 하나를 이동 경로로 감싸요. 전환 애니메이션도 들어 있어요. `<void>`는 이 화면이 닫힐 때 돌려줄 값이 없다는 뜻이에요.
- `builder: (context) => const HelpPage()`: 이름 없는 함수예요. 버튼을 누른 그때 Flutter가 호출해서 새 화면 위젯을 받아 가요.
- 새 화면에 `AppBar`가 있으면 왼쪽 위에 뒤로 가기 버튼이 자동으로 생겨요. 누르면 맨 위 화면을 꺼내는 `pop`이 일어나요. 코드로 닫을 때는 `Navigator.pop(context)`를 호출해요.

```text
처음        push 뒤        pop 뒤
           [HelpPage]
[MyPage]   [MyPage]       [MyPage]
```

**화면**: 도움말을 누르면 HelpPage가 위에 보여요. 뒤로 가기를 누르면 원래 화면이 그대로 있어요. → [1일](../practice_app/lib/week09/day01.dart)

### 2. 생성자로 값 넘기기 — 2~3일, 6일

```dart
class ScorePage extends StatelessWidget {
  final int score;

  const ScorePage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('점수')),
      body: Center(child: Text('$score점')),
    );
  }
}
```

여는 쪽: `MaterialPageRoute<void>(builder: (context) => const ScorePage(score: 90))`

- 7주차 6일과 같은 방식이에요. 다음 화면이 받을 값을 **필드와 생성자**로 정하고, 여는 쪽이 생성자에 값을 넣어요.
- 값의 길: `ScorePage(score: 90)` → `this.score` → 필드 `score` → `Text('$score점')`
- 목록에서 고를 때는 항목마다 다른 값을 넣어요. `ListTile`은 Flutter가 제공하는 목록 한 줄이고, `onTap`은 그 줄을 눌렀을 때 실행할 콜백이에요. 누른 줄의 값을 생성자에 넘기면 돼요. → [3일](../practice_app/lib/week09/day03.dart)
- 값이 여러 개면 5주차의 클래스 객체 하나로 묶어서 넘길 수 있어요. → [6일](../practice_app/lib/week09/day06.dart)

**화면**: 새 화면 제목은 "점수", 가운데에는 "90점"이 보여요. → [2일](../practice_app/lib/week09/day02.dart)

### 3. 닫으면서 값 돌려받기 — 4일

State 안의 메서드예요. `message`는 State의 필드예요.

```dart
Future<void> pickFruit() async {
  final fruit = await Navigator.of(context).push<String>(
    MaterialPageRoute<String>(builder: (context) => const FruitPage()),
  );
  if (!mounted) return;
  setState(() {
    message = fruit ?? '선택 안 함';
  });
}
```

`FruitPage` 안의 버튼: `onPressed: () => Navigator.pop(context, '사과')`

- `push<String>`: 다음 화면이 닫힐 때 **String 하나를 돌려받겠다**는 뜻이에요. `await`로 그 화면이 닫힐 때까지 기다려요(6주차).
- `Navigator.pop(context, '사과')`: 화면을 닫으면서 `'사과'`를 돌려줘요. 함수의 `return`과 비슷해요.
- 뒤로 가기로 그냥 닫으면 돌려받는 값이 `null`이에요. 그래서 `?? '선택 안 함'`으로 처리해요(6주차).
- 기다리는 동안 화면이 사라졌을 수 있어서 `mounted`를 확인해요(8주차).

**화면**: 사과 버튼으로 닫으면 원래 화면에 `사과`가, 뒤로 가기로 닫으면 `선택 안 함`이 보여요. → [4일](../practice_app/lib/week09/day04.dart)

### 4. 맨 위 화면 바꾸기: pushReplacement — 5일

```dart
Navigator.of(context).pushReplacement(
  MaterialPageRoute<void>(builder: (context) => const MainPage()),
);
```

- 맨 위 화면을 **새 화면으로 바꿔요**. 이전 화면이 아래에 남지 않아서 뒤로 가기로 돌아갈 수 없어요.
- 시작 안내나 로그인처럼, 끝난 뒤 다시 보여줄 필요가 없는 화면에 써요.

```text
push 뒤         pushReplacement 뒤
[MainPage]
[Intro]         [MainPage]
```

**화면**: MainPage로 바뀌고, AppBar에 뒤로 가기 버튼이 없어요. → [5일](../practice_app/lib/week09/day05.dart), 7일은 [복습](../practice_app/lib/week09/day07.dart)이에요.

### 확인 질문

1. 화면 A에서 B를 push하고, B에서 C로 pushReplacement했어요. C에서 뒤로 가기를 누르면 어느 화면이 보일까요?
2. 2번 예제에서 `90`이 화면에 나타나기까지 거치는 곳을 순서대로 말해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [push로 새 화면 열기](../practice_app/lib/week09/day01.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day01.dart) |
| 2일 | [생성자로 상세 화면에 값 전달](../practice_app/lib/week09/day02.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day02.dart) |
| 3일 | [목록에서 선택한 값 전달](../practice_app/lib/week09/day03.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day03.dart) |
| 4일 | [pop으로 결과 돌려받기](../practice_app/lib/week09/day04.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day04.dart) |
| 5일 | [pushReplacement로 현재 화면 교체](../practice_app/lib/week09/day05.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day05.dart) |
| 6일 | [같은 기록 객체를 상세 화면에 전달](../practice_app/lib/week09/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day06.dart) |
| 7일 | [복습: 목록과 상세 이동](../practice_app/lib/week09/day07.dart) | Flutter 화면 | [해설](../practice_app/lib/week09/answers/day07.dart) |

## 실행

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week09/day01.dart
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

선택한 항목이 상세 화면 생성자로 전달되는 경로와 pop 결과를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`main.dart → app_start.dart → AuthGate → MainTabs`를 [코드 지도](../project-map.md)에서 찾아요. 로그인 여부에 따른 분기를 포함해 화살표로 그려요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
