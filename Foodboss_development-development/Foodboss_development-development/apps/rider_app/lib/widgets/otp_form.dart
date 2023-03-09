import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/controller/business_controller/auth/login_controller.dart';

class OtpForm extends StatelessWidget {
  final index;
  const OtpForm({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController controllerAuth =
        Get.put(AuthController(), permanent: false);
    return Container(
      height: 60,
      width: 40,
      child: Obx(
        () {
          // print(controllerAuth.getOtp(index));
          return TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: ThemeConfig.MAIN_TEXT_COLOR,
              fontSize: ThemeConfig.OTP_TEXT_SIZE,
            ),
            maxLength: 1,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 10, // HERE THE IMPORTANT PART
                ),

                // labelText: controllerAuth.getOtp(index).length == 1 ?  controllerAuth.getOtp(index) : '',
                hintText: controllerAuth.getOtp(index).length == 1
                    ? controllerAuth.getOtp(index)
                    : '',
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN)),
                counterText: '',
                hintStyle: const TextStyle(
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  fontSize: ThemeConfig.OTP_TEXT_SIZE,
                )),
            onChanged: (value) {
              if (value.length == 1) {
                print(controllerAuth.otp1);
                // controllerAuth.addOtp(value.toString(), index);
                FocusScope.of(context).nextFocus();
              }
            },
          );
        },
      ),
    );
  }
}
