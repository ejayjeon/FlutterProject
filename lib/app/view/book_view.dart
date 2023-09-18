import 'package:flutter/material.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: () async {
    //     return false;
    //   },
    //   child: Container(
    //     child: Center(
    //       child: Text('Book View'),
    //     ),
    //   ),
    // );
    return AppLayout(
      needDrawer: false,
      body: Container(
        child: Center(
          child: Text('home'),
        ),
      ),
    );
  }
}
