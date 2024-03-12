import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/auth_button.dart';
import '../../../../core/common_widgets/my_app_bar.dart';
import '../../../../core/common_widgets/my_text_field.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../core/utils/validators/validators.dart';
import '../../controllers/authentication_controller.dart';
import 'widgets/login_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const LoginText(),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    focusNode: emailFocus,
                    inputControl: emailCont,
                    validator: emailValidate,
                    hint: emailHint,
                    icon: Icons.perm_identity_rounded,
                    inputType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    onFieldSubmitted: (p0) =>
                        FocusScope.of(context).requestFocus(passFocus),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    focusNode: passFocus,
                    validator: passValidate,
                    inputControl: passCont,
                    hint: passHint,
                    icon: Icons.password_outlined,
                    inputType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.password],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            !ref.read(authControllerProvider)) {
                          ref.read(authControllerProvider.notifier).loginUser(
                              context,
                              emailCont.text.trim(),
                              passCont.text.trim(),
                              GoRouter.of(context).refresh);
                        }
                      },
                      child: const Text('LOG IN')),
                  TextButton(
                      onPressed: () {
                        GoRouter.of(context).push('/auth/forgot-password');
                      },
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
