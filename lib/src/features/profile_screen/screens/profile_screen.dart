import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/common_widgets/auth_button.dart';
import '../../../core/common_widgets/my_app_bar.dart';
import '../../../core/common_widgets/my_text_field.dart';
import '../../../models/user_model.dart';
import '../../../providers/utils_providers.dart';
import '../../authentication/controllers/authentication_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyUserModel user = ref.read(myUserProvider)!;
    return Scaffold(
      appBar: MyAppBar(
        context,
        title: 'Profile',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                MyTextField(
                  hint: 'Date of birth',
                  initialValue:
                      DateFormat.yMMMMd().format(DateTime.parse(user.dob)),
                  icon: Icons.calendar_month,
                ),
                const SizedBox(
                  height: 16,
                ),
                AuthButton(
                    child: const Text('Logout'),
                    onPressed: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .logout(GoRouter.of(context).refresh);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
