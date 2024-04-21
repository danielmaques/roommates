import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roommate/core/helper/context_extension.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  const HomeAppBar({
    super.key,
    required this.name,
    this.notification = false,
  });

  final String name;
  final bool notification;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: RColors.getBlue(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Iconsax.location5,
                  color: Colors.white,
                ),
              ),
              10.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translate('home', 'hello'),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: RColors.getGreyBlue(),
                    ),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: RColors.getGreyBlue(),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: notification
                    ? Icon(
                        Iconsax.notification5,
                        color: RColors.getBlue(),
                      )
                    : Icon(
                        Iconsax.notification,
                        color: RColors.getGreyBlue(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
