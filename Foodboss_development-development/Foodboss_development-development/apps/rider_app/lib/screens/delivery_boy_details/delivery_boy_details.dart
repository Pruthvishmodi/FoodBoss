import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/business_controller/auth/login_controller.dart';
import 'package:rider_app/controller/business_controller/profile_controller.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/main_label.dart';
import 'package:rider_app/widgets/text_widgets/title_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryBoyDetails extends StatelessWidget {
  GetProfileController profileController =
      Get.put(GetProfileController(), permanent: false);
  DeliveryBoyDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        foregroundColor: ThemeConfig.WHITE_COLOR,
        elevation: 0,
        title: const Text(
          "Delivery Boy Details ",
          style: TextStyle(color: ThemeConfig.WHITE_COLOR),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await profileController.getProfile();
        },
        child: SingleChildScrollView(
          child: Obx(
            () {
              if (profileController.profileStatus != States.SUCCESS_STATE) {
                return Container(
                  height: size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                var driver = profileController.data.value.data;
                return Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.30,
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
                            bottom: 0,
                            child: Container(
                              width: size.width,
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: 'driver',
                                    child: Container(
                                      width: 150.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              driver!.driverImage!,
                                            )),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color: Colors.transparent,
                                      ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MainLabelText(
                                              isWhite: true,
                                              titleString: driver.driverName!),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () => launch(
                                                "tel://${driver.driverNumber!}"),
                                            child: Desc(
                                                isWhite: true,
                                                alignment: TextAlign.left,
                                                descString:
                                                    driver.driverNumber!),
                                          ),
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
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleText(titleString: 'Licence Details'),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, _, __) {
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Container(
                                      width: size.width,
                                      height: size.height,
                                      color: Colors.black.withOpacity(0.9),
                                      child: Center(
                                        child: Hero(
                                          tag: 'licence',
                                          child: Image(
                                            image: NetworkImage(
                                                driver.licenceImage!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }));
                              },
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Hero(
                                      tag: 'licence',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            ThemeConfig.BORDERRADIUS_MEDIUM),
                                        child: Image(
                                          height: 100,
                                          width: 120,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              driver.licenceImage!),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const MainLabelText(
                                              titleString: 'Licence ID'),
                                          Desc(
                                              descString:
                                                  driver.licenceNo! == null
                                                      ? "0000"
                                                      : driver.licenceNo!)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                        text:
                                            'Time Slot : ${driver.start} - ${driver.end}',
                                        op: () {},
                                        type: 'filled'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TitleText(titleString: 'More Details'),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: ThemeConfig.WHITE_COLOR),
                              // color: ThemeConfig.WHITE_COLOR,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: const [
                                  //     LabelText(titleString: 'Unique ID'),
                                  //     Desc(descString: '#GOFS023094'),
                                  //   ],
                                  // ),
                                  // const Padding(
                                  //   padding: EdgeInsets.symmetric(vertical: 5),
                                  //   child: Divider(),
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const LabelText(
                                          titleString: 'Vehical Number'),
                                      Desc(
                                          descString: driver.vehicleNo! == null
                                              ? "000"
                                              : driver.vehicleNo!),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const LabelText(
                                          titleString: 'Delivery Area'),
                                      Desc(
                                          descString: driver.area! == null
                                              ? "0000"
                                              : driver.area!),
                                    ],
                                  ),

                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: const [
                                  //     LabelText(titleString: 'Delivery Radius'),
                                  //     Desc(descString: '11 Kilometers'),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: PrimaryButton(
                                        text: 'Logout',
                                        op: () {
                                          authController.logout();
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
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
