import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/MyReportScreen/reportDatePickerController.dart';
import 'package:rider_app/controller/my_earning_controller.dart';
import 'package:rider_app/screens/add_orders/order_counter.dart';
import 'package:rider_app/screens/my_delivery_boy_screen/my_earning_card.dart';
import 'package:shared_widgets/shared_widgets.dart';

class AddOrdersScreen extends StatefulWidget {
  const AddOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AddOrdersScreen> createState() => _AddOrdersScreenState();
}

class _AddOrdersScreenState extends State<AddOrdersScreen> {
  String deliveryBoyDropdownValueCrp = "yesterday's Earnings";
  List<String> deliveryBoyListCrp = [
    "yesterday's Earnings",
    'Last 7 days Earnings',
    'Last Month Earnings',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ReportDatePickerController controller =
        Get.put(ReportDatePickerController(), permanent: false);
    EarningController earningController =
        Get.put(EarningController(), permanent: false);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          return await earningController.sendWithoutDatetRequest();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Obx(() {
                if (earningController.data.value.data != null) {
                  return OrderCountScreen(
                      height: size.height * 0.2,
                      earning:
                          '${earningController.data.value.data!.earning!}');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
              SizedBox(height: size.height * 0.021),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.setDate(context, 0);
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: ThemeConfig.WHITE_COLOR,
                              border: Border.all(
                                  width: 1, color: ThemeConfig.PRIMARY_COLOR),
                              borderRadius: BorderRadius.circular(
                                  ThemeConfig.BORDERRADIUS_MIN),
                            ),
                            child: Text(controller.getStartDate),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.setDate(context, 1);
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: ThemeConfig.WHITE_COLOR,
                              border: Border.all(
                                  width: 1, color: ThemeConfig.PRIMARY_COLOR),
                              borderRadius: BorderRadius.circular(
                                  ThemeConfig.BORDERRADIUS_MIN),
                            ),
                            child: Text(controller.getEndDate),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.021),
              Obx(() {
                if (earningController.data.value.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                        earningController.data.value.data!.stores!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var list =
                          earningController.data.value.data!.stores![index];
                      return Container(
                        // width: size.width * 0.45,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyEarningCard(
                                name: '${list.shopName ?? 'sdf'}',
                                address: '${list.storeAddress ?? 'sdf'}',
                                phone: '${list.phone ?? 'sdf'}',
                                time: 'Earnings',
                                img: '${list.shopImage}',
                                earning: '${list.earning}',
                              ),
                            ),
                            // flex: 1,
                            // child: PlanBuyCard(
                            //     price: "201", orders: "30 Orders")),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),

              const SizedBox(
                height: 30,
              ),
              // Row(children: [
              //   Expanded(
              //     child: Column(children: [
              //       ...[1, 2, 3, 4]
              //           .map((e) =>
              //               const PlanBuyCard(price: "201", orders: "30 Orders"))
              //           .toList(),
              //     ]),
              //   ),
              //   Expanded(
              //     child: Column(children: [
              //       ...[1, 2, 3, 4]
              //           .map((e) =>
              //               const PlanBuyCard(price: "201", orders: "30 Orders"))
              //           .toList(),
              //     ]),
              //   ),
              // ])
              // Row(
              //   children: [

              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}


// Center(
//       child: HeadingText(
//         titleString: 'Comming Soon',
//       ),
//     );