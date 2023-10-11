import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/presentation/controller/user_controller.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/ui/widget/custom_button.dart';
import 'package:whoever/app/data/service/user_service.dart';

class SignInView extends GetView<UserController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: SingleChildScrollView(
        child: Form(
          key: UserService.to.loginFormKey,
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) => controller.emailValidator(value!),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email...',
                  ),
                  onSaved: (value) => UserService.to.setUserEmail(value!),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  validator: (value) => controller.passWwordValidator(value!),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password...',
                  ),
                  onSaved: (value) => UserService.to.setUserPassWord(value!),
                ),
                const SizedBox(height: 24),
                CustomButton.active(
                  label: 'SIGNIN',
                  onPressed: () {
                    controller.formSubmit();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
