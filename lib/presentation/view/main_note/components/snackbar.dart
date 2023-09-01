import 'package:flutter/material.dart';

Future<void> showSnackbar({
  required String title,
  required BuildContext context,
  VoidCallback? onRestorePressed,
  bool needRestore = false,
}) async {
  final snackBar = SnackBar(
    content: Text(title),
    // showCloseIcon: true,
    backgroundColor: Colors.black.withOpacity(0.6),
    action: needRestore
        ? SnackBarAction(
            label: 'Restore',
            onPressed: onRestorePressed!,
          )
        : null,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
