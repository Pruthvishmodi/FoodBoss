

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/models/plan_id_model.dart';


import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/plan_controller.dart';
import 'package:seller_app/models/purchasePlan_model.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:seller_app/widgets/text_widgets/title_subtitle.dart';

class BuyDetails extends StatelessWidget {
  final String? type;
  final String? price;
  final String? order;
  final String? id;
  const BuyDetails({Key? key, this.type, this.price, this.order, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(type);
    PlanController controller = Get.find<PlanController>();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Plan Summary"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: SafeArea(
                child: Center(
                    child: Column(
          children: [
            const TitleSubTitle(
                title: 'Order Summary', subtitle: 'Selected Plan'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MainLabelText(titleString: 'Total Orders'),
                MainLabelText(titleString: order!),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MainLabelText(titleString: 'Price'),
                MainLabelText(titleString: '\u{20B9}$price'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MainLabelText(titleString: 'Plan Total'),
                MainLabelText(titleString: '\u{20B9}$price'),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Desc(
                descString:
                    'By clicking on this button you agree to our terms and conditions.'),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                        text: 'Checkout',
                        op: (){controller.addPlanId(OrderId(planId: id), price!);
                        // controller.getPlanData();
                        
                        },
                        type: 'filled')),
              ],
            )
          ],
        )))),
      ),
    );
  }
}
