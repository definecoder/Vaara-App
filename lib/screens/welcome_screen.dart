import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              100.heightBox,
              appLogoWidget(200, 200),
              50.heightBox,
              "Welcome"
                  .text
                  .fontFamily('Poppins')
                  .black
                  .size(40)
                  .fontWeight(FontWeight.bold)
                  .make(),
              10.heightBox,
              "Rent everything".text.color(Colors.blueGrey).size(20).make(),
              "near you...".text.color(Colors.blueGrey).size(20).make(),
              40.heightBox,
              MyButton().box.width(context.width - 70).roundedFull.make(),
            ],
          ),
        ),
      ),
    );
  }
}
