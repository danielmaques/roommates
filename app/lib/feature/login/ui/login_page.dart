import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roommate/core/helper/context_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String login = 'login';

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
            const RTextFormField(
              hintText: 'Email',
              prefixIcon: Icon(Iconsax.sms),
            ),
            20.h,
            const RTextFormField(
              hintText: 'Password',
              prefixIcon: Icon(Iconsax.lock),
            ),
            20.h,
            RButton(
              text: context.translate(login, 'forgotPassword'),
              textColor: RColors.getMidnightBlue(),
              backgroundColor: RColors.getWhite(),
              onTap: () {},
            ),
            20.h,
            RButton(
              text: context.translate(login, 'login'),
              onTap: () {},
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
}
