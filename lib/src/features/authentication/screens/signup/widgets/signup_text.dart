import 'package:flutter/material.dart';

import '../../../../../../theme.dart';

class SignupText extends StatelessWidget {
  const SignupText({
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
              Text('Create an Account',
                  style: textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              RichText(
                text: TextSpan(
                    text: 'Please enter your information to register to ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                    children: [
                      TextSpan(
                          text: 'NewsApp',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: AppColors.primaryCol)),
                      TextSpan(
                          text: '.',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.grey))
                    ]),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
