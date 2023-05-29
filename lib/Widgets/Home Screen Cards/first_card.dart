import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstCard extends StatefulWidget {
  const FirstCard({
    super.key,
  });

  @override
  State<FirstCard> createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 162.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFF9900), Color(0xffD83030)],
          ),
          borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffFFFFFF).withOpacity(0.3),
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontFamily: 'ubuntu',
                          color: Color(0xffF7F8FD),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Color(0xffF7F8FD),
                      ),
                      suffixIcon: Image.asset('assets/More Circle.png'))),
              SizedBox(
                height: 11.51.h,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For any sevice support",
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Color(0xffFFFFFF)),
                        ),
                        Text(
                          "call us on xxx-xxxxxx",
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Color(0xff000000)),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Or",
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Color(0xff433F3F)),
                        ),
                        Text(
                          "Email us",
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Color(0xffFFFFFF)),
                        ),
                        Text(
                          "usAbc@gmail.com",
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Color(0xff000000)),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/home_vector.svg",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
