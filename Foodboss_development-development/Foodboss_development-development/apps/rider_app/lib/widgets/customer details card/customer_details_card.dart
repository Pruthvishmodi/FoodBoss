import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/shared_widgets.dart';

import 'package:url_launcher/url_launcher.dart';

import '../SmallRoundedInputField.dart';
import '../button.dart';
import '../desc.dart';
import '../label_widget.dart';
import '../main_label.dart';
import '../text_widgets/distructive_text.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String phone;
  final String amount;
  const CustomerCard({
    Key? key,
    required this.name,
    required this.phone,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.only(
        top: 20.00,
      ),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(titleString: name),
                    GestureDetector(
                      onTap: () => launch("tel://8780508717"),
                      child: const Desc(descString: "+91-8787878787"),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.toNamed("/khata-management/details");
                  },
                  child: const DistructiveText(titleString: "details")),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.00),
                  color: ThemeConfig.FORM_COLOR,
                ),
                padding: const EdgeInsets.all(10),
                child: const MainLabelText(
                  titleString: "\u{20B9}",
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Desc(descString: "pending"),
                    MainLabelText(titleString: "\u{20B9} $amount"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: SmallRoundedInputField(
                  hintText: "Amount",
                  textType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Expanded(
                  child: PrimaryButton(
                    op: () {},
                    text: 'Paid',
                    type: "filled",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
