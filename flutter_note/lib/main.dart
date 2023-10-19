import 'package:flutter/material.dart';
import 'package:flutter_note/di/provider_setup.dart';
import 'package:flutter_note/presentation/view/main_note/main_note_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // 플랫폼 채널의 위젯 바인딩 보장
  WidgetsFlutterBinding.ensureInitialized();

  // 앱 실행 전에 디비를 먼저 생성
  final providers = await getProviders();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainNoteScreen(),
    );
  }
}
