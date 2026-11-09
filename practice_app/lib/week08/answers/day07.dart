// 8주차 7일 해설 — 복습: 상태와 생명주기 설명하기
// 실행: flutter run -d chrome -t lib/week08/answers/day07.dart
// 예상 결과:
// 시작 0km, 추가 두 번 2km, 초기화 0km. 같은 State에서 준비는 한 번, 그리기는 여러 번 가능.
// 확인 질문: build에서 파일 저장이나 Timer 생성을 매번 하면 왜 문제가 되나요?

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PracticePage()));
}

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});
  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  int km = 0;
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

  @override
  Widget build(BuildContext context) {
    debugPrint('그리기');
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${km}km'),
            ElevatedButton(
              onPressed: () => setState(() {
                km++;
              }),
              child: const Text('추가'),
            ),
            TextButton(
              onPressed: () => setState(() {
                km = 0;
              }),
              child: const Text('초기화'),
            ),
          ],
        ),
      ),
    );
  }
}
