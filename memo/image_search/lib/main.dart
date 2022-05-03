import 'package:flutter/material.dart';
import 'package:image_search/di/provider_setup.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: globalProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // home: PhotoProvider(
      //   viewModel: HomeViewModel(PixabayApi()),
      //   child: const HomeScreen(),
      // ),
      // 하지만 직접 안에 생성자를 넣지 않고, InheritedWidget으로 감싸준다
      // Inherited Widget을 통해서 api 객체가 HomeScreen으로 들어감
      //home: HomeScreen(api: PixabayApi()),
      // api라는 이름으로 PixabayApi()를 보내주는 것임

      // global Provider 로 댜채
      // home: ChangeNotifierProvider(
      //   create: (_) => HomeViewModel(GetPhotosUseCase(
      //       PhotoApiRepositoryImple(PixabayApi(http.Client())))),
      //   child: const HomeScreen(),
      // ),
      home: const HomeScreen(),
    );
  }
}
