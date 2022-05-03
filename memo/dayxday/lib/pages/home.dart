import 'package:dayxday/components/defalut_form_field.dart';
import 'package:dayxday/cubit/app_cubit.dart';
import 'package:dayxday/cubit/app_states.dart';
import 'package:dayxday/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();
var titleController = TextEditingController();
var timeController = TextEditingController();
var dateController = TextEditingController();
var formKey = GlobalKey<FormState>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: bgColorDark,
              key: scaffoldKey,
              body: cubit.screens[cubit.bottomNavigationIndex],
              floatingActionButton: FloatingActionButton(
                backgroundColor: veryPeri,
                child: cubit.floatingButtonIcon,
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState!.validate()) {
                      cubit
                          .inserToDatabase(
                              title: titleController.text,
                              time: timeController.text,
                              date: dateController.text)
                          .then((value) {
                        Navigator.pop(context);
                        titleController.clear();
                        timeController.clear();
                        dateController.clear();
                        cubit.changeBottomSheetState(
                            false,
                            Icon(
                              Icons.edit,
                            ));
                      });
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                            (context) => SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            color:
                                                bgColorWhite.withOpacity(0.2)),
                                        height: 40,
                                        child: Center(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                '취소',
                                                style: TextStyle(
                                                    color: veryPeri,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 105,
                                            ),
                                          ],
                                        )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          color: veryPeri.withOpacity(0.8),
                                        ),
                                        child: Form(
                                          key: formKey,
                                          child: SingleChildScrollView(
                                            physics: BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics()),
                                            child: Column(
                                              //mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                DefaultFormField(
                                                  controller: titleController,
                                                  label: '새로운 할 일',
                                                  type: TextInputType.text,
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return '할 일을 입력해 주세요';
                                                    }
                                                    return null;
                                                  },
                                                  prefix: Icons
                                                      .keyboard_alt_outlined,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                DefaultFormField(
                                                    onTap: () {
                                                      showTimePicker(
                                                              context: context,
                                                              initialTime:
                                                                  TimeOfDay
                                                                      .now())
                                                          .then((value) =>
                                                              timeController
                                                                      .text =
                                                                  value!.format(
                                                                      context));
                                                    },
                                                    controller: timeController,
                                                    label: '시간',
                                                    type:
                                                        TextInputType.datetime,
                                                    validate: (String? value) {
                                                      if (value!.isEmpty) {
                                                        return '시간을 입력해 주세요';
                                                      }
                                                      return null;
                                                    },
                                                    prefix: Icons
                                                        .watch_later_outlined),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                DefaultFormField(
                                                    onTap: () {
                                                      showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime.parse(
                                                                '2022-12-31'),
                                                        initialEntryMode:
                                                            DatePickerEntryMode
                                                                .calendarOnly,
                                                      ).then((value) =>
                                                          dateController
                                                              .text = DateFormat(
                                                                  "yyyy-MM-dd")
                                                              .format(value!));
                                                    },
                                                    controller: dateController,
                                                    label: '데드라인',
                                                    type:
                                                        TextInputType.datetime,
                                                    validate: (String? value) {
                                                      if (value!.isEmpty) {
                                                        return '날짜를 선택해 주세요';
                                                      }

                                                      return null;
                                                    },
                                                    prefix:
                                                        Icons.calendar_today),
                                                SizedBox(
                                                  height: 250,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                            backgroundColor: bgColorWhite.withOpacity(0.8))
                        .closed
                        .then((value) {
                      cubit.changeBottomSheetState(
                          false, Icon(Icons.edit, color: bgColorWhite));
                    });

                    cubit.changeBottomSheetState(
                        true, Icon(Icons.done, color: bgColorWhite));
                  }
                },
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.transparent, width: 1))),
                child: BottomNavigationBar(
                    unselectedItemColor: Colors.grey,
                    backgroundColor: bgColorDark,
                    selectedItemColor: veryPeri,
                    currentIndex: cubit.bottomNavigationIndex,
                    onTap: (index) {
                      cubit.changeIndex(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.menu), label: 'Todo'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.check_circle_outline),
                          label: 'Done'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.archive_outlined), label: 'Archive'),
                    ]),
              ),
            );
          }),
    );
  }
}
