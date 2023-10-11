import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/presentation/controller/theme_controller.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ThemeController());
    return Scaffold(
        appBar: AppBar(
          title: Text('value Builder'),
        ),
        body: Column(
          children: [
            Center(
              child: ValueBuilder<bool?>(
                initialValue: c.on.value,
                builder: (value, updater) => Switch(
                  value: value!,
                  onChanged: (value) {
                    c.toggle();
                    updater(value); // Closure: (Object?) => void
                  },
                ),
                onUpdate: (p0) => print('Widget Update $p0'),
                onDispose: () => print('Widget Dispose'),
              ),
            )
          ],
        ));
  }
}
