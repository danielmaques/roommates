import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roommate/core/helper/context_extension.dart';
import 'package:roommate/core/helper/validator/name_validator.dart';

import '../../../../core/helper/validator/email_validator.dart';
import '../../../../core/states/base_page_state.dart';
import '../bloc/create_user_email_password_bloc.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late CreateUserWithEmailAndPasswordBloc createUserWithEmailAndPasswordBloc;

  final String login = 'login';
  final canSend = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    createUserWithEmailAndPasswordBloc = Modular.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.getWhite(),
      appBar: const RAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.translate(login, 'createAccount'),
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: RColors.getGreyBlue(),
              ),
            ),
            40.h,
            RTextFormField(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: const Icon(Iconsax.personalcard),
                validator: (value) {
                  if (!NameValidator.isValid(value.toString())) {
                    return context.translate('validator', 'name');
                  }
                  return null;
                }),
            20.h,
            RTextFormField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: const Icon(Iconsax.sms),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!EmailValidator.isValid(value.toString())) {
                    return context.translate('validator', 'email');
                  }
                  return null;
                }),
            20.h,
            RTextFormField(
              controller: passwordController,
              hintText: 'Password',
              prefixIcon: const Icon(Iconsax.lock),
              isPassword: true,
              validator: (value) {
                if (value!.length < 6) {
                  return context.translate('validator', 'password');
                }
                return null;
              },
            ),
            20.h,
            BlocListener(
              bloc: createUserWithEmailAndPasswordBloc,
              listener: (context, state) {
                if (state is SuccessState) {
                  Modular.to.navigate('/home/');
                }
              },
              child: BlocBuilder(
                bloc: createUserWithEmailAndPasswordBloc,
                builder: (context, state) {
                  return ValueListenableBuilder(
                    valueListenable: canSend,
                    builder: (context, value, child) {
                      return RButton(
                        text: context.translate(login, 'createAccount'),
                        isLoad: state is LoadingState,
                        onTap: () {
                          createUserWithEmailAndPasswordBloc
                              .createUserWithEmailAndPassword(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            20.h,
            Center(
              child: Text(
                context.translate(login, 'or'),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: RColors.getMidnightBlue(),
                ),
              ),
            ),
            20.h,
            RButton(
              text: context.translate(login, 'google'),
              icon: 'assets/icons/google.svg',
              backgroundColor: RColors.getWhite(),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Text(
        context.translate(login, 'terms'),
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFF54584),
        ),
      ),
    );
  }

  void _validateCanSend() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      canSend.value = true;
    } else {
      canSend.value = false;
    }
  }
}
