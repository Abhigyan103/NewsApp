import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../theme.dart';
import '../../../../core/common_widgets/auth_button.dart';
import '../../../../core/common_widgets/my_app_bar.dart';
import '../../../../core/common_widgets/my_text_field.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../core/utils/validators/validators.dart';
import '../../../../models/user_model.dart';
import '../../controllers/authentication_controller.dart';
import 'widgets/signup_text.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage>
    with TickerProviderStateMixin {
  late List<GlobalKey<FormState>> formKey;
  late FocusNode emailFocus;
  late FocusNode phoneFocus;
  late FocusNode firstNameFocus;
  late FocusNode lastNameFocus;
  late FocusNode passFocus;
  late TextEditingController emailCont;
  late TextEditingController phoneCont;
  late TextEditingController firstNameCont;
  late TextEditingController lastNameCont;
  late TextEditingController passCont;
  late TextEditingController dateCont;
  late TextEditingController genderCont;
  late PageController pageCont;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    formKey = [];
    for (int i = 0; i < 5; i++) {
      formKey.add(GlobalKey<FormState>());
    }
    emailFocus = FocusNode();
    phoneFocus = FocusNode();
    firstNameFocus = FocusNode();
    lastNameFocus = FocusNode();
    passFocus = FocusNode();
    emailCont = TextEditingController();
    phoneCont = TextEditingController();
    firstNameCont = TextEditingController();
    lastNameCont = TextEditingController();
    dateCont = TextEditingController();
    passCont = TextEditingController();
    genderCont = TextEditingController();
    pageCont = PageController();
  }

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    pageCont.dispose();
    firstNameCont.dispose();
    firstNameFocus.dispose();
    genderCont.dispose();
    lastNameCont.dispose();
    lastNameFocus.dispose();
    phoneCont.dispose();
    phoneFocus.dispose();
    super.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  _goToNextPage() {
    pageCont.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  _goToBackPage() {
    pageCont.previousPage(
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title: 'Sign up'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const SignupText(),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 400,
                child: PageView(
                  controller: pageCont,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: _handlePageViewChanged,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: formKey[0],
                          child: MyTextField(
                            focusNode: emailFocus,
                            inputControl: emailCont,
                            validator: emailValidate,
                            hint: emailHint,
                            icon: Icons.perm_identity_rounded,
                            inputType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                            onFieldSubmitted: (p0) => FocusScope.of(context)
                                .requestFocus(firstNameFocus),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AuthButton(
                              child: const Text('Next'),
                              onPressed: () {
                                if (formKey[0].currentState!.validate()) {
                                  _goToNextPage();
                                }
                              }),
                        ),
                      ],
                    ),
                    Form(
                        key: formKey[1],
                        child: Column(children: [
                          const SizedBox(height: 5),
                          MyTextField(
                            focusNode: firstNameFocus,
                            inputControl: firstNameCont,
                            validator: nameValidate,
                            hint: firstNameHint,
                            icon: Icons.perm_identity_rounded,
                            inputType: TextInputType.name,
                            autofillHints: const [AutofillHints.name],
                            onFieldSubmitted: (p0) => FocusScope.of(context)
                                .requestFocus(lastNameFocus),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextField(
                            focusNode: lastNameFocus,
                            inputControl: lastNameCont,
                            validator: nameValidate,
                            hint: lastNameHint,
                            icon: Icons.perm_identity_rounded,
                            inputType: TextInputType.name,
                            autofillHints: const [AutofillHints.name],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownMenu<Gender>(
                              initialSelection: Gender.male,
                              controller: genderCont,
                              inputDecorationTheme: InputDecorationTheme(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              label: const Text('Gender'),
                              expandedInsets: EdgeInsets.zero,
                              leadingIcon:
                                  const Icon(Icons.perm_identity_sharp),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                    leadingIcon: Icon(
                                      Icons.male,
                                      color: Colors.blue,
                                    ),
                                    value: Gender.male,
                                    label: 'Male'),
                                DropdownMenuEntry(
                                    leadingIcon: Icon(
                                      Icons.female,
                                      color: Colors.pink,
                                    ),
                                    value: Gender.female,
                                    label: 'Female'),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    AppColors.primaryColCont),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)))),
                            onPressed: () async {
                              int minAge = 18;
                              int maxAge = 60;
                              DateTime lastDate = DateTime(
                                  DateTime.now().year - minAge,
                                  DateTime.now().month,
                                  DateTime.now().day);
                              DateTime firstDate = DateTime(
                                  DateTime.now().year - maxAge,
                                  DateTime.now().month,
                                  DateTime.now().day);
                              DateTime date = await showDatePicker(
                                      context: context,
                                      initialDate: lastDate,
                                      firstDate: firstDate,
                                      lastDate: lastDate) ??
                                  lastDate;
                              setState(() {
                                dateCont.text =
                                    DateFormat.yMMMMd().format(date);
                              });
                            },
                            child: MyTextField(
                              enabled: false,
                              inputControl: dateCont,
                              iconColor: AppColors.primaryCol,
                              icon: Icons.calendar_today,
                              hint: 'Date Of Birth',
                              hintColor: AppColors.primaryCol,
                              textColor: AppColors.primaryCol,
                              noBorder: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AuthButton(
                                  backgroundColor: Colors.white,
                                  textColor: AppColors.primaryCol,
                                  onPressed: () {
                                    _goToBackPage();
                                  },
                                  child: const Text('Back')),
                              const SizedBox(
                                width: 20,
                              ),
                              AuthButton(
                                  child: const Text('Next'),
                                  onPressed: () {
                                    if (formKey[1].currentState!.validate()) {
                                      _goToNextPage();
                                    }
                                  }),
                            ],
                          )
                        ])),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: formKey[2],
                          child: MyTextField(
                            focusNode: passFocus,
                            validator: passValidate,
                            inputControl: passCont,
                            hint: passHint,
                            icon: Icons.password_outlined,
                            inputType: TextInputType.visiblePassword,
                            autofillHints: const [AutofillHints.password],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AuthButton(
                                backgroundColor: Colors.white,
                                textColor: AppColors.primaryCol,
                                onPressed: () {
                                  _goToBackPage();
                                },
                                child: const Text('Back')),
                            const SizedBox(
                              width: 20,
                            ),
                            AuthButton(
                                child: const Text('Next'),
                                onPressed: () async {
                                  if (formKey[2].currentState!.validate()) {
                                    await ref
                                        .read(authControllerProvider.notifier)
                                        .registerUser(
                                            context,
                                            MyUserModel(
                                                firstName:
                                                    firstNameCont.text.trim(),
                                                lastName:
                                                    lastNameCont.text.trim(),
                                                dob: DateFormat.yMMMMd()
                                                    .parse(dateCont.text)
                                                    .toIso8601String(),
                                                email: emailCont.text.trim(),
                                                phone: phoneCont.text.trim(),
                                                pass: passCont.text.trim(),
                                                searched: [],
                                                uid: '',
                                                gender: parse(genderCont.text)),
                                            GoRouter.of(context).refresh);
                                  }
                                }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
