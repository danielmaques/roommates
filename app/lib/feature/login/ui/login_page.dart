import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roommate/core/helper/context_extension.dart';
import 'package:roommate/core/states/base_page_state.dart';
import 'package:roommate/feature/login/ui/bloc/signIn_with_email_password_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late SignInWithEmailPasswordBloc emailPasswordBloc;

  final String login = 'login';
  final canSend = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    emailPasswordBloc = Modular.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate(login, 'hello'),
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: RColors.getGreyBlue(),
              ),
            ),
            10.h,
            Text(
              context.translate(login, 'welcomeBack'),
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: RColors.getGreyBlue(),
              ),
            ),
            20.h,
            RTextFormField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: const Icon(Iconsax.sms),
              onChanged: (value) {
                setState(() {
                  _validateCanSend();
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            20.h,
            RTextFormField(
              controller: passwordController,
              hintText: 'Password',
              prefixIcon: const Icon(Iconsax.lock),
              onChanged: (value) {
                setState(() {
                  _validateCanSend();
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            20.h,
            RButton(
              text: context.translate(login, 'forgotPassword'),
              textColor: RColors.getMidnightBlue(),
              backgroundColor: RColors.getWhite(),
              onTap: () {},
            ),
            20.h,
            BlocBuilder(
              bloc: emailPasswordBloc,
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: canSend,
                  builder: (context, value, child) {
                    return RButton(
                      text: context.translate(login, 'login'),
                      isLoad: state is LoadingState,
                      onTap: () {
                        emailPasswordBloc.signInWithEmailPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    );
                  },
                );
              },
            ),
            20.h,
            Text(
              context.translate(login, 'or'),
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: RColors.getMidnightBlue(),
              ),
            ),
            20.h,
            RButton(
              text: context.translate(login, 'google'),
              icon: 'assets/icons/google.svg',
              backgroundColor: RColors.getWhite(),
              onTap: () {},
            ),
            20.h,
            RButton(
              text: context.translate(login, 'dontHaveAccount'),
              backgroundColor: RColors.getWhite(),
              textColor: RColors.getMidnightBlue(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _validateCanSend() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      canSend.value = true;
    } else {
      canSend.value = false;
    }
  }
}
