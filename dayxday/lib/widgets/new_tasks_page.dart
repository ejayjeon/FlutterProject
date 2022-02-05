import 'package:dayxday/components/taek_item.dart';
import 'package:dayxday/cubit/app_cubit.dart';
import 'package:dayxday/cubit/app_states.dart';
import 'package:dayxday/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return SafeArea(
          child: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       if (Get.isDarkMode) {
                  //         Get.changeThemeMode(ThemeMode.light);
                  //       } else {
                  //         Get.changeThemeMode(ThemeMode.dark);
                  //       }
                  //     },
                  //     icon: Icon(Icons.nights_stay_rounded)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'To do',
                      style: TextStyle(
                          color: bgColorWhite,
                          fontSize: 35,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 5, bottom: 5),
                    child: tasks.isNotEmpty
                        ? Text(
                            '오늘의 할 일',
                            style: TextStyle(
                              color: veryPeri,
                              fontSize: 13,
                              fontFamily: 'NotoSans',
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  tasks.isNotEmpty
                      ? ListView.builder(
                          //scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return TaskItem(
                              tasks: tasks[index],
                            );
                          },
                          // separatorBuilder: (context, index) => Padding(
                          //       padding: const EdgeInsets.only(left: 20),
                          //       child: Container(
                          //         width: double.infinity,
                          //         height: 1.0,
                          //         color: Colors.grey[200],
                          //       ),
                          //     ),
                          itemCount: tasks.length)
                      : SizedBox(
                          child: Center(
                              child: Image.asset(
                          'images/nodata2.png',
                          height: 350,
                          width: 350,
                        ))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
