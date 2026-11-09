# 위젯 생명주기와 앱 생명주기

생명주기는 **만들어짐 → 사용됨 → 정리됨**의 흐름을 말해요. 8주에는 화면의 `State`가 살아 있는 흐름을, 13주에는 앱이 보이고 활성화되는 흐름을 살펴봐요.

## 먼저 실행해서 로그 보기 — 8주 4일

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week08/day04.dart
```

`stage = 0`으로 실행한 뒤 **생명주기 보기 → 다시 그리기 → 화면 위쪽 뒤로 가기** 순서로 눌러보세요. 로그는 이 명령을 실행한 터미널에서 보여요.

```text
새 화면 열기        예제 initState → 예제 build
다시 그리기 클릭    예제 build
뒤로 가기          예제 dispose
다시 화면 열기     새 State의 예제 initState → 예제 build
```

`build`는 다른 이유로도 추가 호출될 수 있어요. 정확히 한 번만 출력될 것이라고 가정하지 마세요.

파일의 해당 줄을 차례로 읽어요.

1. `createState()`가 화면에 사용할 `State` 객체를 만들어요.
2. `initState()`는 그 State가 처음 준비될 때 한 번 실행돼요. `super.initState()`를 먼저 호출해요.
3. `build()`는 지금 값으로 위젯을 만들어 반환해요. 여러 번 실행될 수 있어요.
4. 버튼의 `setState()`가 값을 바꾸고 다시 그리기를 요청해요. `build()`를 직접 부르지는 않아요.
5. State가 영구적으로 제거될 때 `dispose()`에서 사용하던 도구와 구독을 정리해요. 마지막에 `super.dispose()`를 호출해요.
6. 새로 열면 새로운 State라서 초기값부터 다시 시작해요.

직접 실습: 같은 파일의 2단계 `Step2Page`에서 기록 화면을 열게 하고, `PracticeCounter`를 만들어 **기록 initState / 기록 build / 기록 dispose** 로그를 남기세요. 버튼을 눌렀을 때 추가될 로그를 먼저 예측하세요.

이 설명은 [Flutter State 공식 생명주기](https://api.flutter.dev/flutter/widgets/State-class.html)의 기본 흐름을 처음 배울 부분으로 줄인 것이에요.

## 어느 위치에 무엇을 두나요?

| 위치 | 하는 일 | 실습 |
| --- | --- | --- |
| State 필드 | 화면이 기억할 거리·메모·로딩 여부 | [8주 2~3일](../week08/README.md) |
| `initState` | 초기화, 리스너 등록 | [8주 6일](../practice_app/lib/week08/day06.dart), [12주 2일](../practice_app/lib/week12/day02.dart) |
| `build` | 현재 값을 읽어 위젯 반환 | 매일 화면 실습 |
| 버튼 콜백 | 사용자 행동에 따른 계산과 저장 시작 | [8주 1일](../practice_app/lib/week08/day01.dart) |
| `dispose` | controller 정리, 리스너 제거, 구독·타이머 취소 | [8주 6일](../practice_app/lib/week08/day06.dart), [13주](../week13/README.md) |

`build`마다 파일 저장, 로그인 요청, Timer 생성, 리스너 등록을 하면 같은 작업이 반복될 수 있어요. 시작 계기를 찾아 버튼 콜백이나 초기화 위치에 두세요.

`dispose`는 앱 강제 종료 때 항상 실행되는 저장 기회가 아니에요. 보존할 데이터는 해당 저장 동작에서 처리하세요. 다른 화면이 위에 열려 현재 화면이 가려졌다고 기존 State가 곧바로 제거되는 것도 아니에요.

## 기다리는 동안 화면을 나갈 수 있어요 — mounted

[8주 5일](../practice_app/lib/week08/day05.dart)의 **불러오기**를 누르고 기다리는 동안 뒤로 가보세요.

```dart
await Future<void>.delayed(const Duration(seconds: 1));
if (!mounted) return;
setState(() {
  message = '3km';
});
```

첫 줄은 결과를 기다려요. 두 번째 줄은 State가 아직 화면 트리에 연결되어 있는지 확인해요. 제거되었으면 끝내고, 남아 있으면 결과를 상태에 넣어요.

`mounted`는 요청을 취소하는 기능이 아니에요. 이 확인과 Timer·Stream 구독 취소는 각각 필요에 맞게 해야 해요. [State.mounted 공식 설명](https://api.flutter.dev/flutter/widgets/State/mounted.html)

비슷한 실습: 지연을 3초로 늘리고 빠르게 나간 경우와 화면에 남아 있는 경우를 비교하세요. **왜 await 전에 검사한 것만으로 충분하지 않은지** 말해보세요.

## 앱이 비활성화되는 흐름 — 13주 6일

[13주 6일](../practice_app/lib/week13/day06.dart)을 실행하고 다른 브라우저 탭으로 이동했다 돌아오세요.

```bash
cd ~/src/runnery-study/practice_app
flutter run -d chrome -t lib/week13/day06.dart
```

| 상태 | 처음 이해할 의미 |
| --- | --- |
| `resumed` | 화면이 보이고 입력 포커스가 있는 활성 상태 |
| `inactive` | 보이지만 포커스를 잃는 등 활성 상호작용 상태가 아님 |
| `hidden` | 앱의 화면이 보이지 않음 |
| `paused` | 모바일에서 백그라운드에 있어 화면 프레임이 진행되지 않는 상태 |
| `detached` | 엔진에 연결된 화면이 없는 상태 |

플랫폼마다 전달되는 상태가 다르고 급작스러운 종료에는 알림을 못 받을 수 있어요. 모든 상태가 항상 같은 순서로 오는 것으로 구현하지 마세요. [공식 AppLifecycleState 설명](https://api.flutter.dev/flutter/dart-ui/AppLifecycleState.html)

실행 파일에서 등록·수신·해제를 찾아요.

1. `with WidgetsBindingObserver`: 상태 변화 알림을 받는 역할을 더해요.
2. `initState`의 `addObserver(this)`: 이 State를 등록해요.
3. `didChangeAppLifecycleState(state)`: 새 상태를 받아 로그와 Text를 바꿔요.
4. `dispose`의 `removeObserver(this)`: 등록을 해제해요.

비슷한 실습: 13주 6일 2단계 `Step2Page`에서 같은 흐름을 작성하고 실제로 받은 상태를 기록하세요. **앱이 inactive가 된 것과 State가 dispose된 것은 같은 사건인가요?**

## 나중에 원본에서 만날 이름

기본 흐름을 설명할 수 있게 된 뒤 읽을 참고표예요. 지금 모두 구현하는 통과 기준은 아니에요.

| 이름 | 다시 찾아볼 때의 뜻 |
| --- | --- |
| `didChangeDependencies` | 처음 초기화 뒤와 의존한 상위 정보가 변했을 때 호출될 수 있음 |
| `didUpdateWidget` | 같은 State를 유지하면서 부모가 새 위젯 구성을 전달했을 때 호출 |
| `deactivate` | 트리에서 분리되는 단계. 다시 삽입될 수 있어 dispose와 다름 |
| `reassemble` | 개발 중 hot reload 때 호출되는 훅 |

전체 순서는 [State 공식 문서](https://api.flutter.dev/flutter/widgets/State-class.html)에서 해당 이름을 검색하세요. 같은 State에서 hot reload(`r`)를 해도 `initState`가 다시 실행되는 것은 아니에요. 초기화부터 관찰할 때는 hot restart(`R`)나 재실행을 사용하세요.
