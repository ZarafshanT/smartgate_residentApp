import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:userapp/Widgets/Home%20Screen%20Cards/services_cards.dart';

import '../../../Routes/set_routes.dart';
import '../../../Widgets/Home Screen Cards/first_card.dart';
import '../../../Widgets/Home Screen Cards/home_screen_text_heading.dart';
import '../../../Widgets/Home Screen Cards/small_card.dart';
import '../../../Widgets/Loader/loader.dart';
import '../Model/DiscussionRoomModel.dart';
// import 'package:jazzcash_flutter/jazzcash_flutter.dart';

class HomeScreen extends GetView {
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future:
                        //Family member Check
                        _homeScreenController.user.roleId == 5
                            ? _homeScreenController.loginResidentDetails(
                                userid: _homeScreenController.user.residentid!,
                                token: _homeScreenController.user.bearerToken!)
                            : // Login user Resident
                            _homeScreenController.loginResidentDetails(
                                userid: _homeScreenController.user.userId!,
                                token: _homeScreenController.user.bearerToken!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data.status == 0
                            ? SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Center(
                                        child: SvgPicture.asset(
                                      'assets/verification.svg',
                                      width: 300,
                                    )),
                                    Text(
                                      "please be patient !",
                                      style: GoogleFonts.ubuntu(
                                          color: HexColor('#A5AAB7'),
                                          fontSize: 38.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "You are under Verification Process!",
                                      style: GoogleFonts.ubuntu(
                                          color: HexColor('#A5AAB7'),
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 52.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                "Welcome Home, John William ",
                                                style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff130F26))),
                                          ),
                                          Stack(children: [
                                            CircleAvatar(
                                              radius: 35.r,
                                              backgroundImage: AssetImage(
                                                'assets/user.png',
                                              ),
                                            ),
                                            Positioned(
                                              top: 10.h,
                                              right: 0.w,
                                              child: Container(
                                                height: 12,
                                                width: 12,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xffFF9900),
                                                          Color(0xffD83030)
                                                        ])),
                                              ),
                                            )
                                          ]),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _controller,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FirstCard(),
                                          SizedBox(width: 2.w),
                                          FirstCard(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 116.w,
                                        right: 191.w,
                                      ),
                                      child: SmoothPageIndicator(
                                        controller: _controller,
                                        count: 3,
                                        effect: ExpandingDotsEffect(
                                            dotWidth: 7.w,
                                            dotHeight: 7.h,
                                            dotColor: Color(0xffFF9900)
                                                .withOpacity(0.3),
                                            activeDotColor: Color(0xffFF9900)),
                                      ),
                                    ),

                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          SmallCard(
                                            text: 'Cab',
                                            iconPath: 'assets/cab_icon.svg',
                                            iconHeight: 16.h,
                                            iconWidth: 42.w,
                                          ),
                                          SmallCard(
                                              iconWidth: 32.w,
                                              iconHeight: 20.92.h,
                                              text: "Delivery",
                                              iconPath:
                                                  'assets/delivery_icon.svg'),
                                          SmallCard(
                                              iconHeight: 20.26.h,
                                              iconWidth: 18.1.w,
                                              text: "Guest",
                                              iconPath:
                                                  "assets/guest_icon.svg"),
                                        ],
                                      ),
                                    ),

                                    HomeHeading(text: 'Service'),

                                    SizedBox(height: 15.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        children: [
                                          ServiceCards(
                                              description:
                                                  'Complaint for your Apartment',
                                              heading: 'Complaint',
                                              iconPath: 'assets/report 1.svg',
                                              onTap: () {
                                                Get.offNamed(adminreports,
                                                    arguments: [
                                                      _homeScreenController
                                                          .user,
                                                      snapshot.data
                                                    ]);
                                              }),
                                          SizedBox(
                                            width: 27.37.w,
                                          ),
                                          ServiceCards(
                                            description:
                                                'You can Pre approve your visitor',
                                            heading: 'Pre Approve Entry',
                                            iconPath: 'assets/team1.svg',
                                            onTap: () {
                                              Get.offNamed(
                                                  preapproveentryscreen,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data
                                                  ]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.29.h,
                                    ),
                                    HomeHeading(text: 'Events'),

                                    SizedBox(height: 15.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        children: [
                                          ServiceCards(
                                            description: 'You can view events',
                                            heading: 'Society Events',
                                            iconPath: 'assets/event 1.svg',
                                            onTap: () {
                                              Get.offNamed(eventsscreen,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data
                                                  ]);
                                            },
                                          ),
                                          SizedBox(
                                            width: 27.37.w,
                                          ),
                                          ServiceCards(
                                            description:
                                                'Announcement from Admin',
                                            heading: 'Notice Board',
                                            iconPath: 'assets/post-it 1.svg',
                                            onTap: () {
                                              Get.offNamed(noticeboardscreen,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data
                                                  ]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),

                                    _homeScreenController.user.roleId == 5
                                        ? Container()
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w),
                                            child: Row(
                                              children: [
                                                ServiceCards(
                                                  description:
                                                      'Add your family member',
                                                  heading: 'Family Members',
                                                  iconPath:
                                                      "assets/report_icon.png",
                                                  onTap: () {
                                                    Get.offNamed(
                                                        viewfamilymember,
                                                        arguments: [
                                                          _homeScreenController
                                                              .user,
                                                          snapshot.data
                                                        ]);
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 27.37.w,
                                                ),
                                                ServiceCards(
                                                  description:
                                                      'Market Place Buy And Sell',
                                                  heading: 'Market Place',
                                                  iconPath:
                                                      'assets/report_icon.png',
                                                  onTap: () {
                                                    print(snapshot.data);

                                                    Get.offNamed(
                                                        marketPlaceScreen,
                                                        arguments: [
                                                          _homeScreenController
                                                              .user,
                                                          snapshot.data
                                                        ]);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),

                                    SizedBox(
                                      height: 15.29.h,
                                    ),
                                    HomeHeading(text: "Conversations"),

                                    SizedBox(height: 15.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        children: [
                                          ServiceCards(
                                            description:
                                                'Chat with Neighbours/Gatekeepers',
                                            heading: 'Chats',
                                            iconPath:
                                                'assets/undraw_share_opinion_re_4qk7.svg',
                                            onTap: () {
                                              print(snapshot.data.runtimeType);

                                              Get.offNamed(
                                                  chatavailbilityscreen,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data
                                                  ]);
                                            },
                                          ),
                                          SizedBox(
                                            width: 27.37.w,
                                          ),
                                          ServiceCards(
                                            description:
                                                'Share your opinions here',
                                            heading: 'Discussion Form',
                                            iconPath:
                                                'assets/undraw_connected_re_lmq2.svg',
                                            onTap: () async {
                                              DiscussionRoomModel
                                                  discussionRoomModel =
                                                  await _homeScreenController
                                                      .createChatRoomApi(
                                                          token:
                                                              _homeScreenController
                                                                  .user
                                                                  .bearerToken!,
                                                          subadminid: snapshot
                                                              .data.subadminid);
                                              Get.offNamed(discussion_form,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data,
                                                    discussionRoomModel
                                                  ]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.29.h,
                                    ),
                                    HomeHeading(text: "History"),

                                    SizedBox(height: 15.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        children: [
                                          ServiceCards(
                                            description:
                                                'Your Complaint History',
                                            heading: 'Complain History',
                                            iconPath: 'assets/file 3.png',
                                            onTap: () {
                                              // _homeScreenController.payment();
                                              print(_homeScreenController
                                                  .user.userId!);
                                              print(_homeScreenController
                                                  .user.firstName!);
                                              print(snapshot.data.residentid);
                                              Get.offNamed(reportshistoryscreen,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data
                                                  ]);
                                            },
                                          ),
                                          SizedBox(
                                            width: 27.37.w,
                                          ),
                                          ServiceCards(
                                            description: ' Your Guest History',
                                            heading: 'Guest History',
                                            iconPath: 'assets/file 3.png',
                                            onTap: () {
                                              Get.offNamed(guestshistoryscreen,
                                                  arguments:
                                                      _homeScreenController
                                                          .user);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.29.h,
                                    ),
                                    HomeHeading(text: "Bills"),

                                    SizedBox(height: 15.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: Row(
                                        children: [
                                          ServiceCards(
                                            description:
                                                'Easy Pay your Monthly Bills',
                                            heading: 'Monthly Bill',
                                            iconPath: 'assets/file 3.png',
                                            onTap: () {
                                              // _homeScreenController.payment();
                                              print(_homeScreenController
                                                  .user.userId!);
                                              print(_homeScreenController
                                                  .user.firstName!);
                                              print(snapshot.data.residentid);
                                              Get.offNamed(monthly_bill,
                                                  arguments: [
                                                    _homeScreenController.user,
                                                    snapshot.data
                                                  ]);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    // MyButton(
                                    //   name: 'Pay',
                                    //   onPressed: () {
                                    //     _payViaJazzCash(context);
                                    //   },
                                    // )
                                  ],
                                ),
                              );
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Loader();
                      }
                    })
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffFF9900),
          onPressed: () {},
          child: SvgPicture.asset(
            ('assets/Plus_ic.svg'),
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 95.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    MaterialButton(
                      minWidth: 95.w,
                      onPressed: () {},
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.h, bottom: 6.5.h),
                          child: Icon(
                            Icons.home_filled,
                            color: Color(0xffFF9900),
                          ),
                        ),
                        Text(
                          'Home',
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: HexColor('#130F26')),
                        )
                      ]),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 95.w,
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 16.5.h, bottom: 6.5.h),
                              child: Icon(
                                Icons.home_filled,
                                color: Color(0xffFF9900).withOpacity(0.5),
                              ),
                            ),
                            Text(
                              'Complaint',
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.sp,
                                  color: HexColor('#130F26')),
                            )
                          ]),
                    )
                  ]),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 95.w,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.5.h, bottom: 6.5.h),
                          child: Icon(
                            Icons.home_filled,
                            color: Color(0xffFF9900).withOpacity(0.5),
                          ),
                        ),
                        Text(
                          'Report',
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: HexColor('#130F26')),
                        )
                      ]),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 95.w,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.5.h, bottom: 6.5.h),
                          child: Icon(
                            Icons.settings,
                            color: Color(0xffFF9900).withOpacity(0.5),
                          ),
                        ),
                        Text(
                          'Setting',
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: HexColor('#130F26')),
                        )
                      ]),
                    )
                  ]),
                ]),
          ),
        ),
      ),
    );
  }

// Future _payViaJazzCash(BuildContext context) async {
//   try {
//     JazzCashFlutter jazzCashFlutter = JazzCashFlutter(
//       merchantId: "MC52072",
//       merchantPassword: "1zu282w8e3",
//       integritySalt: "s8v30w3y0x",
//       isSandbox: true,
//     );
//
//     DateTime date = DateTime.now();
//
//     JazzCashPaymentDataModelV1 paymentDataModelV1 =
//         JazzCashPaymentDataModelV1(
//       ppAmount: '10',
//       ppBillReference:
//           'refbill${date.year}${date.month}${date.day}${date.hour}${date.millisecond}',
//       ppDescription: 'Product details ',
//       ppMerchantID: jazzCashFlutter.merchantId,
//       ppPassword: jazzCashFlutter.merchantPassword,
//       ppReturnURL:
//           "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction",
//     );
//
//     jazzCashFlutter
//         .startPayment(
//             paymentDataModelV1: paymentDataModelV1, context: context)
//         .then((_response) {
//       print(jsonDecode(_response));
//     });
//   } catch (err) {
//     print("Error in payment $err");
//
//     return false;
//   }
// }
}
