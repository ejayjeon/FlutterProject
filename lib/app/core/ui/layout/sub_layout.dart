import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubLayout extends StatelessWidget {
  final String? title;
  final Widget body;
  final bool needActionButton;
  final VoidCallback? onSearchPressed;
  const SubLayout({
    super.key,
    this.title,
    this.needActionButton = true,
    required this.body,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: body,
    );
  }

  AppBar? _appBar() {
    if (title == null) return null;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: needActionButton
          ? [
              IconButton(
                onPressed: onSearchPressed,
                icon: const Icon(
                  Icons.search_sharp,
                ),
              ),
            ]
          : null,
    );
  }
}
