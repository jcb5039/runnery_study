// 12주차 7일 — 복습: 기록 추가와 비우기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week12/day07.dart
// 정답은 answers/day07.dart에 있어요.
// 오늘의 강의: week12/README.md의 "1~3번 섹션 전체" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아래 ExamplePage의 입력값과 버튼 동작을 먼저 확인하세요.
//
// [한 줄씩 읽기]
// 1. 사용자 행동 → 저장소 변경 → 알림 → 화면 갱신을 직접 구성해요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('목록과 합계가 한 저장소를 보게 만드세요.')),
    );
  }
}

// ━━━━━━━━━━ 1단계: 복습 ━━━━━━━━━━
// [문제] 파일 아래 TagStore extends ChangeNotifier를 정의하세요. final tags = <String>[], add(String t), clear()는 바꾼 뒤 알려요.
//        _Step1PageState는 store를 만들고 dispose에서 정리하세요. body는 ListenableBuilder로 '${store.tags}' Text,
//        '달리기 추가' 버튼(store.add('달리기')), '비우기' 버튼(store.clear)을 보여줘요.
// [예상 화면]
// [] → 달리기 추가 → [달리기] → 비우기 → []

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: store를 만들고 dispose를 쓰고, body를 ListenableBuilder로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 TagStore 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] RunStore에 records, total getter, add(double km), clear()를 정의하세요. 변경 후 notifyListeners를 호출하세요.
//        Step2Page는 ListenableBuilder로 합계와 목록을 표시하세요.
//        3.0km 추가와 비우기 버튼을 연결하고 dispose에서 저장소를 정리하세요.
// [예상 화면]
// 추가 두 번: [3.0, 3.0], 합계 6.0km / 비우기: [], 합계 0.0km
// [조작을 바꿔 다시 확인] 빈 상태에서 비우기를 눌러도 오류가 없어야 해요.

class Step2Page extends StatefulWidget {
  const Step2Page({super.key});
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  // TODO: 문제의 상태 변수 선언 위치

  // TODO: 버튼 동작과 필요한 생명주기 메서드 정의 위치

  @override
  Widget build(BuildContext context) {
    // TODO: 아래 예제용 안내 화면을 문제에서 요구한 위젯으로 바꾸세요.
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: const Text('TODO: 여기에 문제 화면을 만드세요.')),
    );
  }
}

// TODO ②: 문제에서 새 클래스를 요구하면 여기에 정의하세요.

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 지운 기록은 목록에서 빼고 보여주기 ━━━━━━━━━━
// 4주차 4일에 본 기록 목록 getter예요(record/list/record_list_page.dart).
//
//   List<RunningRecord> get records => (widget.records ?? _saved)
//       .where((r) => !_deleted.contains(r.id))
//       .toList();
//
// 읽는 법: 지운 id 목록(_deleted)에 있는 기록은 빼고 보여줘요. 지우면 _deleted에 넣고 다시 그려요.
// 바로 아래 [주어진 코드]는 이 흐름을 ChangeNotifier 저장소로 옮긴 거예요. join(', ')은 목록을 쉼표로 이은 글자예요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const DeleteLite(); 한 줄만 남기세요.
// (2) 실행 전에 '첫 기록 지우기'를 두 번 누른 뒤 글자를 [내 예측]에 적고 비교하세요.
// (3) all 목록에서 실제로 지워진 항목이 있나요? 화면에서는 왜 사라졌나요?
// [내 예측]
//
// [예상 화면]
// 처음 r1, r2, r3 → 지우기 → r2, r3 → 지우기 → r3

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class DeleteStoreLite extends ChangeNotifier {
  final all = ['r1', 'r2', 'r3'];
  final _deleted = <String>[];

  List<String> get visible => all.where((id) => !_deleted.contains(id)).toList();

  void delete(String id) {
    _deleted.add(id);
    notifyListeners();
  }
}

class DeleteLite extends StatefulWidget {
  const DeleteLite({super.key});

  @override
  State<DeleteLite> createState() => _DeleteLiteState();
}

class _DeleteLiteState extends State<DeleteLite> {
  final store = DeleteStoreLite();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: ListenableBuilder(
          listenable: store,
          builder: (context, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(store.visible.join(', ')),
              ElevatedButton(
                onPressed: () => store.delete(store.visible.first),
                child: const Text('첫 기록 지우기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const DeleteLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// Runnery의 save → notifyListeners → _reload → setState를 원본 파일에서 찾아 설명하세요.
