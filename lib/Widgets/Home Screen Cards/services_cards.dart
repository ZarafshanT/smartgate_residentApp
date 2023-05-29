import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ServiceCards extends StatelessWidget {
  final String? heading;
  final String? description;
  final String? iconPath;

  final void Function()? onTap;

  const ServiceCards(
      {super.key,
      required this.description,
      required this.heading,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145.63.w,
        height: 112.71.h,
        child: Card(
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                margin: EdgeInsets.only(
                  left: 48.w,
                  right: 47.63.w,
                ),
                child: Center(
                  child: Container(
                    height: 33.67.h,
                    width: 33.67.w,
                    child: SvgPicture.asset(iconPath!),
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xffFFFFFF).withOpacity(0.2),
                          Color(0xffFF9900).withOpacity(0.7),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              Text(
                heading!,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: HexColor('#585353')),
              ),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 8.sp,
                    color: HexColor('#8A8A8A')),
              ),
            ],
          ),
          //elevation: 1.6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }
}
