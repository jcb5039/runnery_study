// 7주차 2일 해설 — StatelessWidget과 build
// 실행: flutter run -d chrome -t lib/week07/answers/day02.dart
// 아래 stage 숫자(1·2·3)로 볼 단계를 골라요. 먼저 직접 시도한 뒤 읽고, 닫은 다음 다시 풀어 보세요.
// 1단계 예상 화면: 화면 가운데: 도시: 서울
// 2단계 예상 결과:
// 민수: 3km
// 확인 질문: build의 반환값은 숫자인가요, 화면을 구성하는 Widget인가요?
// 3단계 예상 화면: 화면 가운데: 러너님, 오늘도 달려볼까요?

import 'package:flutter/material.dart';

int stage = 1; // 1·2·3 중 보고 싶은 단계

void main() {
  const pages = <Widget>[Step1Page(), Step2Page(), Step3Page()];
  runApp(MaterialApp(home: pages[stage - 1]));
}

// ━━━━━━━━━━ 1단계 ━━━━━━━━━━
class Step1Page extends StatelessWidget {
  const Step1Page({super.key});

  final String city = '서울';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1단계')),
      body: Center(child: Text('도시: $city')),
    );
  }
}

// ━━━━━━━━━━ 2단계 ━━━━━━━━━━
class Step2Page extends StatelessWidget {
  const Step2Page({super.key});
  final String name = '민수';
  final int km = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('달리기 연습')),
      body: Center(child: Text('$name: ${km}km')),
    );
  }
}

// ━━━━━━━━━━ 3단계 ━━━━━━━━━━
class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  final String nickname = '러너';

  @override
  Widget build(BuildContext context) {
    return Text('$nickname님, 오늘도 달려볼까요?');
  }
}

class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3단계')),
      body: const Center(child: GreetingText()),
    );
  }
}
