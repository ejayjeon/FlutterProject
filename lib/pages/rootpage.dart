// ignore_for_file: unused_import, use_key_in_widget_constructors, deprecated_member_use

import 'package:dayxday/controllers/home_controller.dart';
import 'package:dayxday/pages/calendarpage.dart';
import 'package:dayxday/pages/historypage.dart';
import 'package:dayxday/pages/homepage.dart';
import 'package:dayxday/pages/searchpage.dart';
import 'package:dayxday/pages/simplepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dayxday/style.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class RootPage extends GetView<HomeController> {

  @override
 Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
        // pop할 것이 있으면 pop 아니면 앱을 종료해. ! -> false 
      child: Obx(() => Scaffold(
        appBar: _myAppBar(context),
        body: IndexedStack(
          index: controller.homePageIndex.value,
          children: [
            SimplePage(),
            CalendarPage(),
            Navigator(
              key: controller.navigatorKey,
              onGenerateRoute: (routeSettings){
              return MaterialPageRoute(builder: (context) => HomePage(),
              );
              },
            ),
         HistoryPage(),
         SearchPage(),
        ],),
        bottomNavigationBar:  _myBottomNavBar()
        
        
        
        // BottomNavigationBar(
        // elevation: 0,

        // fixedColor: MyColor.primaryL,
        // currentIndex: controller.homePageIndex.value,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        // onTap: controller.changeHomePageIndex,
        
        // items: const [
        //   BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Simple', ),
        //   BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar', ),
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        //   BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History', ),
        //   BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search', ),
        // ],
        // )
      )
      ),
    );
  }
}


  ConvexAppBar _myBottomNavBar() {
    return ConvexAppBar(
       backgroundColor: Get.isDarkMode ? MyColor.primaryD : MyColor.primaryL,
       color: Get.isDarkMode ? MyColor.bgColor : MyColor.fontColor,elevation: 0,
      items: const [
        TabItem(icon: Icons.edit, title: 'Todo'),
        TabItem(icon: Icons.calendar_today_rounded, title: 'Calendar'),
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.more_time, title: 'History'),
        TabItem(icon: Icons.search, title: 'Search'),
      ],

      initialActiveIndex: HomeController.homeCtrl.homePageIndex.value, //optional, default as 0
      onTap: HomeController.homeCtrl.changeHomePageIndex,
      // onTap: (int i) {
      //   switch (i) {
      //     case 0:
      //       Get.to(() => SimplePage());
      //       break;
      //     case 1:
      //       Get.to(() => CalendarPage());
      //       break;
      //     case 2:
      //       Get.to(() => HomePage());
      //       break;
      //     case 3:
      //       Get.to(() => HistoryPage());
      //       break;
      //       case 4:
      //       Get.to(() => SearchPage());
      //       break;
      //     default:
      //       print('click index=$i');
      //       break;
      //   }
      );
  }
  AppBar _myAppBar(context) {
    return AppBar(
      leading: HomeController.homeCtrl.isPageOpen.value ? GestureDetector(
        onTap: HomeController.homeCtrl.goBack,
       child: const Icon(Icons.arrow_back_ios),)
       : Container()
       ,
      backgroundColor: Get.isDarkMode ? MyColor.primaryD : MyColor.primaryL,
      elevation: 0,
      centerTitle: false,
      title: HomeController.homeCtrl.isPageOpen.value 
      ? const Text('HomePage')
      : const Text('Null'),
    
      // Padding(
      //   padding: const EdgeInsets.only(left: 8.0),
      //   child: Text('Jemma의 Todo', style: TextStyle(color: MyColor.fontColor, fontSize: 16),),
      // ),
      actions: [
            IconButton(onPressed: (){
              if(Get.isDarkMode) {
                Get.changeThemeMode(ThemeMode.light);
              } else {
                Get.changeThemeMode(ThemeMode.dark);
              }
            }, icon: Icon(Icons.nights_stay_rounded)),
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.menu)),
          ],
    );
  }