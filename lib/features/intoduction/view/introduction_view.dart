import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/intoduction/controller/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: "Quick & easy entry approval",
                image: Image.asset('assets/images/intro2.png'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'You can approve visitors, easy way to meet with just click',
                      textAlign: TextAlign.center,
                        style: ThemeText.heading2Style
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: controller.pageDecoration),
            PageViewModel(
                title: "Visitor Meeting",
                image: Image.asset(
                  'assets/images/intro1.png',
                  width: 220,
                ),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Smart tool to ensure great experience for visitors with paperless solution',
                      textAlign: TextAlign.center,
                        style: ThemeText.heading2Style
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: controller.pageDecoration),
            PageViewModel(
                title: "Visitor Analysis",
                image: Image.asset('assets/images/intro3.png'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'You can analyze visitors details in easy way',
                      textAlign: TextAlign.center,
                        style: ThemeText.heading2Style
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: controller.pageDecoration),
          ],

          onDone: () {
            Get.offAllNamed(Routes.welcome);
          },
          allowImplicitScrolling: false,
          autoScrollDuration:6000,
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(color: Colors.black54),
          ),
          next: const Text("Next",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo)),
          showBackButton: false,
          onSkip: () => Get.offAllNamed(Routes.welcome),
          done: const Text("Done",
              style: TextStyle(color: Colors.black54, fontSize: 16)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0), //size of dots
            color: Colors.grey, //color of dots
            activeSize: Size(22.0, 10.0),
            activeColor: Colors.indigo, //color of active dot
            activeShape: RoundedRectangleBorder(
              //shave of active dot
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
