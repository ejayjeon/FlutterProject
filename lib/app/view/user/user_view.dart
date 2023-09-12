import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/controller/auth_controller.dart';
import 'package:whoever/app/view/user/login_view.dart';

class UserView extends GetView {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email
                  TextFormField(
                    validator: (value) {
                      // return을 하지 않으면 안됨
                      return controller.emailValidator(value!);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Email...',
                    ),
                    onSaved: (newValue) {
                      controller.setEmail(newValue!);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // Password
                  TextFormField(
                    validator: (value) {
                      return controller.passWordValidator(value!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password...',
                    ),
                    onSaved: (newValue) {
                      controller.setPassword(newValue!);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: controller.formSubmit,
                    child: Text('LOGIN'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
