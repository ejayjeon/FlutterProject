import 'package:flutter/material.dart';
import 'package:jemmemo/di/provider_setup.dart';
import 'package:jemmemo/presentation/memo/memo_screen.dart';
import 'package:jemmemo/ui/colors.dart';
import 'package:jemmemo/ui/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  // Flatform Channel 위젯 바인딩을 보장하는 코드 : 화면을 그리기 이전에 세팅되는 과정들을 보장하고나서 화면을 그린다
  // Firebase, CameraSetting 등 사용
  WidgetsFlutterBinding.ensureInitialized();

  final providers = await getProviders();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jem Memo',
      theme: darkTheme,
      // ThemeData(
      //   unselectedWidgetColor: Colors.white,
      //   primaryColor: Colors.white,
      //   backgroundColor: darkGray,
      //   canvasColor: darkGray,
      //   floatingActionButtonTheme:
      //       // 기존 테마에서 일부만 바꾸고 싶을 때
      //       Theme.of(context).floatingActionButtonTheme.copyWith(
      //             backgroundColor: Colors.white,
      //             foregroundColor: darkGray,
      //           ),
      //   appBarTheme: Theme.of(context).appBarTheme.copyWith(
      //         backgroundColor: darkGray,
      //       ),
      //   textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      // ),
      home: MemoScreen(),
    );
  }
}
