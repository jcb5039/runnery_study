# Runnery 코드 읽기 지도

확인 기준: 2026-11-07의 로컬 `/Users/chanbeom/src/Runnery/lib` 코드. 이후 프로젝트가 바뀌면 함수 이름으로 다시 찾습니다. 아래 링크는 Runnery 원본을 엽니다. 실습은 학습 폴더에서 진행합니다.

## 처음 읽을 때 순서

1. 한 함수만 고릅니다. 큰 파일 전체를 읽으려 하지 않습니다.
2. 들어오는 값, 조건, 계산, 돌려주는 값을 찾습니다.
3. 그 함수를 호출하는 곳에서 실제 값이 어디서 왔는지 확인합니다.
4. 모르는 문법은 한 번에 하나씩 별도 `.dart` 파일에서 줄여서 실행합니다.
5. 화면에 보이는 변화와 연결해서 한 문장으로 설명합니다.

## 앱이 켜지는 흐름 — 9주차에 읽기

```text
main.dart의 main()
  → Firebase 초기화 시도, 화면 설정 읽기
  → runApp(MyApp)
  → MaterialApp의 home: AppStartPage
  → AppStartPage._openNextPage()
  → 별도의 nextPageBuilder가 없으면 AuthGate
  → 계정 상태를 읽고 MainTabs / VerifyEmailPage / LoginPageV2 중 선택
  → MainTabs에서 홈·기록·친구·내 정보 탭 표시
```

연결 파일:

- [앱 시작점](../Runnery/lib/main.dart): `main`, `MyApp`, `MaterialApp.home`
- [시작 화면](../Runnery/lib/app_start.dart): `_openNextPage`
- [인증과 로그인 화면](../Runnery/lib/login/login.dart): `AuthGate`, `login`, `_next`
- [하단 탭](../Runnery/lib/home/main_tabs.dart): `_pages`, `_go`, `_index`

`app_start.dart` 위쪽에는 로그인 화면을 건너뛴다는 주석이 남아 있지만, 확인한 실제 기본 이동 코드는 `AuthGate`입니다. 주석과 실행 코드를 함께 확인해야 하는 예입니다.

## 러닝 기록 저장 흐름 — 11~12주차에 읽기

```text
사용자가 러닝 종료 창에서 저장 선택
  → RunningStartPage의 _openEndSheet(), _EndAction.save 분기
  → _session.finish(): 러닝 중 수집한 값으로 세션 기록 생성
  → recordFromSession(record): 저장용 기록으로 변환
  → RunningRecordStore.instance.save(saved)
  → _saveLocal(): toJson → jsonEncode → 임시 파일 쓰기 → 파일 이름 변경
  → notifyListeners(): 변경을 구독하는 쪽에 알림
  → 홈의 _reload(): 저장된 목록 읽기
  → setState로 _records 갱신 → 화면 갱신
```

서버 동기화는 `save`에서 로컬 저장 후 이어지는 별도 흐름입니다. `await save(...)`가 반환됐다고 서버 전송까지 완료됐다고 해석하지 않습니다.

| 파일 | 먼저 볼 부분 | 필요한 개념 |
| --- | --- | --- |
| [running_start_page.dart](../Runnery/lib/home/running/running_start_page.dart) | `_openEndSheet`의 저장 분기만 | 조건, 함수 호출, `await` |
| [record_from_session.dart](../Runnery/lib/record/data/record_from_session.dart) | `distanceKm: source.distanceMeters / 1000`부터 | 객체, 단위 변환, 생성자 |
| [running_record.dart](../Runnery/lib/record/models/running_record.dart) | `distanceKm`, `movingSeconds`, `toJson` | 필드, Map |
| [running_record_store.dart](../Runnery/lib/record/data/running_record_store.dart) | `save`, `_saveLocal`, `load` | 비동기, JSON, 파일 |
| [home_page.dart](../Runnery/lib/home/home_page.dart) | `initState`의 구독, `_reload`, `dispose` | 상태, 변경 알림 |

주의할 읽기 포인트: `RunningRecord`라는 이름의 클래스가 세션 쪽과 저장 모델 쪽에 각각 있습니다. `record_from_session.dart`에서는 세션 파일을 `as session`으로 가져와 `session.RunningRecord`와 저장용 `RunningRecord`를 구분합니다.

## 쉬운 계산부터 읽기 — 3~5주차 맛보기

- `RunningCalc.hetbahnCount`: 칼로리를 기준값으로 나누는 짧은 계산입니다. 기준값은 같은 파일의 `RunningConfig.hetbahnKcal`에서 찾습니다.
- 저장 모델의 `averageSpeed`: 거리와 시간으로 평균 속도를 구합니다. 조건과 단위를 함께 읽습니다.
- `RunningCalc.segmentCalories`: 여러 입력과 조건에 따라 계산하는 예입니다. 먼저 입력 3개가 어디에서 전달되는지 찾아봅니다. 공식의 타당성 평가와는 별개의 코드 읽기 연습입니다.

## 뒤에 읽을 부분 — 13주차 이후

- GPS: `running_start_page.dart`의 `RunningSession`.
- 로그인: [account_store.dart](../Runnery/lib/account/account_store.dart)의 `login`과 [account_backend.dart](../Runnery/lib/account/account_backend.dart).
- 동기화: [record_sync.dart](../Runnery/lib/record/data/record_sync.dart)의 `recordSaved`, `syncNow`, `_push`, `_pull`.
- 친구와 함께 달리기: `friends/` 아래 파일들은 위 흐름을 익힌 후 기능별로 읽습니다.

## 읽은 뒤 답할 질문

1. 이 함수는 누가 호출하나요?
2. 입력값은 어디에서 만들어지나요?
3. 어떤 조건에서 다른 길로 가나요?
4. 결과는 반환되나요, 저장되나요, 화면에 표시되나요?
5. 실패하거나 값이 없으면 어떤 일이 일어나나요?
