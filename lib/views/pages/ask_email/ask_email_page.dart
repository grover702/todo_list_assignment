import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_assignment/consts/app_images.dart';
import 'package:todo_list_assignment/views/pages/home/home_page.dart';
import 'package:todo_list_assignment/views/widgets/form_input_with_hint_on_top.dart';
import 'package:todo_list_assignment/views/widgets/rounded_edge_button.dart';

class AskEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Text(
              'Sign up to the newsletter, and\nunlock a theme for your lists',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              child: Image(
                image: AssetImage(AppImages.EMAIL),
                height: 200,
                width: 250,
              ),
            ),
            FormInputWithHint(
              label: '',
              onChanged: () {},
              hintText: 'Email Address',
              controller: TextEditingController(),
              fillColor: Colors.grey.shade500,
              focusNode: FocusNode(),
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
                      text: 'Skip',
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      onPressed: (value) {},
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
                      text: 'Join',
                      textFontWeight: FontWeight.w700,
                      borderColor: Colors.black,
                      textColor: Colors.black,
                      buttonRadius: 12,
                      textFontSize: 16,
                      onPressed: (context) {
                        Get.to(() => TestPage());
                      },
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
