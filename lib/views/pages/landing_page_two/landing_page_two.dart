import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_assignment/consts/app_images.dart';
import 'package:todo_list_assignment/views/widgets/slide_in_up_animation.dart';

class LandingPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: Get.height*0.3,
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Clear sorts items by',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: ' Priority',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Important items are highlighted\nat the top',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            height: Get.height*0.5,
            alignment: Alignment.bottomCenter,
            child: SlideInUp(
              from: 500,
              child: Image(
                image: AssetImage(AppImages.MOBILE_PHONE),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
