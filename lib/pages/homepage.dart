// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:dayxday/controllers/home_controller.dart';
import 'package:dayxday/pages/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dayxday/style.dart';

class HomePage extends StatelessWidget {
// Widget _list(){
//   return Center(
//       child: SingleChildScrollView(
//         child: Column(
//           children: List.generate(20, (index) => GestureDetector(
//             onTap: (){
//               Get.toNamed('/detail/:id');
//             },
//             child: Container(
//               height: 200,
//               margin: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8), color: MyColor.primaryL
//               )
//             ),
//           )),
//         )
//       ),
//     );
// }

  Widget _list(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  20,
                  (index) => GestureDetector(
                      onTap: () {
                        HomeController.homeCtrl.setCategoryPage(true);
                        // Get.to(DetailPage()); // Get을 이용하면 하단 바가 사라질
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: MyColor.primaryL,
                        ),
                      ))))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: _list(context))],
    );
  }
}
