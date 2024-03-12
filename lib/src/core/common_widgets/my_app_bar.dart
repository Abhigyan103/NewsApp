import 'package:flutter/material.dart';

import '../../../theme.dart';

AppBar MyAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: AppColors.primaryCol2,
    title: Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
          ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    elevation: 5,
    shadowColor: Colors.black,
  );
}
