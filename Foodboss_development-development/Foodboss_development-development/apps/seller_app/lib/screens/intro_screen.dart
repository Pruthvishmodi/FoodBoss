import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/label_text.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'dart:math' as math;

class PageCntrl extends GetxController {
  var selectedIndex = 0.obs;
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/veg.jpeg',
      'assets/images/bakery.png',
      'assets/images/507.png'
    ];
    Size size = MediaQuery.of(context).size;

    PageCntrl pageCntrl = Get.put(PageCntrl());
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ThemeConfig.FORM_COLOR, ThemeConfig.WHITE_COLOR],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)),
        child: Stack(
          children: [
            PageView(
              onPageChanged: ((value) {
                pageCntrl.selectedIndex.value = value;
              }),
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        bottom: 0,
                        right: -50,
                        child: Image.asset(
                          images[0],
                          width: size.width,
                        )),
                  ]),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Positioned(
                        bottom: -50,
                        right: -35,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image.asset(
                            images[1],
                            width: size.width,
                          ),
                        ))
                  ]),
                ),
                Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Image.asset(
                              images[2],
                              width: size.width,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(
                  top: 200,
                  left: 30,
                  right: 100,
                ),
                height: 420,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      child: IndexedStack(
                        index: pageCntrl.selectedIndex.value,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Heading('Welcome', ThemeConfig.MAIN_TEXT_COLOR),
                                SizedBox(
                                  height: 10,
                                ),
                                Desc(
                                    descString:
                                        'Welcome to the Food Boss, Together, let\'s build online super store!'),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Heading('What we offer',
                                    ThemeConfig.MAIN_TEXT_COLOR),
                                SizedBox(
                                  height: 10,
                                ),
                                Desc(
                                    descString:
                                        'Expand your business 10x with our USP features and support.'),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Heading('Getting started',
                                    ThemeConfig.MAIN_TEXT_COLOR),
                                SizedBox(
                                  height: 10,
                                ),
                                Desc(
                                    descString:
                                        'Let\'s get into the digital world'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 10,
                              width: pageCntrl.selectedIndex == 0 ? 15 : 10,
                              decoration: BoxDecoration(
                                  color: pageCntrl.selectedIndex == 0
                                      ? ThemeConfig.PRIMARY_COLOR
                                      : ThemeConfig.WHITE_COLOR,
                                  borderRadius: BorderRadius.circular(
                                      ThemeConfig.BORDERRADIUS_MAX),
                                  border: Border.all(
                                      width: 1,
                                      color: ThemeConfig.PRIMARY_COLOR))),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 10,
                            width: pageCntrl.selectedIndex == 1 ? 15 : 10,
                            decoration: BoxDecoration(
                                color: pageCntrl.selectedIndex == 1
                                    ? ThemeConfig.PRIMARY_COLOR
                                    : ThemeConfig.WHITE_COLOR,
                                borderRadius: BorderRadius.circular(
                                    ThemeConfig.BORDERRADIUS_MAX),
                                border: Border.all(
                                    width: 1,
                                    color: ThemeConfig.PRIMARY_COLOR)),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 10,
                            width: pageCntrl.selectedIndex == 2 ? 15 : 10,
                            decoration: BoxDecoration(
                                color: pageCntrl.selectedIndex == 2
                                    ? ThemeConfig.PRIMARY_COLOR
                                    : ThemeConfig.WHITE_COLOR,
                                borderRadius: BorderRadius.circular(
                                    ThemeConfig.BORDERRADIUS_MAX),
                                border: Border.all(
                                    width: 1,
                                    color: ThemeConfig.PRIMARY_COLOR)),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: pageCntrl.selectedIndex.value == 2 ? 250 : 100,
                      child: pageCntrl.selectedIndex.value == 2
                          ? Row(
                              children: [
                                Expanded(
                                  child: PrimaryButton(
                                    text: 'Getting Started',
                                    op: () {
                                      Get.toNamed("/permit");
                                    },
                                    type: 'filled',
                                  ),
                                ),
                              ],
                            )
                          : PrimaryButton(
                              text: 'Skip',
                              op: () {
                                Get.toNamed("/permit");
                              },
                              type: 'outlined',
                            ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
