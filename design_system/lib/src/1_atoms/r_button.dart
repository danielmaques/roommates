import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RButton extends StatelessWidget {
  const RButton({
    super.key,
    this.textColor,
    this.backgroundColor,
    this.icon = '',
    this.isLoad = false,
    this.isDisabled = false,
    required this.text,
    required this.onTap,
  });

  final Color? textColor;
  final Color? backgroundColor;
  final String icon;
  final String text;
  final Function()? onTap;
  final bool isLoad;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoad ? null : onTap,
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDisabled
              ? const Color(0xFF708FDC)
              : backgroundColor ?? RColors.getBlue(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: icon == ''
            ? Center(
                child: isLoad
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(RColors.getWhite()),
                        ),
                      )
                    : Text(
                        text,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textColor ?? RColors.getWhite(),
                        ),
                      ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: isLoad
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              RColors.getMidnightBlue()),
                        ),
                      )
                    : Row(
                        children: [
                          SvgPicture.asset(icon),
                          const Spacer(),
                          Text(
                            text,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: RColors.getGreyBlue(),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
              ),
      ),
    );
  }
}
