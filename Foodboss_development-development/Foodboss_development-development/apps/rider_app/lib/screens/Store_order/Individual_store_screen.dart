import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/collect_order_controller.dart';
import 'package:rider_app/controller/UI%20controller/OrderController/new_order_controller.dart';
import 'package:rider_app/utils/states.dart';
// import 'package:rider_app/shimmers/card_shimmer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/product_list.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/heading_widget.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class IndividualNewOrders extends StatelessWidget {
  final _selectedList = [];

  IndividualNewOrders({Key? key}) : super(key: key);

  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print("asd $args");
    String shopName = args[0];
    int shopId = args[1];

    NewOrderController controller = Get.find<NewOrderController>();
    CollectOrderController collectController =
        Get.put(CollectOrderController(), permanent: false);

    openBottomSheet(i) {
      // list = controllerGet.selectedItemList;
      Get.bottomSheet(Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ThemeConfig.WHITE_COLOR,
        ),
        padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    HeadingText(
                      titleString: "New Item List",
                    ),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller
                    .orderByStore.value.data!.newOrders![i].items!.length,
                itemBuilder: (BuildContext context, int index) {
                  var order = controller
                      .orderByStore.value.data!.newOrders![i].items![index];
                  return ProductList(
                    img: order.media![0].url!,
                    name: "${order.name!.split('-')[1]}",
                    name1: "${order.name!.split('-')[0]}",
                    weight: '${order.weight!}',
                    price: '${order.price!}',
                    mass: '${order.quantity}',
                    unit: '${order.unit}',
                  );
                },
              ),
            ),
          ],
        ),
      ));
    }

    // codeSheet() {
    //   // list = controllerGet.selectedItemList;
    //   Get.bottomSheet(Container(
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(20),
    //         topRight: Radius.circular(20),
    //       ),
    //       color: ThemeConfig.WHITE_COLOR,
    //     ),
    //     padding: const EdgeInsets.only(bottom: 3, left: 20, right: 20, top: 20),
    //     child: Container(
    //       child: Text(collectController.data.code.toString()),
    //       // child: Text('Hello'),
    //     ),
    //   ));
    // }

    return Obx(() {
      if (controller.newOrderStatus.value == States.SUCCESS_STATE) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeConfig.PRIMARY_COLOR,
              elevation: 0,
              iconTheme: const IconThemeData(color: ThemeConfig.WHITE_COLOR),
              title: Text(
                shopName,
                style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                controller.getNewOrderbyStoreData(shopId);
              },
              child: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: controller
                            .orderByStore.value.data!.newOrders!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var order = controller
                              .orderByStore.value.data!.newOrders![index];
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (collectController.orderIds
                                  .contains(order.orderId)) {
                                collectController.orderIds
                                    .remove(order.orderId);
                                collectController.orderIds.refresh();
                              } else {
                                collectController.orderIds.add(order.orderId);
                                collectController.orderIds.refresh();
                              }
                            },
                            child: Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                  border: collectController.orderIds
                                          .contains(order.orderId!)
                                      ? Border.all(
                                          width: 2,
                                          color: ThemeConfig.PRIMARY_COLOR)
                                      : Border.all(
                                          width: 2, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20.00),
                                  color: ThemeConfig.WHITE_COLOR,
                                ),
                                // margin: const EdgeInsets.all(20.00),
                                padding: const EdgeInsets.all(20.00),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            // padding: const EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const LabelText(
                                                        titleString:
                                                            'Order Id: '),
                                                    Desc(
                                                        descString: order
                                                            .orderId!
                                                            .toString())
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const LabelText(
                                                        titleString:
                                                            'Total Items: '),
                                                    Desc(
                                                        descString: order
                                                            .totalItems!
                                                            .toString())
                                                  ],
                                                ),
                                                const SizedBox(height: 5),

                                                // Desc(
                                                //     descString: 'Customer Address: asdfbf sdgdfhf dsggdfh hsdgs sfsdfa sdf s fsdf sdf sdf sd sdfsdf sd fsd sdf sdf ',alignment:TextAlign.left,),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Address: ',
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                          // decoration: TextDecoration.lineThrough,
                                                          color: ThemeConfig
                                                              .MAIN_TEXT_COLOR,
                                                          fontSize: ThemeConfig
                                                              .LABEL_SIZE,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )),
                                                    Expanded(
                                                      child: Text(
                                                        '${order.customerDetails!.customerAddress ?? 'A-703 Kalp Residency , zundal, gandhihnagar'}',
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                          // decoration: TextDecoration.lineThrough,
                                                          color: ThemeConfig
                                                              .MAIN_TEXT_COLOR,
                                                          fontSize: (ThemeConfig
                                                                              .LABEL_SIZE /
                                                                          720.00) *
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height >
                                                                  ThemeConfig
                                                                      .LABEL_SIZE
                                                              ? (ThemeConfig
                                                                          .LABEL_SIZE /
                                                                      720.00) *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height
                                                              : ThemeConfig
                                                                  .LABEL_SIZE,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Obx(() {
                                        //   return Expanded(
                                        //     child: Visibility(
                                        //       visible: collectController.orderIds
                                        //           .contains(order.orderId!),
                                        //       child: Checkbox(
                                        //           activeColor:
                                        //               ThemeConfig.PRIMARY_COLOR,
                                        //           value: true,
                                        //           onChanged: (Value) {
                                        //             // controller.addIndex(widget.index);
                                        //           }),
                                        //     ),
                                        //   );
                                        // }),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // PrimaryButton(text: 'View All Orders', op: (){}, type: 'filled')
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: PrimaryButton(
                                            text: "View All Items",
                                            op: () {
                                              openBottomSheet(index);

                                              Get.to(IndividualNewOrders());
                                            },
                                            type: "filled",
                                          ),
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(
                                    //   height: 40,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => Positioned(
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          child: collectController.orderIds.isNotEmpty
                              ? PrimaryButton(
                                  text: 'Accept',
                                  op: () {
                                    collectController.sendCollectOrderRequest(
                                      shopId.toString(),
                                    );
                                    // collectController.getCollectCode();
                                    // codeSheet();
                                  },
                                  type: 'filled')
                              : Container(),
                        )),
                  ),
                ],
              ),
            ));
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeConfig.PRIMARY_COLOR,
            elevation: 0,
            iconTheme: const IconThemeData(color: ThemeConfig.WHITE_COLOR),
            title: const Text(
              '',
              style: const TextStyle(color: ThemeConfig.WHITE_COLOR),
            ),
          ),
        );
      }
    });
  }
}
