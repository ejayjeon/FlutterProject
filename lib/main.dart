import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:whoever/app/common/util/i18n.dart';
import 'package:whoever/app/common/util/theme.dart';
import 'package:whoever/app/controller/app_binding.dart';
import 'package:whoever/app/common/routes/app_router.dart';
import 'package:whoever/app/common/util/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onInit: () {},
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: I18N(),
      fallbackLocale: const Locale('ko', 'KR'),
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'US'),
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      // themeMode: ThemeMode.system,
      initialRoute: AppRouter.initPath,
      getPages: AppRouter.pages,
    );
  }
}
