# Flutter 하루별 실습 앱

Runnery 학습용으로 따로 만든 Flutter 프로젝트예요. [7~9주](../week07/README.md), [12주](../week12/README.md), [13주 6일](../week13/README.md), [14주](../week14/README.md), [16주 2~7일](../week16/README.md)의 파일을 여기서 실행해요.

## 처음 한 번 준비

```bash
cd ~/src/runnery-study/practice_app
flutter pub get
flutter devices
```

브라우저 실행용 `web/`이 준비되어 있어요. Chrome이 보이면 다음 명령을 사용하세요.

```bash
flutter run -d chrome -t lib/week07/day01.dart
```

Chrome을 사용할 수 없다면 `flutter run -d web-server -t lib/week07/day01.dart`를 실행하고 표시된 로컬 주소를 브라우저에서 여세요. 웹 서버 실행은 Chrome 직접 실행과 개발 도구 동작이 다를 수 있어요. 휴대폰·macOS 실행용 프로젝트 파일은 아직 생성하지 않았어요.

## 매일 실행 순서

1. 그날 파일을 `stage = 0`으로 실행해 예제를 봐요.
2. 파일 위쪽 줄별 설명을 읽고, 아래로 내려가며 1단계 문제를 읽어요. 문제 바로 아래에 `Step1Page` 클래스가 있어요.
3. `Step1Page`의 TODO를 풀고, `stage = 1`로 바꿔 저장해요.
4. 실행 터미널에서 대문자 `R`로 다시 시작해 1단계 화면을 확인해요.
5. 예상 화면과 같으면 2단계(`Step2Page`, `stage = 2`), 3단계(`Step3Page`, `stage = 3`)도 같은 방법으로 해요.
6. 예상 화면·클릭 순서와 비교하고 입력을 바꿔요.

`ExamplePage`는 실행 예제이고 `Step1Page`~`Step3Page`는 단계별 문제를 푸는 공간이에요. `main`의 `pages[stage]`가 실행할 화면을 명시적으로 정해요. 다른 단계나 다른 날짜를 완성하지 않아도 오늘 예제는 실행돼요.

| 조작 | 하는 일 |
| --- | --- |
| 저장 후 `r` | hot reload. 기존 State는 대체로 유지 |
| 저장 후 `R` | hot restart. 초기 상태부터 다시 실행 |
| `q` | 현재 실행 종료 |
| `flutter run ... -t 다른파일.dart` | 다른 날짜의 독립 main으로 실행 |

초기값이나 `main`을 바꿨을 때, `initState`부터 로그를 보고 싶을 때는 `R`을 사용하세요. 생명주기 실습의 뒤로 가기는 앱 화면 안 AppBar의 버튼을 사용하세요.

해설 실행 예시:

```bash
flutter run -d chrome -t lib/week08/answers/day04.dart
```

해설은 문제 화면만 보여줘요. 먼저 직접 작성하고 확인한 뒤 닫고 다시 풀어요.

## 함께 읽을 자료

- [Flutter 기본 구조](../guides/flutter-structure.md): main부터 Text까지, 파일별 역할
- [위젯과 앱 생명주기](../guides/flutter-lifecycle.md): initState·build·dispose, mounted, 앱 상태
- [전체 16주 순서](../roadmap.md)

저장·로그인은 메모리 저장과 가짜 응답을 사용해요. 재시작 뒤 영구 저장은 [11주 Dart 파일 실습](../week11/README.md)에서 확인해요. 브라우저에는 그 `dart:io` 코드를 그대로 가져오지 않아요.

명령 사용법은 [Flutter 공식 CLI 안내](https://docs.flutter.dev/reference/flutter-cli)를 참고하세요.

`test/lesson_materials_test.dart`는 자료 제작 시 해설의 동작을 확인하는 테스트예요. 학습자의 TODO를 채점하는 코드가 아니며, 실습할 때는 각 파일의 예상 결과와 직접 비교하면 돼요.
