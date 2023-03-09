import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/controller/business_controller/auth/otp_controller.dart';

class OtpFormFields extends StatelessWidget {
  final OtpController textEditingController;
  const OtpFormFields({Key? key, required this.textEditingController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      backgroundColor: Colors.transparent,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      showCursor: false,
      textStyle: const TextStyle(
          fontSize: 45,
          fontFamily: 'Digit',
          color: ThemeConfig.MAIN_TEXT_COLOR),
      hintCharacter: '8',
      hintStyle: TextStyle(
          fontSize: 45,
          fontFamily: 'Digit',
          color: Colors.grey.withOpacity(0.2)),
      enablePinAutofill: true,
      keyboardType: TextInputType.number,
      length: 4,
      // obscureText: true,
      // obscuringCharacter: '*',
      // animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 70,
          fieldWidth: 60,
          activeFillColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent),
      // animationDuration: const Duration(milliseconds: 300),
      // backgroundColor: Colors.blue.shade50,
      enableActiveFill: true,
      controller: textEditingController.textEditingController.value,
      onCompleted: (v) {
        // debugPrint("Completed");
      },
      onChanged: (value) {
        // textEditingController.addOtp(value.split('').reversed.join());
        debugPrint(textEditingController.textEditingController.value.text);
        textEditingController.changeOtp(value);
        // setState(() {
        //   currentText = value;
        // });
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
