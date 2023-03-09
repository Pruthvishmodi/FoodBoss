import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/Business%20Controllers/khata_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/login_controller.dart';
import 'package:customer_app/Controller/Business%20Controllers/user_controller.dart';
import 'package:customer_app/Widgets/Text%20widgets/description_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/title_text.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Widgets/Icon tile/icon_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    LoginController loginController = Get.put(LoginController());
    KhataController khataController = Get.put(KhataController());
    print(userController.getUser.isLogedin);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeConfig.whiteColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: ThemeConfig.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SB.large(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleText(text: 'My Account'),
                        const SizedBox(
                          height: 8,
                        ),
                        LabelText(
                            text:
                                userController.getUser.phoneNumber.toString()),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),
                const DescriptionText(text: ' information'),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed("orderhistorypage");
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.history_rounded,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Order history')
                    ],
                  ),
                ),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (() {
                    Get.toNamed("/manage-address-screen");
                  }),
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.location_on_outlined,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Manage Address')
                    ],
                  ),
                ),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    userController.getFavoritesFoods();
                    userController.getFavoritesStores();
                    Get.toNamed("favroitestore", arguments: [0]);
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.store,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'My Favourites')
                    ],
                  ),
                ),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    khataController.fetchKhatas();
                    Get.toNamed('/khata-management-screen');
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.manage_accounts,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Khata Management')
                    ],
                  ),
                ),
                SB.large(),

                const DescriptionText(text: 'Others'),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed('/help-support');
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.camera_rounded,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Help & Support')
                    ],
                  ),
                ),

                // GestureDetector(
                //   behavior: HitTestBehavior.translucent,
                //   onTap: () async {
                //     try {
                //       var res = await Dio().post(
                //           'https://sandbox.bifinitypay.com/gateway-api/v1/public/open-api/connect/trade',
                //           data: {
                //             "baseCurrency": "EUR",
                //             "businessType": "BUY",
                //             "cryptoCurrency": "USDT",
                //             "fiatCurrency": "EUR",
                //             "merchantOrderId": "fffwffwedDDGRf",
                //             "merchantRedirectUrl":
                //                 "https://98eb-2401-4900-1f3f-55a4-f487-9c46-97d1-90ec.in.ngrok.io/success",
                //             "merchantUserId": "bifinity_se_004@test.com",
                //             "orderAmount": 100,
                //             "password": "1qaz@Wsx",
                //             "withdrawCryptoInfo": {
                //               "cryptoAddress":
                //                   "TUim4oJkSdZVbkV8AV9LE5NtagWVZCRUB2",
                //               "cryptoNetwork": "TRX"
                //             }
                //           },
                //           options: Options(
                //             headers: {
                //               "merchantCode": "fincrypt_test",
                //               "Content-Type": "application/json; charset=UTF-8",
                //             },
                //             method: "post",
                //           ));

                //       print(res);
                //     } catch (e) {
                //       printInfo(info: e.toString());
                //     }
                //   },
                //   child: Row(
                //     children: const [
                //       iconTile(
                //           icon: Icons.camera_rounded,
                //           color: ThemeConfig.descriptionColor),
                //       SizedBox(width: 20),
                //       LabelText(text: 'Help & Suapfodsf pport')
                //     ],
                //   ),
                // ),
                // SB.medium(),
                // GestureDetector(
                //   behavior: HitTestBehavior.translucent,
                //   onTap: () {
                //     Get.toNamed('/about-us');
                //     // setState(() {
                //     //   _showMyDialog();
                //     // }
                //     // );
                //   },
                //   child: Container(
                //     // width: MediaQuery.of(context).size.width,
                //     // color: ThemeConfig.whiteColor,
                //     child: Row(
                //       children: const [
                //         iconTile(
                //             icon: Icons.info_outline,
                //             color: ThemeConfig.descriptionColor),
                //         SizedBox(width: 20),
                //         LabelText(text: 'About us'),
                //       ],
                //     ),
                //   ),
                // ),
                SB.medium(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    launchUrl(
                        Uri.parse(
                            'https://play.google.com/store/apps/details?id=com.foodboss.user'),
                        mode: LaunchMode.externalApplication);
                    // setState(() {
                    //   _showMyDialog();
                    // }
                    // );
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    // color: ThemeConfig.whiteColor,
                    child: Row(
                      children: const [
                        iconTile(
                            icon: Icons.star_border_outlined,
                            color: ThemeConfig.descriptionColor),
                        SizedBox(width: 20),
                        LabelText(text: 'Rate us'),
                      ],
                    ),
                  ),
                ),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    Share.share(
                      'Download Foodboss: Grocery Ka Boss application to your android/IOS device from the below given link: \n\nhttps://foodboss.page.link/open \nDownload NOW!!!',
                      subject: 'Foodboss',
                    );
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.share_outlined,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Share the app')
                    ],
                  ),
                ),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed('/legal');
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.announcement_rounded,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Terms & Condition')
                    ],
                  ),
                ),
                SB.medium(),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed('/privacy'); //todo : add privacy page
                  },
                  child: Row(
                    children: const [
                      iconTile(
                          icon: Icons.announcement_rounded,
                          color: ThemeConfig.descriptionColor),
                      SizedBox(width: 20),
                      LabelText(text: 'Privacy policy')
                    ],
                  ),
                ),
                SB.medium(),

                // GestureDetector(
                //   behavior: HitTestBehavior.translucent,
                //   onTap: () {
                //     Get.toNamed('/video-help');
                //   },
                //   child: Row(
                //     children: const [
                //       iconTile(
                //           icon: Icons.help_center_sharp,
                //           color: ThemeConfig.descriptionColor),
                //       SizedBox(width: 20),
                //       LabelText(text: 'Videos for help')
                //     ],
                //   ),
                // ),
                // SB.medium(),

                Obx(
                  () => Visibility(
                    visible: userController.getUser.isLogedin!,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        loginController.onLogout();
                      },
                      child: Row(
                        children: const [
                          iconTile(
                              icon: Icons.person_outline_outlined,
                              color: ThemeConfig.descriptionColor),
                          SizedBox(width: 20),
                          LabelText(text: 'Logout')
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                // Obx(
                //   () => Visibility(
                //     visible: userController.getUser.isLogedin!,
                //     child: GestureDetector(
                //       behavior: HitTestBehavior.translucent,
                //       onTap: () {
                //         // loginController.onLogout();
                //         Get.toNamed('/test');
                //       },
                //       child: Row(
                //         children: const [
                //           iconTile(
                //               icon: Icons.person_outline_outlined,
                //               color: ThemeConfig.descriptionColor),
                //           SizedBox(width: 20),
                //           LabelText(text: 'test')
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
