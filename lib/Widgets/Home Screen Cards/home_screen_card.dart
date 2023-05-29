import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Constants/constants.dart';

class HomeScreenCard extends StatelessWidget {
  final String? heading;
  final String? description;
  final String? iconPath;
  final String? type;
  final void Function()? onTap;

  const HomeScreenCard(
      {super.key,
      required this.heading,
      required this.description,
      required this.iconPath,
      required this.type,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                // Customize the shadow color
                offset: Offset(0, 2),
                // Specify the offset of the shadow
                blurRadius: 4.r,
                // Adjust the blur radius to control the intensity of the shadow
                spreadRadius: 0.3
                    .r, // Adjust the spread radius to control the size of the shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8.r)), // Example color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            6.h.ph,
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  6.w.pw,
                  Image.asset(iconPath!, width: 30.w),
                  6.w.pw,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      heading!,
                      style: GoogleFonts.ubuntu(
                          color: HexColor('#222741'),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
            6.h.ph,
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                description!,
                style: GoogleFonts.ubuntu(
                    color: HexColor('#8A8A8A'),
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
