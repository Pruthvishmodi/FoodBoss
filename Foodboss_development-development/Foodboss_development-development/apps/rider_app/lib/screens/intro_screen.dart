import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rider_app/config/config.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/food_boss_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      done: Expanded(
          child: FoodBossButtons(
            width: 100.0,
            height: 50.0,
              text: 'Done',
              color: Conifg.primaryColor,
              bradius: 25.0,
              textcolor: Colors.white,
              fsize: Conifg.subTitleSize,
              op: () {},
              isIcon: false,
              isDisabled: false,
              isLoading: false,
              type: 'filled',
              bwidth: 1.0)),
      // Container(
      //   width: 150.00,
      //   height: 50.00,
      //   decoration: BoxDecoration(
      //     color: ThemeConfig.DISTRUCTIVE_COLOR,
      //     borderRadius: BorderRadius.circular(24),
      //   ),
      //   child: Center(
      //     child: Text(
      //       'Get Started',
      //       style: TextStyle(
      //           color: ThemeConfig.WHITE_COLOR,
      //           fontSize: ThemeConfig.SUB_TITLE_SIZE,
      //           fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
      onDone: () {},
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(
            color: ThemeConfig.SECONDARY_TEXT_COLOR,
            fontSize: ThemeConfig.SUB_TITLE_SIZE,
            fontWeight: FontWeight.bold),
      ),
      onSkip: () {},
      next: const Icon(
        Icons.arrow_forward_rounded,
        color: ThemeConfig.MAIN_TEXT_COLOR,
      ),
      pages: [
        PageViewModel(
            titleWidget: const Text(
              'Get Started',
              style: TextStyle(
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  fontSize: ThemeConfig.HEADING_SIZE,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            bodyWidget: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.00),
              child: Text(
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                    color: ThemeConfig.SECONDARY_TEXT_COLOR,
                    fontSize: ThemeConfig.DESCRIPTION_SIZE,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.00),
                textAlign: TextAlign.center,
              ),
            ),
            image: const Center(
              child: Image(image: AssetImage('assets/images/intro-01.png')),
            )),
        PageViewModel(
            titleWidget: const Text(
              'Join Community',
              style: TextStyle(
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  fontSize: ThemeConfig.HEADING_SIZE,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            bodyWidget: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: TextStyle(
                  color: ThemeConfig.SECONDARY_TEXT_COLOR,
                  fontSize: ThemeConfig.DESCRIPTION_SIZE,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.00,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            image: const Center(
              child: Image(image: AssetImage('assets/images/intro-01.png')),
            )),
        PageViewModel(
          titleWidget: const Text(
            'Enjoy Your Day',
            style: TextStyle(
                color: ThemeConfig.MAIN_TEXT_COLOR,
                fontSize: ThemeConfig.HEADING_SIZE,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          bodyWidget: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(
                color: ThemeConfig.SECONDARY_TEXT_COLOR,
                fontSize: ThemeConfig.DESCRIPTION_SIZE,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.00,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          image: const Center(
            child: Image(image: AssetImage('assets/images/intro-01.png')),
          ),
        ),
      ],
      dotsDecorator: DotsDecorator(
        color: ThemeConfig.OUTLINE_COLOR,
        activeColor: ThemeConfig.PRIMARY_COLOR,
        activeSize: const Size(20.00, 10.00),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      freeze: true,
    );
  }
}
