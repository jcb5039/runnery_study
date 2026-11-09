# 12주차 — 저장 후 화면 갱신

하루 90분을 기준으로 복습 10분 → 짧은 예제 20분 → 직접 실습 45분 → 설명과 기록 15분으로 나눠요.
기간은 추정이에요. 이해가 어려운 날은 같은 파일을 다시 연습해도 됩니다.

## 이번 주 처음 만나는 개념

8주차에는 화면 **안**의 값이 바뀌면 `setState`로 다시 그렸어요. 이번 주에는 값을 화면 **밖의 저장소**에 두고, 저장소가 "바뀌었어요"라고 **알리면** 화면이 다시 그려지는 방법을 배워요. 비유하면 저장소는 방송국이고 화면은 구독자예요. 방송을 해야 구독자가 새 소식을 알아요.

| 종류 | 이번 주 예 |
| --- | --- |
| 키워드 | `extends`, `final` |
| Flutter가 제공 | `ChangeNotifier`, `notifyListeners`, `addListener`, `removeListener`, `ListenableBuilder`, `listenable`, `builder` |
| 작성자가 붙인 이름 | `CupStore`, `cups`, `drink`, `store`, `refresh` |

### 1. 알림을 보내는 저장소: ChangeNotifier — 1일

```dart
class CupStore extends ChangeNotifier {
  int cups = 0;

  void drink() {
    cups++;
    notifyListeners();
  }
}
```

- `CupStore`: 작성자가 만든 저장소 클래스예요. `extends ChangeNotifier`로 Flutter가 제공하는 **알림 기능**을 물려받아요.
- `notifyListeners()`: 물려받은 메서드예요. "값이 바뀌었어요"라며 **등록된 함수들을 모두 호출**해요.
- 값을 바꾸는 줄(`cups++`)과 알리는 줄은 따로예요. 알리지 않으면 값만 바뀌고 화면은 그대로예요.

### 2. 화면에서 듣기: ListenableBuilder — 1일, 3~4일

```dart
class _CupPageState extends State<CupPage> {
  final store = CupStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListenableBuilder(
              listenable: store,
              builder: (context, child) {
                return Text('${store.cups}잔');
              },
            ),
            ElevatedButton(onPressed: store.drink, child: const Text('마시기')),
          ],
        ),
      ),
    );
  }
}
```

- `listenable: store`: 이 저장소의 알림을 듣겠다는 뜻이에요.
- `builder: (context, child) { ... }`: 이름 없는 함수예요. 알림이 올 때마다 `ListenableBuilder`가 **이 함수를 다시 호출**해서 새 `Text`를 받아 가요. 입력 `child`는 이번 주에는 쓰지 않아요.
- `onPressed: store.drink`: 8주차처럼 함수 이름만 넘겨요. 이번에는 State의 메서드가 아니라 저장소의 메서드예요.
- `store.dispose()`: 이 화면이 만든 저장소라서 화면의 `dispose`에서 정리해요.

**버튼을 누르면**: 버튼 → `store.drink()` → `cups`가 0에서 1로 → `notifyListeners()` → ListenableBuilder가 builder를 다시 호출 → `Text('1잔')`

**화면**: 0잔 → 마시기 한 번 → 1잔

4일처럼 저장소에 목록과 getter(5주차)를 두면, 목록을 바꾸고 한 번 알릴 때 목록과 합계가 함께 바뀌어요. → [1일](../practice_app/lib/week12/day01.dart), [3일](../practice_app/lib/week12/day03.dart), [4일](../practice_app/lib/week12/day04.dart)

### 3. 직접 등록하고 해제하기: addListener, removeListener — 2일, 5~6일

2번의 `ListenableBuilder` 대신 State가 직접 등록하는 방법이에요. 이 방법을 쓸 때는 2번의 `dispose`를 아래 것으로 바꾸고, `build`에서는 `ListenableBuilder` 없이 `Text('${store.cups}잔')`를 바로 써요.

```dart
@override
void initState() {
  super.initState();
  store.addListener(refresh);
}

void refresh() {
  setState(() {});
}

@override
void dispose() {
  store.removeListener(refresh);
  store.dispose();
  super.dispose();
}
```

- `addListener(refresh)`: "알림이 오면 `refresh`를 불러 줘"라고 등록해요(8주차 콜백). 그래서 우리 코드에는 `refresh()`를 호출하는 줄이 없어요. `notifyListeners`가 호출해요.
- `setState(() {})`: 바뀐 값은 이미 저장소에 있으니, 빈 함수로 "다시 그려 줘"만 요청해요. 다시 실행된 `build`가 저장소의 새 값을 읽어요.
- `removeListener(refresh)`: 화면이 사라질 때 **등록했던 같은 함수**를 해제해요. 해제하지 않으면 없어진 화면의 `setState`가 불려서 오류가 날 수 있어요.

| 함수 | 정의 위치 | 호출하는 쪽 | 입력 | 반환 |
| --- | --- | --- | --- | --- |
| `refresh` | State 안 | 저장소의 `notifyListeners()` | 없음 | 없음 |

- 여러 화면이 함께 쓰는 공유 저장소라면, 화면은 자기 리스너만 해제하고 저장소는 `dispose`하지 않아요. **만든 쪽이 정리**해요. → [6일](../practice_app/lib/week12/day06.dart)
- 5일은 저장 완료 → 알림 → 다시 읽기 → `mounted` 확인 → `setState`를 연결해요. Runnery의 `save → notifyListeners → _reload → setState`와 같은 모양이에요. → [2일](../practice_app/lib/week12/day02.dart), [5일](../practice_app/lib/week12/day05.dart), 7일은 [복습](../practice_app/lib/week12/day07.dart)이에요.

### 확인 질문

1. `drink()`에서 `notifyListeners();`를 지우면 버튼을 눌렀을 때 `cups` 값과 화면 글자는 각각 어떻게 될까요?
2. `addListener`로 등록한 `refresh`는 우리 코드 어디에서도 `refresh()`로 호출하지 않아요. 그런데도 실행되는 이유를 말해 보세요.

## 하루별 자료

| 날짜 | 실습 | 실행 방식 | 막혔을 때 볼 해설 |
| --- | --- | --- | --- |
| 1일 | [ChangeNotifier가 변경을 알리기](../practice_app/lib/week12/day01.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day01.dart) |
| 2일 | [addListener와 removeListener](../practice_app/lib/week12/day02.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day02.dart) |
| 3일 | [ListenableBuilder로 구독 맡기기](../practice_app/lib/week12/day03.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day03.dart) |
| 4일 | [목록과 합계 함께 바꾸기](../practice_app/lib/week12/day04.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day04.dart) |
| 5일 | [저장 완료 → 알림 → 다시 읽기](../practice_app/lib/week12/day05.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day05.dart) |
| 6일 | [화면을 닫을 때 리스너 정리](../practice_app/lib/week12/day06.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day06.dart) |
| 7일 | [복습: 기록 추가와 비우기](../practice_app/lib/week12/day07.dart) | Flutter 화면 | [해설](../practice_app/lib/week12/answers/day07.dart) |

## 실행

Flutter 파일은 [실습 앱 안내](../practice_app/README.md)를 먼저 읽고 실행해요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week12/day01.dart
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

저장→알림→다시 읽기→상태 변경→화면을 연결하고 리스너 소유·정리를 설명한다.

7일 복습을 마친 뒤, 입력을 바꾼 결과를 실행 전에 예측하고 자기 말로 설명할 수 있는지 확인하세요. 둘 중 하나가 어렵다면 해당 날짜를 다시 풀고 다음 주로 넘어가요. 파일을 다 열었다는 것만으로 통과하지 않아요.

## Runnery에서 읽을 곳

`save → notifyListeners → _reload → setState`를 [코드 지도](../project-map.md)에서 찾아요. 실제 파일을 열어 코드 지도의 저장 흐름을 5분 안에 짚어보세요. 원본 수정 없이 읽고, 실험은 이 학습 폴더에서 해요.

[전체 학습 순서](../roadmap.md) · [학습 기록](../notes.md)
