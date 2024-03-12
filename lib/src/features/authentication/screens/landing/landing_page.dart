import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../theme.dart';
import '../../../../core/common_widgets/auth_button.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'News App',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primaryCol, fontWeight: FontWeight.bold),
            ),
            Text(
              'Stay Informed, Stay Ahead\nYour Daily News, Anytime, Anywhere',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Column(
              children: [
                AuthButton(
                  child: const Text('Create an account'),
                  onPressed: () {
                    GoRouter.of(context).pushNamed('Signup');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                    ),
                    TextButton(
                      child: const Text('Sign in'),
                      onPressed: () {
                        GoRouter.of(context).pushNamed('Login');
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
