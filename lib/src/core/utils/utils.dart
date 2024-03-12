import 'dart:math';

import 'package:flutter/material.dart';

// List<DropdownMenuEntry<String>> semDropdownList =
//     List<int>.generate(8, (index) => index + 1)
//         .map((e) => DropdownMenuEntry(
//               value: e.toString(),
//               label: e.toString(),
//             ))
//         .toList();

enum SnackBarType {
  good(backgroundColor: Colors.green),
  error(backgroundColor: Color(0xFFCF6679));

  const SnackBarType({required this.backgroundColor});
  final Color backgroundColor;
}

showSnackBar(
    {required BuildContext context,
    required String title,
    required SnackBarType snackBarType}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      backgroundColor: snackBarType.backgroundColor,
    ));
}

String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}
