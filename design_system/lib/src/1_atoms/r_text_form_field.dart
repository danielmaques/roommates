import 'package:design_system/design_system.dart';
import 'package:design_system/src/0_core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RTextFormField extends StatefulWidget {
  const RTextFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
  });

  final Icon? prefixIcon;
  final String? hintText;

  @override
  State<RTextFormField> createState() => _RTextFormFieldState();
}

class _RTextFormFieldState extends State<RTextFormField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        autocorrect: true,
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: RColors.getGreyBlue(),
          ),
          prefixIcon: widget.prefixIcon,
          errorMaxLines: 2,
          errorStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.red,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          fillColor: RColors.getAliceBlue(),
          filled: true,
        ),
      ),
    );
  }
}
