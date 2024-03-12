import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common_widgets/auth_button.dart';
import '../../../core/common_widgets/my_app_bar.dart';
import '../../../providers/utils_providers.dart';
import '../controllers/authentication_controller.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  Timer? timer, timer2;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer2?.cancel();
    super.dispose();
  }

  void startTimer({required double seconds, required Duration step}) {
    ref.watch(timeRemainingProvider.notifier).set(seconds);
    timer2 = Timer.periodic(step, (t) {
      ref.read(timeRemainingProvider.notifier).decrease(step);
      if (ref.read(timeRemainingProvider) == 0) t.cancel();
    });
    timer?.cancel();
    timer = ref
        .read(authControllerProvider.notifier)
        .reloadUserPeriodically(GoRouter.of(context).refresh);
  }

  Future<void> sendMail(double waitTime) async {
    if (ref.read(timeRemainingProvider) == 0) {
      await ref.read(authControllerProvider.notifier).verifyEmail(context);
      startTimer(seconds: waitTime, step: const Duration(milliseconds: 50));
    }
  }

  @override
  Widget build(BuildContext context) {
    double waitTime = 60;
    return Scaffold(
      appBar: MyAppBar(context, title: 'Verify Email'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('A verification mail has been sent to your email!'),
              Text(
                ref.watch(myUserProvider)?.email ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              AuthButton(
                onPressed: () async {
                  if (!ref.read(authControllerProvider)) {
                    await sendMail(waitTime);
                  }
                },
                child: (!ref.watch(authControllerProvider))
                    ? ((ref.watch(timeRemainingProvider) > 0)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox.square(
                                dimension: 20,
                                child: CircularProgressIndicator(
                                  value: (ref.watch(timeRemainingProvider) /
                                      waitTime),
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(ref
                                  .watch(timeRemainingProvider)
                                  .ceil()
                                  .toString()),
                            ],
                          )
                        : const Text(
                            'Send Verification mail',
                            textAlign: TextAlign.center,
                          ))
                    : const CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
              ),
              TextButton(
                onPressed: () {
                  timer?.cancel();
                  timer2?.cancel();
                  ref
                      .read(authControllerProvider.notifier)
                      .logout(GoRouter.of(context).refresh);
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Cancel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
