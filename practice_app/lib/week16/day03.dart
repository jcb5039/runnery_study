// 16주차 3일 — 화면과 저장 함수 나누기
// 실행 위치: ~/src/runnery-study/practice_app
// 실행: flutter run -d chrome -t lib/week16/day03.dart
// 정답은 answers/day03.dart에 있어요.
// 오늘의 강의: week16/README.md의 "3. 기능 하나를 끝까지 따라가기 — 2~7일" 섹션이에요. 그 섹션만 읽고 풀 수 있어요.
// 처음에는 stage = 0으로 예제를 봐요. 1단계를 풀면 stage = 1로 바꾸고 저장한 뒤 터미널에서 R(대문자)을 눌러요.
// 2단계, 3단계도 stage 숫자만 바꿔 확인해요. 단계마다 [문제] 바로 아래에 그 단계의 화면 클래스가 있어요.
// 다른 날짜를 열 때는 q로 종료하고 그 날짜의 -t 경로로 실행하세요.
//
// [예제 화면 / 관찰할 결과]
// 아침 저장 뒤 저장 완료와 보관된 메모: 아침
//
// [한 줄씩 읽기]
// 1. 화면 save가 입력을 검사해요.
// 2. 저장소 save가 입력을 기다린 뒤 memo 필드에 보관해요.
// 3. 화면은 완료를 기다려 결과를 표시해요.
// 4. 예제 저장소는 메모리이며, 디스크 영구 저장과 구분하세요.

import 'package:flutter/material.dart';

int stage = 0; // 0 예제, 1·2·3 단계. 숫자를 바꾸고 저장한 뒤 R을 눌러요.

void main() {
  const pages = <Widget>[ExamplePage(), Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage]));
}

// [짧은 실행 예제]
class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final store = ExampleStore();
  late final TextEditingController controller;
  bool saving = false;
  final bool succeed = true;
  String message = '저장 전';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '아침');
  }

  Future<void> save() async {
    final value = controller.text.trim();
    if (value.isEmpty) {
      setState(() {
        message = '메모를 입력하세요';
      });
      return;
    }
    setState(() {
      saving = true;
      message = '저장 중';
    });
    try {
      await store.save(value, succeed: succeed);
      if (!mounted) return;
      setState(() {
        message = '저장 완료';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        message = '저장 실패';
      });
    } finally {
      if (mounted) {
        setState(() {
          saving = false;
        });
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(controller: controller),
            ),
            ElevatedButton(
              onPressed: saving ? null : save,
              child: const Text('저장'),
            ),
            Text(message),
            Text('보관된 메모: ${store.memo}'),
          ],
        ),
      ),
    );
  }
}

class ExampleStore {
  String memo = '';
  Future<void> save(String value, {required bool succeed}) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    if (!succeed) throw StateError('저장 실패');
    memo = value;
  }
}

// ━━━━━━━━━━ 1단계: 예제 따라 하기 ━━━━━━━━━━
// [문제] 파일 아래 NameStore16 클래스를 정의하세요. String name = '', Future<void> save(String value) async는 200밀리초 뒤 name = value예요.
//        _Step1PageState는 store를 만들고 String message = '저장 전'을 둬요. save()는 await store.save('민수') 뒤
//        mounted 확인, setState(message = '저장됨: ${store.name}')이에요. body에는 message와 '저장' 버튼을 Column으로 놓아요.
// [예상 화면]
// 저장 전 → 저장 → 0.2초 뒤 저장됨: 민수

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  // TODO ①: store, message, save()를 만들고 body를 Column으로 바꾸세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: const Center(child: Text('TODO: 1단계 화면을 만드세요.')),
    );
  }
}

// TODO ②: 여기에 NameStore16 클래스를 정의하세요.

// ━━━━━━━━━━ 2단계: 직접 작성 ━━━━━━━━━━
// [문제] MemoStore에 memo 필드와 Future<void> save(String value, {required bool succeed})를 정의하세요.
//        Step2Page는 초기 입력 '저녁 달리기', succeed = true로 저장소를 호출하세요.
//        빈 입력을 막고 저장 중 버튼을 비활성화하세요. 결과 문구와 보관된 메모를 표시하세요.
//        컨트롤러 정리, mounted 확인, finally를 포함하세요.
// [예상 화면]
// 저장 중 → 저장 완료 / 보관된 메모: 저녁 달리기
// [조작을 바꿔 다시 확인] 입력을 바꿔 다시 저장하면 보관된 메모도 새 값으로 바뀌어요.

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

// ━━━━━━━━━━ 3단계: Runnery 코드 읽기 — 저장소가 규칙을 지키게 하기 ━━━━━━━━━━
// Runnery는 화면이 아니라 저장 함수가 값이 올바른지 마지막으로 확인해요. 잘못되면 throw하고, 화면이 catch해서 알려줘요.
// 바로 아래 [주어진 코드]의 MemoServiceLite.save는 20글자가 넘으면 실패해요. length는 글자 수예요.
// [문제]
// (1) Step3Page의 build에서 Scaffold 대신 return const MemoSaveLite(); 한 줄만 남기세요.
// (2) 실행 전에 '짧은 메모 저장', '긴 메모 저장'을 차례로 누른 뒤(각각 0.2초 기다림) 두 줄을 [내 예측]에 적고 비교하세요.
// (3) 긴 메모가 실패했을 때 보관된 메모는 왜 그대로인가요?
// [내 예측]
//
// [예상 화면]
// 짧은 메모 저장 → 저장 완료 / 보관: 비 옴 → 긴 메모 저장 → 메모가 너무 길어요 / 보관: 비 옴 그대로

// [주어진 코드 — 수정하지 말고 읽기만 하세요]
class MemoServiceLite {
  String memo = '';

  Future<void> save(String value) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    if (value.length > 20) throw StateError('메모가 너무 길어요');
    memo = value;
  }
}

class MemoSaveLite extends StatefulWidget {
  const MemoSaveLite({super.key});

  @override
  State<MemoSaveLite> createState() => _MemoSaveLiteState();
}

class _MemoSaveLiteState extends State<MemoSaveLite> {
  final service = MemoServiceLite();
  String message = '';

  Future<void> save(String value) async {
    try {
      await service.save(value);
      if (!mounted) return;
      setState(() => message = '저장 완료');
    } catch (error) {
      if (!mounted) return;
      setState(() => message = '메모가 너무 길어요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            Text('보관: ${service.memo}'),
            ElevatedButton(onPressed: () => save('비 옴'), child: const Text('짧은 메모 저장')),
            ElevatedButton(
              onPressed: () => save('오늘은 비가 와서 실내 트랙을 열 바퀴 돌았다'),
              child: const Text('긴 메모 저장'),
            ),
          ],
        ),
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO ①: 아래 Scaffold 대신 const MemoSaveLite()를 반환하세요.
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: Text('TODO: 3단계 화면을 만드세요.')),
    );
  }
}

// [내 말로 설명]
// 파일 저장으로 확장할 때 어느 함수 안에 11주차 코드를 넣을 수 있나요?
