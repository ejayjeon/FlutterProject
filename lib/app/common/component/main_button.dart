import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// class MainButton extends StatelessWidget {
//   final VoidCallback? onPressed; // 이벤트
//   final String title; // 버튼 텍스트
//   final double? width;
//   final double? height;
//   const MainButton({
//     super.key,
//     this.onPressed,
//     required this.title,
//     this.width,
//     this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       child: Text(title),
//       onPressed: onPressed,
//     );
//   }
// }
class MainButton extends MainButtonUI {
  const MainButton.active(
    String label, {
    Key? key,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          label: label,
        );
}

class MainButtonUI extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color textColor, backgroundColor, borderColor;
  final TextStyle? textStyle;
  final bool fullWidth;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? fontSize;
  final double? borderWidth;
  final double height;
  final double? width;
  final Widget? icon;
  const MainButtonUI({
    Key? key,
    @required this.onPressed,
    required this.label,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.fullWidth = true,
    this.height = 50.0,
    this.width,
    this.borderWidth,
    this.padding = const EdgeInsets.symmetric(vertical: 9, horizontal: 30),
    this.margin = EdgeInsets.zero,
    this.fontSize,
    this.icon,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: fullWidth
            ? Container(
                height: height,
                width: width ?? double.infinity,
                padding: padding,
                margin: margin,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height),
                  border: Border.all(
                    width: borderColor == Colors.transparent
                        ? 0
                        : borderWidth ?? 2,
                    color: borderColor,
                  ),
                  color: backgroundColor,
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  if (icon != null) ...[
                    icon!,
                    SizedBox(width: 20),
                  ],
                  Text(label,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            color: textColor,
                            fontSize: fontSize,
                          )),
                  if (icon != null) ...[
                    SizedBox(width: 50),
                  ],
                ]),
              )
            : FittedBox(
                fit: BoxFit.fill,
                child: Container(
                  height: height,
                  padding: padding,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height),
                    border: Border.all(
                      width: borderColor == Colors.transparent
                          ? 0
                          : borderWidth ?? 2,
                      color: borderColor,
                    ),
                    color: backgroundColor,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          icon!,
                          SizedBox(width: 20),
                        ],
                        Text(label,
                            textAlign: TextAlign.center,
                            style: textStyle ??
                                TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: textColor,
                                  fontSize: fontSize,
                                )),
                        if (icon != null) ...[
                          SizedBox(width: 50),
                        ],
                      ]),
                ),
              ));
  }
}
