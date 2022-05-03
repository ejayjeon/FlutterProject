import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  final FormFieldSetter<String> onSaved;
  final String initialValue;
  const CustomTextField(
      {required this.onSaved,
      required this.label,
      required this.isTime,
      required this.initialValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: veryperi, fontWeight: FontWeight.bold),
        ),
        if (isTime)
          _textField(
            isTime: isTime,
            onSaved: onSaved,
            initialValue: initialValue,
          ),
        if (!isTime)
          Expanded(
            child: _textField(
              isTime: isTime,
              onSaved: onSaved,
              initialValue: initialValue,
            ),
          )
      ],
    );
  }
}

class _textField extends StatelessWidget {
  const _textField({
    Key? key,
    required this.isTime,
    required this.onSaved,
    required this.initialValue,
  }) : super(key: key);
  final FormFieldSetter<String> onSaved;
  final bool isTime;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Form : 관리하고자하는 textField 상위에 Form을 넣어주면 됨
      //onChanged: (String? val) {},

      // null이 return 되면 에러가 없다
      // 에러가 있으면 에러를 String 값으로 리턴해준다
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요';
        }

        if (isTime) {
          int time = int.parse(val);
          if (time < 0) return '0 이상 숫자를 입력해주세요';
          if (time > 24) return '24 이하의 숫자를 입력해주세요';
        } else {
          if (val.length > 500) return '500자 이하의 글자를 입력해주세요';
        }
        return null;
      },
      onSaved: onSaved,
      cursorColor: veryperi,
      expands: !isTime,
      maxLines: isTime ? 1 : null, // 줄바꿈
      initialValue: initialValue,
      keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
      inputFormatters: isTime ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        // filled: false,
        // fillColor: lilac,
        suffixText: isTime ? ': 00' : null,
      ),
    );
  }
}
