import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/UI%20controller/map_adress.dart/change_adress.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapAdressController controller = Get.find<MapAdressController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        foregroundColor: ThemeConfig.WHITE_COLOR,
        elevation: 0,
        title: const Text(
          "Add Address",
          style: TextStyle(
            color: ThemeConfig.WHITE_COLOR,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(height: 40),
                  TitleSubTitle(
                      title: "Add your address",
                      subtitle:
                          "Add appropriate address of your store to continue."),
                  SizedBox(height: 40),
                  SmallRoundedInputField(hintText: controller.add1),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                      hintText: controller.add2 == ""
                          ? "Adress line 2"
                          : controller.add2),
                  SizedBox(height: 20),
                  SmallRoundedInputField(hintText: controller.area),
                  SizedBox(height: 20),
                  SmallRoundedInputField(hintText: controller.city),
                  SizedBox(height: 20),
                  SmallRoundedInputField(hintText: controller.state),
                  SizedBox(height: 20),
                  SmallRoundedInputField(hintText: controller.country),
                  SizedBox(height: 20),
                  SmallRoundedInputField(
                    hintText: controller.zip,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: "NEXT",
                          op: () {},
                          type: "filled",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
