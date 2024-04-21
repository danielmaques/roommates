import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roommate/core/helper/context_extension.dart';
import 'package:roommate/feature/login/ui/bloc/reset_password_bloc.dart';

import '../../../../core/helper/validator/email_validator.dart';
import '../../../../core/states/base_page_state.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  late TextEditingController emailController;

  late ResetPasswordBloc resetPasswordBloc;
  late ValueNotifier canSend;

  final String login = 'login';

  @override
  void initState() {
    super.initState();
    resetPasswordBloc = Modular.get();
    canSend = ValueNotifier(false);
    emailController = TextEditingController();

    _validateCanSend();
  }

  @override
  void dispose() {
    super.dispose();
    canSend.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate(login, 'forrgotPassword'),
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: RColors.getGreyBlue(),
              ),
            ),
            11.h,
            Text(
              context.translate(login, 'recoverPasswordDescription'),
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
                  _validateCanSend();
                },
                validator: (value) {
                  if (!EmailValidator.isValid(value.toString())) {
                    return context.translate('validator', 'email');
                  }
                  return null;
                }),
            20.h,
            BlocBuilder(
              bloc: resetPasswordBloc,
              builder: (context, state) {
                if (state is SuccessState) {
                  return RButton(
                    text: 'Voltar a tela de login',
                    onTap: () {
                      Modular.to.pop();
                    },
                  );
                }
                return ValueListenableBuilder(
                  valueListenable: canSend,
                  builder: (context, value, child) {
                    return RButton(
                      text: context.translate(login, 'recoverPassword'),
                      isLoad: state is LoadingState,
                      isDisabled: !canSend.value,
                      onTap: () {
                        resetPasswordBloc.resetPassword(
                          email: emailController.text,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validateCanSend() {
    if (emailController.text.isNotEmpty &&
        EmailValidator.isValid(emailController.text)) {
      canSend.value = true;
    } else {
      canSend.value = false;
    }
  }
}
