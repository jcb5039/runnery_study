# 8주차 — 상태와 위젯 생명주기

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

[위젯과 앱 생명주기](../guides/flutter-lifecycle.md)의 기본 부분을 함께 읽어요. `didChangeDependencies`, `didUpdateWidget`, `deactivate`는 심화 읽기로 구분했어요. 먼저 initState·build·dispose를 로그로 확인하세요.

## 이번 주 처음 만나는 개념

7주차 화면은 한 번 그리면 그대로였어요. 이번 주에는 **버튼을 누르면 값이 바뀌고 화면이 다시 그려지는** 흐름을 배워요. 그리고 화면 하나가 **만들어지고 → 쓰이고 → 정리되는** 과정(위젯 생명주기)도 배워요. 자세한 설명은 [위젯과 앱 생명주기](../guides/flutter-lifecycle.md)에 있어요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `late`, `super`, `return` |
| Flutter가 제공 | `StatefulWidget`, `State`, `setState`, `createState`, `initState`, `dispose`, `mounted`, `ElevatedButton`, `onPressed`, `debugPrint`, `TextEditingController` |
| 작성자가 붙인 이름 | `CheerPage`, `cheer`, `LikePage`, `_LikePageState`, `likes`, `like`, `load`, `message` |

### 1. 콜백: 나중에 불러 달라고 함수를 맡기기 — 1일

→ 1일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
class CheerPage extends StatelessWidget {
  const CheerPage({super.key});

  void cheer() {
    debugPrint('화이팅!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: cheer, child: const Text('응원')),
      ),
    );
  }
}
```

- `onPressed: cheer`: 함수 **이름만** 넘겨요. "버튼이 눌리면 이 함수를 불러 줘"라고 맡기는 거예요. 이렇게 맡겨 두는 함수를 **콜백**이라고 해요.
- `onPressed: cheer()`라고 쓰면 화면을 만드는 순간 `cheer`가 **바로 실행되고**, 그 결과(`void`, 값 없음)를 넘기게 돼서 오류가 나요. 3주차에서 본 것처럼 `()`는 "지금 실행해"라는 뜻이에요.
- 그 자리에서 이름 없는 함수를 만들어 넘길 수도 있어요. `onPressed: () { debugPrint('화이팅!'); }`처럼 쓰면 돼요. 4주차의 이름 없는 함수와 같아요.
- `debugPrint`: Flutter가 제공하는 출력 함수예요. 결과는 화면이 아니라 `flutter run`을 실행한 **터미널**에 나와요.

| 함수 | 정의 위치 | 호출하는 쪽 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `cheer` | `CheerPage` 안, `build` 바깥 | 버튼이 눌릴 때 **Flutter** | 없음 | 없음 |

**화면과 터미널**: 처음에는 로그가 없어요. **응원**을 누를 때마다 터미널에 `화이팅!`이 한 줄씩 생겨요. → [1일](../practice_app/lib/week08/day01.dart)

**1일 3단계에 필요한 것: 값을 넣어 부르는 콜백**

```dart
final void Function(int) onTap;
...
ElevatedButton(onPressed: () => onTap(1), child: const Text('기록')),
```

- `void Function(int)`: "int 하나를 받고 돌려주는 값이 없는 함수"라는 **타입**이에요. 함수를 필드에 담을 때 써요. Runnery 원본의 `ValueChanged<int>`도 같은 뜻이에요.
- `() => onTap(1)`: 이름 없는 함수예요. 버튼이 눌리면 그때 `onTap(1)`을 불러요. `onPressed: onTap(1)`이라고 쓰면 화면을 그리는 순간 바로 불려 버려요.
- 받는 쪽에서는 `TabButtons(onTap: go)`처럼 `()` 없이 함수 이름을 넘겨요.

### 2. StatefulWidget, State, setState — 2~3일

→ 2·3일 문제는 이 섹션만 읽고 풀 수 있어요.

```dart
class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int likes = 0;

  void like() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('좋아요 $likes개'),
            ElevatedButton(onPressed: like, child: const Text('좋아요')),
          ],
        ),
      ),
    );
  }
}
```

- 클래스가 **두 개**예요. `LikePage`(위젯)는 "이런 화면이 있다"는 설정이에요. `_LikePageState`(State)는 화면이 **기억할 값**과 `build`를 가지고 있어요. 위젯은 다시 만들어질 수 있지만, State는 화면이 살아 있는 동안 계속 유지돼요.
- `createState()`: Flutter가 이 화면을 처음 놓을 때 **한 번** 호출해서 State 객체를 받아 가요. `=>`는 3주차의 한 줄 함수예요.
- `_LikePageState`: 작성자가 붙인 이름이에요. 맨 앞의 `_`는 "이 파일 안에서만 쓰는 이름"이라는 Dart 규칙이에요.
- `int likes = 0;`: State가 기억하는 값, 즉 **상태**예요. `build` 바깥에 둬야 다시 그려도 0으로 돌아가지 않아요.
- `setState(() { likes++; })`: 값을 바꾸고 "화면을 다시 그려 줘"라고 Flutter에 알려요. 괄호 안의 `() { ... }`는 입력이 없는 이름 없는 함수예요. `setState` 없이 값만 바꾸면 화면이 바뀌지 않아요.
- `likes++`: `likes += 1`과 같아요.

**버튼을 누르면**: 버튼 클릭 → Flutter가 `like` 호출 → `setState` 안에서 `likes`가 0에서 1로 → Flutter가 `build`를 다시 호출 → `Text('좋아요 1개')`

**화면**: 좋아요 0개 → 버튼 한 번 → 좋아요 1개 → 한 번 더 → 좋아요 2개

**2·3일 3단계에 필요한 것: setState 전에 끝내기, 상태에 따라 고르기**

```dart
void _go(int index) {
  if (index == _index) return;
  setState(() {
    _index = index;
  });
}
```

- 같은 값이면 `return`으로 끝내서 `setState`를 부르지 않아요. 그러면 `build`도 다시 실행되지 않아요(3주차 4일의 `return`).
- `onPressed: error != null ? reload : open`: 조건이 참이면 `reload`, 거짓이면 `open`을 맡겨요. `조건 ? A : B`는 10주차에 자세히 배우고, 지금은 "참이면 A, 아니면 B"로 읽어요. 상태가 바뀌어 다시 그려지면 맡기는 함수도 바뀌어요.
- `Text(error ?? '정상')`: 6주차의 `??`예요. error가 null이면 `'정상'`을 보여줘요.

→ [2일](../practice_app/lib/week08/day02.dart), [3일](../practice_app/lib/week08/day03.dart)

### 3. 위젯 생명주기: initState → build → dispose — 4일, 6일

→ 4·6일 문제는 이 섹션만 읽고 풀 수 있어요.

| 이름 | 누가, 언제 호출하나 | 여기에 넣는 일 |
| --- | --- | --- |
| `initState()` | State를 처음 만들 때 Flutter가 **한 번** | 처음 값 준비, 도구 만들기, 리스너 등록 |
| `build()` | 처음 그릴 때, `setState` 뒤 등 Flutter가 **여러 번** | 현재 값을 읽어 위젯 돌려주기 |
| `dispose()` | 화면이 완전히 사라질 때(예: 뒤로 가기) Flutter가 **한 번** | 만든 도구 정리, 리스너 해제 |

2번 예제의 `_LikePageState` 안에 아래 두 메서드를 넣으면 로그로 확인할 수 있어요.

```dart
@override
void initState() {
  super.initState();
  debugPrint('준비');
}

@override
void dispose() {
  debugPrint('정리');
  super.dispose();
}
```

- `@override`: State가 원래 가진 메서드를 여기서 채운다는 표시예요.
- `super.initState()`: 물려받은 원래 준비 작업을 **먼저** 실행해요. `dispose`는 반대로 내 정리를 먼저 하고 `super.dispose()`를 **마지막에** 호출해요.

**터미널 로그**: 화면을 열면 `준비`가 나와요. 버튼으로 `setState`를 하면 `build`만 다시 실행되고 `준비`는 다시 나오지 않아요. 화면이 사라지면 `정리`가 나와요. 같은 화면을 다시 열면 새 State라서 `준비`부터 다시 시작해요.

6일의 `late final TextEditingController controller;`에서 `late`는 "선언은 지금 하고, 값은 나중에(`initState`에서) 넣겠다"는 키워드예요. 입력창 도구를 `initState`에서 한 번 만들고, `dispose`에서 `controller.dispose()`로 정리해요. → [4일](../practice_app/lib/week08/day04.dart), [6일](../practice_app/lib/week08/day06.dart)

**4일 3단계에 필요한 것: 새 화면 열기**

```dart
onPressed: () => Navigator.of(context).push(
  MaterialPageRoute<void>(builder: (context) => const SettingsLite()),
),
```

- 4일 예제의 화면 여는 줄과 같은 모양이에요. `builder`에 넘긴 함수가 새 화면 위젯을 만들어요. 자세한 내용은 9주차에 배워요.
- 새 화면이 열리면 그 State의 `initState`가, 위쪽 뒤로 가기로 닫히면 `dispose`가 불려요.

**6일 3단계에 필요한 것: 입력 칸 글자를 숫자로**

```dart
int? get _ageValue => int.tryParse(_age.text.trim());
```

- `controller.text`: 입력 칸에 지금 들어 있는 글자예요. `trim()`은 양끝 공백을 지워요.
- `int.tryParse(글자)`: 글자를 정수로 바꿔요. 6주차의 `int.parse`와 달리 실패하면 오류 대신 **null**을 돌려줘요. 그래서 반환 타입이 `int?`예요.

### 4. 기다린 뒤 mounted 확인하기 — 5일

→ 5일 문제는 이 섹션만 읽고 풀 수 있어요. 7일 복습은 1~4번 섹션을 함께 써요.

State 안의 메서드 하나예요. `message`는 State의 필드예요.

```dart
Future<void> load() async {
  await Future<void>.delayed(const Duration(seconds: 2));
  if (!mounted) return;
  setState(() {
    message = '도착';
  });
}
```

- 6주차 `await`로 2초를 기다리는 동안 사용자가 뒤로 가서 화면이 없어질 수 있어요.
- `mounted`: State가 가진 `bool` 값이에요. 이 State가 **아직 화면에 붙어 있으면 `true`**예요.
- `!mounted`: `bool` 앞의 `!`는 참·거짓을 뒤집는 "아니다"예요. 그래서 "화면에서 떨어졌으면"이라는 뜻이에요. 6주차의 null 단정 `!`(값 뒤에 붙음)와 기호는 같지만 뜻이 달라요.
- 화면이 없는데 `setState`를 하면 오류가 나요. 그래서 기다린 **뒤에** 확인해요. `mounted`는 기다리는 작업을 취소하지는 않아요.
- 5일 실습의 `onPressed: loading ? null : load`에서 `조건 ? A : B`는 조건이 참이면 A, 거짓이면 B를 골라요. 버튼에 `null`을 넣으면 누를 수 없는 버튼이 돼요. 이 문법은 10주차에 다시 연습해요.

**화면**: 버튼을 누르면 2초 뒤 `도착`이 보여요. 기다리는 중에 뒤로 가도 오류가 나지 않아요. → [5일](../practice_app/lib/week08/day05.dart)

**5일 3단계에 필요한 것: 화면이 생기자마자 불러오기**

`initState` 안에서 `_reload();`를 부르면 화면이 처음 생길 때 불러오기를 시작해요. `initState`는 `async`로 만들 수 없어서, 기다리는 일은 따로 만든 `async` 함수(`_reload`)에 맡기고 부르기만 해요. Runnery는 `if (!mounted) return;` 대신 `if (mounted) { setState(...) }` 모양으로도 써요. 뜻은 같아요.

**7일 3단계에 필요한 것: State에서 위젯이 받은 값 읽기**

`late int _index = widget.initialIndex;`: State 안에서 `widget.이름`으로 StatefulWidget이 생성자로 받은 값을 읽어요. `late`라서 처음 쓸 때 계산돼요(6일의 `late`와 같은 키워드). 그 뒤로 바뀌는 값은 `_index`이고, `widget.initialIndex`는 그대로예요.

### 위젯 생명주기와 앱 상태는 달라요

이번 주의 `initState`·`build`·`dispose`는 **화면 하나(State)**가 만들어지고 사라지는 흐름이에요. 앱 전체가 다른 앱 뒤로 가거나(백그라운드) 다시 앞으로 나오는 것은 **앱 생명주기**라고 해요. 앱 생명주기는 [13주차](../week13/README.md)에서 배워요. 앱이 백그라운드로 가도 화면의 `dispose`가 바로 호출되지는 않아요.

### 확인 질문

1. 2번 예제에서 버튼을 세 번 누르면, 처음 그릴 때를 포함해 `build`는 적어도 몇 번 실행될까요? `createState`는 몇 번일까요?
2. `int likes = 0;`을 `build` 안으로 옮기면 버튼을 눌러도 화면이 좋아요 0개에 머물러요. 그 이유를 설명해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [콜백은 버튼을 누를 때 실행](../practice_app/lib/week08/day01.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day01.dart) |
| 2일 | [StatefulWidget과 setState](../practice_app/lib/week08/day02.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day02.dart) |
| 3일 | [초기화 버튼과 상태의 위치](../practice_app/lib/week08/day03.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day03.dart) |
| 4일 | [initState → build → dispose 로그](../practice_app/lib/week08/day04.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day04.dart) |
| 5일 | [기다린 뒤 mounted 확인](../practice_app/lib/week08/day05.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day05.dart) |
| 6일 | [dispose에서 사용한 도구 정리](../practice_app/lib/week08/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day06.dart) |
| 7일 | [복습: 상태와 생명주기 설명하기](../practice_app/lib/week08/day07.dart) | Flutter 화면 | [해설](../practice_app/lib/week08/answers/day07.dart) |

## 실행

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week08/day01.dart
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

버튼→콜백→값 변경→build를 설명하고 initState·dispose·mounted의 역할을 구분한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`main_tabs.dart의 _go와 home_page.dart의 initState, dispose`를 [코드 지도](../project-map.md)에서 찾아요. 상태가 바뀌는 줄과 리스너를 등록·정리하는 줄을 찾아요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
