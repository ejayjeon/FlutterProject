import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:whoever/app/controller/pin_controller.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';

class PinView extends GetView<PinController> {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Form(
          key: controller.pinFormKey,
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text('dd'),
                _buildPinPut(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinPut() {
    return Pinput(
      length: 4,
      controller: controller.pinController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      obscureText: true,
      focusNode: controller.focusNode,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return '번호를 입력해 주세요';
      //   }
      //   // value가 user가 최초로 설정한 번호가 아닐 때, 지금은 임시로
      //   if (value != '1234') {
      //     return '잘못 입력했습니다';
      //   }
      // },
      validator: (value) => controller.pinValidator(value!),
      onCompleted: (value) {
        controller.pinCode.value = int.parse(value);
        Log('---------->${controller.pinCode.value}');
      },
    );
  }
}


/**
 * int length = PinputConstants._defaultLength,
  PinTheme? defaultPinTheme,
  PinTheme? focusedPinTheme,
  PinTheme? submittedPinTheme,
  PinTheme? followingPinTheme,
  PinTheme? disabledPinTheme,
  PinTheme? errorPinTheme,
  void Function(String)? onChanged,
  void Function(String)? onCompleted,
  void Function(String)? onSubmitted,
  void Function()? onTap,
  void Function()? onLongPress,
  TextEditingController? controller,
  FocusNode? focusNode,
  Widget? preFilledWidget,
  Widget Function(int)? separatorBuilder,
  String smsCodeMatcher = PinputConstants.defaultSmsCodeMatcher,
  String? senderPhoneNumber,
  AndroidSmsAutofillMethod androidSmsAutofillMethod = AndroidSmsAutofillMethod.none,
  bool listenForMultipleSmsOnAndroid = false,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
  AlignmentGeometry pinContentAlignment = Alignment.center,
  Curve animationCurve = Curves.easeIn,
  Duration animationDuration = PinputConstants._animationDuration,
  PinAnimationType pinAnimationType = PinAnimationType.scale,
  bool enabled = true,
  bool readOnly = false,
  bool useNativeKeyboard = true,
  bool toolbarEnabled = true,
  bool autofocus = false,
  bool obscureText = false,
  bool showCursor = true,
  bool isCursorAnimationEnabled = true,
  bool enableIMEPersonalizedLearning = false,
  bool enableSuggestions = true,
  HapticFeedbackType hapticFeedbackType = HapticFeedbackType.disabled,
  bool closeKeyboardWhenCompleted = true,
  TextInputType keyboardType = TextInputType.number,
  TextCapitalization textCapitalization = TextCapitalization.none,
  Offset? slideTransitionBeginOffset,
  Widget? cursor,
  Brightness? keyboardAppearance,
  List<TextInputFormatter> inputFormatters = const [],
  TextInputAction? textInputAction,
  Iterable<String>? autofillHints,
  String obscuringCharacter = '•',
  Widget? obscuringWidget,
  TextSelectionControls? selectionControls,
  String? restorationId,
  void Function(String)? onClipboardFound,
  void Function(String, Map<String, dynamic>)? onAppPrivateCommand,
  MouseCursor? mouseCursor,
  bool forceErrorState = false,
  String? errorText,
  String? Function(String?)? validator,
  Widget Function(String?, String)? errorBuilder,
  TextStyle? errorTextStyle,
  PinputAutovalidateMode pinputAutovalidateMode = PinputAutovalidateMode.onSubmit,
  EdgeInsets scrollPadding = const EdgeInsets.all(20),
  Widget Function(BuildContext, EditableTextState)? contextMenuBuilder = _defaultContextMenuBuilder,
  void Function(PointerDownEvent)? onTapOutside,
  Key? key,
 */