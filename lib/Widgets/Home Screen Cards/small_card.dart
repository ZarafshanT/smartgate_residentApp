import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallCard extends StatelessWidget {
  final String? text;
  final String? iconPath;
  final double? iconHeight, iconWidth;

  const SmallCard(
      {super.key,
      required this.text,
      required this.iconPath,
      this.iconHeight,
      this.iconWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, top: 16.h, bottom: 22.h),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13.w,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0, 3),
              blurRadius: 4.r,
              spreadRadius: 0.3)
        ], color: Colors.white, borderRadius: BorderRadius.circular(28.r)),
        height: 47.h,
        child: Row(
          children: [
            Text(
              text!,
              textAlign: TextAlign.center,
              style: GoogleFonts.ubuntu(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Color(0xff9A9B9E)),
            ),
            SizedBox(width: 17.w),
            Container(
              height: iconHeight,
              width: iconWidth,
              child: SvgPicture.asset(iconPath!),
            ),
          ],
        ),
      ),
    );
  }
}
