import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Flutter 하루별 실습\n\n'
              'practice_app/README.md에서 실행 방법을 확인하세요.\n'
              '그날 파일은 -t로 선택해요.\n\n'
              '예: flutter run -d chrome -t lib/week07/day01.dart',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
