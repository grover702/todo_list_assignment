import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_assignment/consts/app_images.dart';
import 'package:todo_list_assignment/views/widgets/rounded_edge_button.dart';

class ICloudLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(image: AssetImage(AppImages.CLOUD),height: 200,
              width: 250,),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Use',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                    text: ' iCloud?',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Storing your lists in iCloud allows you to keep your data in syn across your iPhone, iPad and Mac',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedEdgeButton(
                      height: 51,
                      color: Colors.white,
                      text: 'Not Now',
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      onPressed: (context) {},
                      buttonRadius: 12,
                      textFontSize: 16,
                      context: context),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: RoundedEdgeButton(
                      height: 51,
                      color: Colors.white,
                      text: 'Use iCloud',
                      textFontWeight: FontWeight.w700,
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      buttonRadius: 12,
                      textFontSize: 16,
                      onPressed: (context) {},
                      context: context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
