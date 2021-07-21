import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_assignment/consts/app_images.dart';
import 'package:todo_list_assignment/views/widgets/slide_in_up_animation.dart';

class LandingPageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 100,
            left: 30,
            right: 30,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Pinch together vertically',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text:
                    ' to collapse your current level and navigate up',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
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
