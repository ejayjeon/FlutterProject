import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:whoever/app/presentation/controller/app_binding.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/translation.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/data/service/pref_service.dart';
import 'package:whoever/app/data/service/user_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  AppBinding().dependencies();

  runApp(const _Main());
}

Future<void> init() async {
  Log('Service initialized......');
  await Get.putAsync(() => PrefService().init());
  await Get.putAsync(() => UserService().init());
  Log('Service init end......');
}

class _Main extends StatelessWidget {
  const _Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: (_, __) => GetMaterialApp(
        enableLog: true,
        defaultTransition: Transition.fadeIn,
        navigatorKey: Get.key,
        debugShowCheckedModeBanner: false,
        onInit: () {},
        locale: Get.deviceLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        translations: Translation(),
        fallbackLocale: const Locale('ko', 'KR'),
        supportedLocales: const [
          Locale('ko', 'KR'),
          Locale('en', 'US'),
        ],
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: AppRouter.initPath,
        getPages: AppRouter.pages,
      ),
    );
  }
}