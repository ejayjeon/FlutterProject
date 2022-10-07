import 'package:flutter/material.dart';
import 'package:nosh/common/const/color_schemes.g.dart';

const DARK_BG = Color(0xFF36374d);
const LIGHT_BG = Color(0xFFfaf7fa);

var lightThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  switchTheme: lightSwitchThemeData,
  scrollbarTheme: lightScrollbarThemeData,
  elevatedButtonTheme: lightElevatedBtnThemeData,
  fontFamily: 'Pretendard',
  textTheme: lightTextThemeData,
  indicatorColor: lightColorScheme.secondaryContainer,
  backgroundColor: const Color(0xFFFBFBFB),
  // inputDecorationTheme: lightInputThemeData,
);

var darkThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  switchTheme: darkSwitchThemeData,
  scrollbarTheme: darkScrollbarThemeData,
  elevatedButtonTheme: darkElevatedBtnThemeData,
  fontFamily: 'Pretendard',
  textTheme: darkTextThemeData,
  indicatorColor: darkColorScheme.secondaryContainer,
  backgroundColor: const Color(0xFF0C0D13),
  // inputDecorationTheme: darkInputThemeData,
);

// 스위치 테마
var lightSwitchThemeData = SwitchThemeData(
  thumbColor: MaterialStatePropertyAll<Color?>(lightColorScheme.primary),
  trackColor: MaterialStatePropertyAll<Color?>(lightColorScheme.onPrimary),
);
var darkSwitchThemeData = SwitchThemeData(
  thumbColor: MaterialStatePropertyAll<Color?>(darkColorScheme.primary),
  trackColor: MaterialStatePropertyAll<Color?>(darkColorScheme.onPrimary),
);

// 스크롤바 테마
var lightScrollbarThemeData = ScrollbarThemeData(
  thumbVisibility: const MaterialStatePropertyAll<bool>(true),
  trackVisibility: const MaterialStatePropertyAll<bool>(false),
  thickness: const MaterialStatePropertyAll<double?>(1.0),
  radius: const Radius.circular(30),
  thumbColor: MaterialStatePropertyAll<Color?>(lightColorScheme.primary),
  trackColor: MaterialStatePropertyAll<Color?>(lightColorScheme.onPrimary),
  trackBorderColor: const MaterialStatePropertyAll<Color?>(Colors.transparent),
);
var darkScrollbarThemeData = ScrollbarThemeData(
  thumbVisibility: const MaterialStatePropertyAll<bool>(true),
  trackVisibility: const MaterialStatePropertyAll<bool>(false),
  thickness: const MaterialStatePropertyAll<double?>(1.0),
  radius: const Radius.circular(30),
  thumbColor: MaterialStatePropertyAll<Color?>(darkColorScheme.primary),
  trackColor: MaterialStatePropertyAll<Color?>(darkColorScheme.onPrimary),
  trackBorderColor: const MaterialStatePropertyAll<Color?>(Colors.transparent),
);

// elevated button 테마
var lightElevatedBtnThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color?>(
      Colors.transparent,
    ),
    overlayColor: MaterialStatePropertyAll<Color?>(
      lightColorScheme.onPrimary,
    ),
    elevation: const MaterialStatePropertyAll<double?>(0.0),
    textStyle: MaterialStatePropertyAll<TextStyle>(
      TextStyle(
        color: lightColorScheme.onSurface,
      ),
    ),
  ),
);
var darkElevatedBtnThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color?>(
      Colors.transparent,
    ),
    overlayColor: MaterialStatePropertyAll<Color?>(
      darkColorScheme.onPrimary,
    ),
    elevation: const MaterialStatePropertyAll<double?>(0.0),
    textStyle: MaterialStatePropertyAll<TextStyle>(
      TextStyle(
        color: darkColorScheme.onSurface,
      ),
    ),
  ),
);

// 텍스트 테마
var lightTextThemeData = const TextTheme(
  headline1: TextStyle(
    fontSize: 30.0,
    color: DARK_BG,
    fontWeight: FontWeight.w800,
  ),
  headline2: TextStyle(
    fontSize: 25.0,
    color: DARK_BG,
    fontWeight: FontWeight.w700,
  ),
  headline3: TextStyle(
    fontSize: 20.0,
    color: DARK_BG,
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    fontSize: 25.0,
    color: Color(0xFF515269),
    fontWeight: FontWeight.w600,
  ),
  subtitle2: TextStyle(
    fontSize: 20.0,
    color: Color(0xFF515269),
    fontWeight: FontWeight.w500,
  ),
  bodyText1: TextStyle(
    fontSize: 14.0,
    color: DARK_BG,
  ),
  bodyText2: TextStyle(
    fontSize: 10.0,
    color: DARK_BG,
  ),
  caption: TextStyle(
      fontSize: 13.0,
      color: DARK_BG,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700),
);
var darkTextThemeData = const TextTheme(
  headline1: TextStyle(
    fontSize: 30.0,
    color: LIGHT_BG,
    fontWeight: FontWeight.w800,
  ),
  headline2: TextStyle(
    fontSize: 25.0,
    color: LIGHT_BG,
    fontWeight: FontWeight.w700,
  ),
  headline3: TextStyle(
    fontSize: 25.0,
    color: LIGHT_BG,
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    fontSize: 25.0,
    color: Color(0xFFf7f5f7),
    fontWeight: FontWeight.w600,
  ),
  subtitle2: TextStyle(
    fontSize: 20.0,
    color: Color(0xFFf7f5f7),
    fontWeight: FontWeight.w500,
  ),
  bodyText1: TextStyle(
    fontSize: 14.0,
    color: LIGHT_BG,
  ),
  bodyText2: TextStyle(
    fontSize: 10.0,
    color: LIGHT_BG,
  ),
  caption: TextStyle(
      fontSize: 13.0,
      color: LIGHT_BG,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700),
);

// Dialog 테마
var lightDlgThemeData = const DialogTheme(
  backgroundColor: Color(0xFFFBFBFB),
  iconColor: DARK_BG,
  titleTextStyle: TextStyle(
    color: DARK_BG,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  ),
  contentTextStyle: TextStyle(
    color: Color(0xFF515269),
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  ),
);
var darkDlgThemeData = const DialogTheme(
  backgroundColor: Color(0xFF151517),
  iconColor: Color(0xFFf7f5f7),
  titleTextStyle: TextStyle(
    color: Color(0xFFf7f5f7),
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  ),
  contentTextStyle: TextStyle(
    color: Color(0xFFf7f5f7),
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  ),
);

// input 테마

var lightInputThemeData = InputDecoration(
  focusColor: lightColorScheme.primary,
  isCollapsed: true,
  iconColor: DARK_BG,
  prefixIconColor: DARK_BG,
  suffixIconColor: DARK_BG,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    color: lightColorScheme.secondary,
    fontSize: 14.0,
  ),
  helperStyle: const TextStyle(
    color: DARK_BG,
    fontSize: 12.0,
  ),
  errorStyle: TextStyle(
    color: lightColorScheme.error,
    fontSize: 12.0,
  ),
  fillColor: Color(0xFFEDEDED),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primary,
      width: 1.0,
    ),
  ),
);

var darkInputThemeData = InputDecoration(
  focusColor: darkColorScheme.primary,
  isCollapsed: true,
  iconColor: LIGHT_BG,
  prefixIconColor: LIGHT_BG,
  suffixIconColor: LIGHT_BG,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    color: darkColorScheme.secondary,
    fontSize: 14.0,
  ),
  helperStyle: const TextStyle(
    color: LIGHT_BG,
    fontSize: 12.0,
  ),
  errorStyle: TextStyle(
    color: darkColorScheme.error,
    fontSize: 12.0,
  ),
  fillColor: Color(0xFF191B27),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primary,
      width: 1.0,
    ),
  ),
);

/**
 * TextStyle? labelStyle,
  TextStyle? floatingLabelStyle,
  TextStyle? helperStyle,
  int? helperMaxLines,
  TextStyle? hintStyle,
  TextStyle? errorStyle,
  int? errorMaxLines,
  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
  FloatingLabelAlignment floatingLabelAlignment = FloatingLabelAlignment.start,
  bool isDense = false,
  EdgeInsetsGeometry? contentPadding,
  bool isCollapsed = false,
  Color? iconColor,
  TextStyle? prefixStyle,
  Color? prefixIconColor,
  TextStyle? suffixStyle,
  Color? suffixIconColor,
  TextStyle? counterStyle,
  bool filled = false,
  Color? fillColor,
  Color? focusColor,
  Color? hoverColor,
  InputBorder? errorBorder,
  InputBorder? focusedBorder,
  InputBorder? focusedErrorBorder,
  InputBorder? disabledBorder,
  InputBorder? enabledBorder,
  InputBorder? border,
  bool alignLabelWithHint = false,
  BoxConstraints? constraints,
 * 
 */



/**
 * 
 * new) ThemeData ThemeData({
  bool? applyElevationOverlayColor,
  NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
  Iterable<ThemeExtension<dynamic>>? extensions,
  InputDecorationTheme? inputDecorationTheme,
  MaterialTapTargetSize? materialTapTargetSize,
  PageTransitionsTheme? pageTransitionsTheme,
  TargetPlatform? platform,
  ScrollbarThemeData? scrollbarTheme,
  InteractiveInkFeatureFactory? splashFactory,
  bool? useMaterial3,
  VisualDensity? visualDensity,
  Color? backgroundColor,
  Color? bottomAppBarColor,
  Brightness? brightness,
  Color? canvasColor,
  Color? cardColor,
  ColorScheme? colorScheme,
  Color? colorSchemeSeed,
  Color? dialogBackgroundColor,
  Color? disabledColor,
  Color? dividerColor,
  Color? errorColor,
  Color? focusColor,
  Color? highlightColor,
  Color? hintColor,
  Color? hoverColor,
  Color? indicatorColor,
  Color? primaryColor,
  Color? primaryColorDark,
  Color? primaryColorLight,
  MaterialColor? primarySwatch,
  Color? scaffoldBackgroundColor,
  Color? secondaryHeaderColor,
  Color? selectedRowColor,
  Color? shadowColor,
  Color? splashColor,
  Color? toggleableActiveColor,
  Color? unselectedWidgetColor,
  String? fontFamily,
  IconThemeData? iconTheme,
  IconThemeData? primaryIconTheme,
  TextTheme? primaryTextTheme,
  TextTheme? textTheme,
  Typography? typography,
  AppBarTheme? appBarTheme,
  MaterialBannerThemeData? bannerTheme,
  BottomAppBarTheme? bottomAppBarTheme,
  BottomNavigationBarThemeData? bottomNavigationBarTheme,
  BottomSheetThemeData? bottomSheetTheme,
  ButtonBarThemeData? buttonBarTheme,
  ButtonThemeData? buttonTheme,
  CardTheme? cardTheme,
  CheckboxThemeData? checkboxTheme,
  ChipThemeData? chipTheme,
  DataTableThemeData? dataTableTheme,
  DialogTheme? dialogTheme,
  DividerThemeData? dividerTheme,
  DrawerThemeData? drawerTheme,
  ElevatedButtonThemeData? elevatedButtonTheme,
  ExpansionTileThemeData? expansionTileTheme,
  FloatingActionButtonThemeData? floatingActionButtonTheme,
  ListTileThemeData? listTileTheme,
  NavigationBarThemeData? navigationBarTheme,
  NavigationRailThemeData? navigationRailTheme,
  OutlinedButtonThemeData? outlinedButtonTheme,
  PopupMenuThemeData? popupMenuTheme,
  ProgressIndicatorThemeData? progressIndicatorTheme,
  RadioThemeData? radioTheme,
  SliderThemeData? sliderTheme,
  SnackBarThemeData? snackBarTheme,
  SwitchThemeData? switchTheme,
  TabBarTheme? tabBarTheme,
  TextButtonThemeData? textButtonTheme,
  TextSelectionThemeData? textSelectionTheme,
  TimePickerThemeData? timePickerTheme,
  ToggleButtonsThemeData? toggleButtonsTheme,
  TooltipThemeData? tooltipTheme,
  Color? accentColor,
  Brightness? accentColorBrightness,
  TextTheme? accentTextTheme,
  IconThemeData? accentIconTheme,
  Color? buttonColor,
  bool? fixTextFieldOutlineLabel,
  Brightness? primaryColorBrightness,
  AndroidOverscrollIndicator? androidOverscrollIndicator,
 */