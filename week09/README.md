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

→ 1일 문제는 이 섹션만 읽고 풀 수 있어요.

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

**1일 3단계에 필요한 것: 화면 여는 일을 함수 하나로**

```dart
void openPage(BuildContext context, String title) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => TitlePage(title: title)),
  );
}
```

- 클래스 바깥 함수도 `context`를 입력으로 받으면 화면을 열 수 있어요. 버튼에서는 `onPressed: () => openPage(context, '기록')`처럼 불러요.
- `(_)`: `builder`가 넘겨주는 입력을 쓰지 않을 때 이름 대신 `_`를 써요.

### 2. 생성자로 값 넘기기 — 2~3일, 6일

→ 2·3·6일 문제는 이 섹션만 읽고 풀 수 있어요.

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

**3일 3단계에 필요한 것: 목록 개수만큼 위젯 만들기**

```dart
ListView(
  children: [
    for (final r in records)
      ListTile(title: Text('${r.km}km')),
  ],
)
```

- `[ ]` 안에 `for`를 쓰면 records의 항목마다 `ListTile`이 하나씩 들어가요. 2주차 for-in과 같은 생각인데, 목록을 만드는 자리에 쓴 모양이에요.
- 반복마다 `r`이 다르니까, 각 줄의 `onTap`에서 넘기는 `r`도 그 줄의 객체예요.

**6일 3단계에 필요한 것: 넘겨받은 객체의 getter 읽기**

상세 화면은 `record.distanceKm`처럼 필드를, `record.paceLabel`처럼 getter를 읽어요(5주차 4일). `paceLabel` 안의 `padLeft(2, '0')`는 숫자를 두 자리로 채우는 기능이에요(10주차에 배워요). 지금은 "5를 05로 만든다"로 읽어요.

### 3. 닫으면서 값 돌려받기 — 4일

→ 4일 문제는 이 섹션만 읽고 풀 수 있어요.

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

**4일 문제에 필요한 것: 돌려받은 값이 없을 때**

- `weather = result ?? '모름';`: 6주차의 `??`예요. 뒤로 가기로 닫아서 result가 null이면 `'모름'`을 넣어요.
- `if (result == null || !mounted) return;`: 취소했거나(`null`) 화면이 사라졌으면(`!mounted`) 바로 끝내요. `||`는 둘 중 하나만 참이어도 참이에요.

### 4. 맨 위 화면 바꾸기: pushReplacement — 5일

→ 5일 문제는 이 섹션만 읽고 풀 수 있어요. 7일 복습은 1~4번 섹션을 함께 써요.

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

**5일 3단계에 필요한 것: 화면이 생기고 잠시 뒤 스스로 교체하기**

`initState`에서 `_openNextPage();`를 부르면, 기다린 뒤 `if (!mounted) return;`을 확인하고 `pushReplacement`로 자기 자신을 다음 화면으로 바꿔요(8주차 5일과 같은 순서). Runnery 원본의 `PageRouteBuilder`는 넘어가는 애니메이션을 직접 정하는 도구예요. 지금은 `MaterialPageRoute`와 같은 역할로 읽어요.

**7일 3단계에 필요한 것: build에서 화면 고르기**

```dart
Widget build(BuildContext context) {
  if (loggedIn) {
    return const Scaffold(body: Center(child: Text('메인 탭')));
  }
  return const Scaffold(body: Center(child: Text('로그인 화면')));
}
```

화면을 push하지 않고, `build`가 `if`로 둘 중 **하나를 골라 돌려줘요**. 3주차 4일의 `if (조건) return ...;` 모양을 위젯에 쓴 거예요.

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

`stage = 0`으로 예제를 보고, `Step1Page`부터 차례로 푼 뒤 `stage`를 1, 2, 3으로 바꿔요. 저장 후 `R`로 다시 시작해요. 다른 날짜는 `q`로 종료한 뒤 `-t` 경로를 바꿔 실행해요. 해설은 경로에 `answers/`를 넣어 실행해요. 각 파일은 자기 `main()`을 가진 독립 실습이에요.

## 푸는 순서

1. 예제의 출력 또는 화면 변화를 먼저 예측하고 실행해요.
2. 파일의 줄별 설명을 읽고 입력·호출·반환·표시 위치를 찾아요.
3. 먼저 그날 파일 맨 위 "오늘의 강의"에 적힌 README 섹션을 읽어요. 날짜마다 1단계(예제 따라 하기) → 2단계(직접 작성) → 3단계(Runnery 코드 읽기) 문제가 있고, 단계마다 문제 바로 아래에 코드를 쓰는 자리가 있어요. 한 단계의 결과가 예상과 같으면 다음 단계로 넘어가요. Flutter 파일은 `stage` 숫자를 1, 2, 3으로 바꿔 단계 화면을 확인해요.
4. 입력값이나 조작을 바꾸어 추가 사례도 확인해요.
5. 정답을 봤다면 닫고 비슷한 입력으로 다시 작성해요. [학습 기록](../notes.md)에 막힌 줄을 적어요.

해설은 별도 파일이며 문제 결과만 실행해요. 다른 날짜의 풀이를 import하거나 숨겨진 채점 함수에 값을 전달하지 않아요.

## 이번 주 통과 기준

선택한 항목이 상세 화면 생성자로 전달되는 경로와 pop 결과를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`main.dart → app_start.dart → AuthGate → MainTabs`를 [코드 지도](../project-map.md)에서 찾아요. 로그인 여부에 따른 분기를 포함해 화살표로 그려요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
