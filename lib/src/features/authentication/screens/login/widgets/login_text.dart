import 'package:flutter/material.dart';

import '../../../../../core/constants/text_strings.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(loginTitle, style: textTheme.displayLarge),
              Text(
                loginSubtitle,
                style: textTheme.titleSmall,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
