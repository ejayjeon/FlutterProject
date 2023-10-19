import 'package:flutter/material.dart';
import 'package:flutter_by_getx_dio/app/controller/home_controller.dart';
import 'package:get/state_manager.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              final user = state[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    user.image!,
                  ),
                ),
                title: Text(user.username!),
                subtitle: Text(user.email!),
                trailing: IconButton(
                  onPressed: () => controller.deleteUser(user.id!),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
          onEmpty: const Center(
            child: Text('EMPTY'),
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onError: (error) => Center(
            child: Text(
              error.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
