import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class RAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  const RAppBar({
    super.key,
    this.onBackButtonTap,
    this.actions,
    this.title = '',
  });

  final Function()? onBackButtonTap;
  final List<Widget>? actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: false,
      context: context,
      child: Padding(
        padding: EdgeInsets.zero,
        child: AppBar(
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: actions,
          leading: onBackButtonTap != null
              ? InkWell(
                  onTap: onBackButtonTap,
                  borderRadius: BorderRadius.circular(15),
                  child: Ink(
                    padding: const EdgeInsets.all(21),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Iconsax.arrow,
                      color: Color(0xFF06132D),
                      size: 10,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
