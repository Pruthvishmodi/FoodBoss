import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:seller_app/infrastructure/auth_call.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/heading_widget.dart';

class PermissionController extends GetxController {
  var locationGranted = false.obs;
  var cameraGranted = false.obs;
  var mediaGranted = false.obs;

  requestLocationPermission() async {
    if (!locationGranted.value) {
      Permission.location.request().then((value) {
        if (value.isGranted) {
          locationGranted.value = true;
          Get.toNamed('/permit3');
        } else {
          Get.defaultDialog(
              title: 'You need to allow location Permission',
              middleText:
                  'GOTO : settings -> Apps -> FoodBoss -> Allow Location Access',
              textConfirm: 'ok',
              onConfirm: () async {
                Get.back();
              });
        }
      });
    } else {
      Get.toNamed('/permit3');
    }
  }

  requestCameraPermission() async {
    if (!cameraGranted.value) {
      await Permission.camera.request().then((value) {
        if (value.isGranted) {
          cameraGranted.value = true;
          Get.toNamed('/register');
        } else {
          Get.defaultDialog(
              title: 'You need to allow Camera Permission',
              middleText:
                  'GOTO : settings -> Apps -> FoodBoss -> Allow Camera Access',
              textConfirm: 'ok',
              onConfirm: () async {
                Get.back();
              });
        }
      });
    }
  }

  requestMediaPermission() async {
    if (!mediaGranted.value) {
      await Permission.mediaLibrary.request().then((value) {
        if (value.isGranted) {
          mediaGranted.value = true;
          Get.toNamed('/permit2');
        } else {
          Get.defaultDialog(
              title: 'You need to allow Media Permission',
              middleText:
                  'GOTO : settings -> Apps -> FoodBoss -> Allow Media Access',
              textConfirm: 'ok',
              onConfirm: () async {
                Get.back();
              });
        }
      });
    }
  }

  @override
  void onInit() async {
    locationGranted.value = await Permission.location.isGranted;
    cameraGranted.value = await Permission.camera.isGranted;
    mediaGranted.value = await Permission.mediaLibrary.isGranted;

    // TODO: implement onInit
    super.onInit();
  }
}

class PermissionScreens1 extends StatelessWidget {
  PermissionScreens1({Key? key}) : super(key: key);
  PermissionController permissionController =
      Get.put(PermissionController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Image.asset(
                'assets/images/loc.png',
                height: size.height * 0.3,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              HeadingText(
                  titleString: permissionController.locationGranted.value
                      ? 'Already Provided Location access'
                      : 'We want to access your Location'),
              const Desc(
                descString:
                    'We need your location data to find nearby delivery boys and customers',
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          text: permissionController.locationGranted.value
                              ? 'Next'
                              : 'Continue',
                          op: () =>
                              permissionController.requestLocationPermission(),
                          type: 'filled'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PermissionScreens2 extends StatelessWidget {
  PermissionScreens2({Key? key}) : super(key: key);

  PermissionController permissionController = Get.find<PermissionController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Image.asset(
                'assets/images/allow-camera.png',
                height: size.height * 0.3,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              HeadingText(
                  titleString: permissionController.cameraGranted.value
                      ? 'Already Provided Camera access'
                      : 'We want to access your Camera'),
              const Desc(
                  descString:
                      'We need your camera access for scanning barcode and Uploading QR code, Shop Images, Owner Image, GST Image, and Shop Registration Image.'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          text: permissionController.cameraGranted.value
                              ? 'Next'
                              : 'Continue',
                          op: () async {
                            await permissionController
                                .requestCameraPermission();
                            await AuthCall.setIntro(true);
                            if (permissionController.mediaGranted.value) {
                              Get.toNamed('/register');
                            }
                          },
                          type: 'filled'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PermissionScreens3 extends StatelessWidget {
  PermissionScreens3({Key? key}) : super(key: key);
  PermissionController permissionController = Get.find<PermissionController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Image.asset('assets/images/intro-01.png'),
              SizedBox(
                height: size.height * 0.1,
              ),
              HeadingText(
                  titleString: permissionController.locationGranted.value
                      ? 'Already Provided Media access'
                      : 'We want to access your Media'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          text: permissionController.mediaGranted.value
                              ? 'Next'
                              : 'Continue',
                          op: () async {
                            await permissionController.requestMediaPermission();
                            if (permissionController.mediaGranted.value) {
                              Get.toNamed('/register');
                            }
                          },
                          type: 'filled'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
