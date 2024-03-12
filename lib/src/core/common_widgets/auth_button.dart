import 'package:flutter/material.dart';

import '../../../theme.dart';

class AuthButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? textColor, backgroundColor;
  const AuthButton({
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          shadowColor: AppColors.primaryCol,
          elevation: 5,
          fixedSize: Size((MediaQuery.sizeOf(context).width / 2) - 28, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: onPressed,
      child: child,
    );
  }
}
