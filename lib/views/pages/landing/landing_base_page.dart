import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_assignment/views/pages/ask_email/ask_email_page.dart';
import 'package:todo_list_assignment/views/pages/ask_icloud/ask_icloud_landing_page.dart';
import 'package:todo_list_assignment/views/pages/landing_page_five/landing_page_five.dart';
import 'package:todo_list_assignment/views/pages/landing_page_four/landing_page_four.dart';
import 'package:todo_list_assignment/views/pages/landing_page_one/landing_page_one.dart';
import 'package:todo_list_assignment/views/pages/landing_page_six/landing_page_six.dart';
import 'package:todo_list_assignment/views/pages/landing_page_three/landing_page_three.dart';
import 'package:todo_list_assignment/views/pages/landing_page_two/landing_page_two.dart';

class LandingBasePage extends StatefulWidget {
  @override
  _LandingBasePageState createState() => _LandingBasePageState();
}

class _LandingBasePageState extends State<LandingBasePage> {
  double currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            pageSnapping: true,
            onPageChanged: (value) {
              setState(() {
                currentIndexPage = value.toDouble();
              });
            },
            children: [
              LandingPageOne(),
              LandingPageTwo(),
              LandingPageThree(),
              LandingPageFour(),
              LandingPageFive(),
              LandingPageSix(),
              ICloudLandingPage(),
              AskEmailPage(),
            ],
          ),
          currentIndexPage == 0 || currentIndexPage==6 ||currentIndexPage==7
              ? Container():Container(
                  margin: EdgeInsets.only(top: Get.height * 0.4),
                  width: double.infinity,
                  child:
                      DotsIndicator(dotsCount: 6, position: currentIndexPage),
                )

        ],
      ),
    );
  }
}
