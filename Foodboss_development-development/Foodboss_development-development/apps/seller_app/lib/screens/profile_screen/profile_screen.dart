import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/controller/business_controller/auth/profile_controller.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
import 'package:seller_app/widgets/error.dart';
import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    AuthController controllerAuth = Get.put(AuthController(), permanent: false);
    // qrCodeSectionController.qrString.value = profileController.getUser.name!;

    return SafeArea(child:
        // Obx( () {
        //   if(profileController.status == States.SUCCESS_STATE){

        Obx(() {
      if (profileController.status == States.SUCCESS_STATE) {
        return RefreshIndicator(
          onRefresh: () => profileController.getProfile(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.35,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: ThemeConfig.PRIMARY_COLOR),
                      // color: ThemeConfig.PRIMARY_COLOR,
                    ),
                    Positioned(
                      bottom: 50,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage((profileController
                                              .getUser.shopImage ==
                                          '')
                                      ? ThemeConfig.NOIMAGELINK
                                      : profileController.getUser.shopImage!),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                color: Colors.transparent,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                // padding: EdgeInsets.only(bottom: 40),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    //   height: 15,
                                    // ),
                                    MainLabelText(
                                        isWhite: true,
                                        // titleString:"Madhuvan supermarket"),
                                        titleString: profileController
                                                .getUser.shopName ??
                                            "Shop Name"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Desc(
                                        isWhite: true,
                                        alignment: TextAlign.left,
                                        descString:
                                            "${profileController.getUser.shopAddress1}, ${profileController.getUser.shopAddress2.toString() == 'null' ? '' : profileController.getUser.shopAddress2}"
                                        // '!0 Shyam sundar society Nr. Shastrinagar, Shakari Gin road'
                                        ),
                                    Desc(
                                        isWhite: true,
                                        alignment: TextAlign.left,
                                        descString:
                                            "${profileController.getUser.shopCity}, ${profileController.getUser.shopState}, ${profileController.getUser.shopPincode}")
                                    // '${profileController.getUser.uaddress ?? "B-701"} ${profileController.getUser.city ?? "Sarthak Heavens"} ${profileController.getUser.district ?? "Zundal Gandhinagar"} ${profileController.getUser.state ?? "Gujarat"}-${profileController.getUser.pincode ?? "382421"}'),

                                    // SizedBox(
                                    //   height: 20,
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleText(titleString: 'Owner'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                              radius: 40,
                              foregroundImage: NetworkImage(
                                  '${profileController.getUser.ownerImage ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jeancoutu.com%2Fen%2Fphoto%2Fphoto-related-tips%2Fsocial-media-profile-photo%2F&psig=AOvVaw1hrfyX4MfjUAXYZjGqTmPv&ust=1648723923093000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMD907DV7fYCFQAAAAAdAAAAABAD"}')),
                          // Container(
                          //     width: 100.0,
                          //     height: 100.0,
                          //     decoration: const BoxDecoration(
                          //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          //       color: Colors.redAccent,
                          //     ),
                          //     child: const Image(
                          //       image: AssetImage('assets/images/profile_pic.jpg'),
                          //     )),
                          SizedBox(
                            width: size.height * 0.03,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(
                                    titleString:
                                        profileController.getUser.name ??
                                            "Owner Name"),
                                GestureDetector(
                                  onTap: () {
                                    launch(
                                        'tel://${profileController.getUser.phone}');
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Desc(
                                      descString:
                                          profileController.getUser.phone ??
                                              "8238010502"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ThemeConfig.BORDERRADIUS_MIN),
                                color: ThemeConfig.PRIMARY_COLOR,
                              ),
                              child: LabelText(
                                isWhite: true,
                                titleString:
                                    "Minimum order amount - \u{20B9} ${profileController.getUser.minimumOrderPrice}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      QRcodeSection(
                        size: size,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleText(titleString: 'Store Timing'),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          day(profileController.getUser.openDays!.monday!,
                              'Monday'),
                          day(profileController.getUser.openDays!.tuesday!,
                              'Tuesday'),
                          day(profileController.getUser.openDays!.wednesday!,
                              'Wednesday'),
                          day(profileController.getUser.openDays!.thursday!,
                              'Thrusday'),
                          day(profileController.getUser.openDays!.friday!,
                              'Friday'),
                          day(profileController.getUser.openDays!.saturday!,
                              'Saturday'),
                          day(profileController.getUser.openDays!.sunday!,
                              'Sunday'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                  text: 'Logout',
                                  op: () {
                                    controllerAuth.logout();
                                  },
                                  type: 'filled'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        if (profileController.status == States.ERROR_STATE) {
          return ErrorCard(
              message: "Profile not found!, try again later",
              myFunction: profileController.getProfile,
              refresh: true);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    }));
  }

  Visibility day(bool isVisible, String day) {
    return Visibility(
      visible: isVisible,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: ThemeConfig.WHITE_COLOR),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(titleString: day),
            Desc(
                descString:
                    '${profileController.getUser.openedAt} - ${profileController.getUser.closedAt}')
          ],
        ),
      ),
    );
  }
}

class QrCodeSectionController extends GetxController {
  // String st;
  // QrCodeSectionController(this.st);

  var qrString = ''.obs;

  onChangeQr(val) {
    qrString.value = val;
  }

  @override
  void onInit() {
    // print(qrString);
    // qrString.value = st;
    // TODO: implement onInit
    super.onInit();
  }
}

class QRcodeSection extends StatelessWidget {
  QRcodeSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  QrCodeSectionController qrCodeSectionController =
      Get.find<QrCodeSectionController>();
  ProfileController profileController = Get.find<ProfileController>();
  Widget build(BuildContext context) {
    var _state = States.INITIAL_STATE.obs;

    Future<void> scanQR() async {
      print('here1');

      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        print('here');
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        print(barcodeScanRes);
        if (barcodeScanRes.contains('@')) {
          profileController.updateQr(barcodeScanRes).then((value) {
            if (value) {
              qrCodeSectionController.onChangeQr(barcodeScanRes);
              _state.value = States.SUCCESS_STATE;
            }
          });
        } else {
          CustomSnackbar.errorSnackbar2('QR code invalid');
        }
        // launch(barcodeScanRes);
      } catch (e) {
        print(e);
      }
    }

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
          color: ThemeConfig.WHITE_COLOR),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelText(titleString: 'QR Code'),
                IconButton(
                  onPressed: () async {
                    await scanQR();
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner_outlined,
                  ),
                ),
              ],
            ),
          ),
          // Image.asset(
          //   'assets/images/qrCode.png',
          //   width: double.infinity,
          // ),
          Obx(() {
            print(qrCodeSectionController.qrString.value);
            if (qrCodeSectionController.qrString.value != "" &&
                qrCodeSectionController.qrString.value != "null") {
              return Column(
                children: [
                  ImageShower(
                      size: size, url: qrCodeSectionController.qrString.value),
                  LabelText(
                      titleString: qrCodeSectionController.qrString.value
                          .split('=')[1]
                          .split("&")[0])
                ],
              );
            } else {
              // return Text('dataa');
              return Container();
            }
          }),
          // Obx(() => Column(
          //       children: [
          //         ImageShower(
          //             size: size, url: qrCodeSectionController.qrString.value),
          //         LabelText(
          //             titleString: qrCodeSectionController.qrString.value
          //                 .split('=')[1]
          //                 .split("&")[0])
          //       ],
          //     )),
        ],
      ),
    );
  }
}

class ImageShower extends StatelessWidget {
  final String url;
  const ImageShower({
    Key? key,
    required this.size,
    required this.url,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Hero(
        tag: url,
        child: ClipRRect(
            borderRadius:
                BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
            child: QrImage(
              data: url,
              version: QrVersions.auto,
              // embeddedImage: const AssetImage(
              //   'assets/images/finalLogo.png',
              // ),
            )
            // Image(
            //     image: NetworkImage(
            //       url,
            //     ),
            //     loadingBuilder: (context, child, loadingProgress) {
            //       if (loadingProgress == null) return child;
            //       return Container(
            //         height: 300,
            //         child: Center(
            //           child: CircularProgressIndicator(
            //             color: ThemeConfig.PRIMARY_COLOR,
            //             value: loadingProgress.expectedTotalBytes != null
            //                 ? loadingProgress.cumulativeBytesLoaded /
            //                     loadingProgress.expectedTotalBytes!
            //                 : null,
            //           ),
            //         ),
            //       );
            //     }),
            ),
      ),
    );
  }
}
