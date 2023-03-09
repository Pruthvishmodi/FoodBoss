import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/screens/404_error_screen.dart';
import 'package:seller_app/widgets/no_customer_added.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/customer/customer_controller.dart';

import 'package:seller_app/utils/states.dart';

import 'package:seller_app/widgets/SmallRoundedInputField.dart';

import 'package:seller_app/widgets/customer_list_card.dart';



class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomerController customerController =
        Get.put(CustomerController(), permanent: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              height: size.height,
              constraints: const BoxConstraints(maxWidth: 550),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.01),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                    ),
                    child: const SmallRoundedInputField(
                      hintText: "Search",
                      tailingIcon: Icons.search,
                      textType: TextInputType.name,
                    ),
                  ),
                  
                  Obx( 
                    () {
                      print(customerController.mycustomerDataStatus);
                      if (customerController.mycustomerDataStatus ==
                          States.LOADING_STATE) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if(customerController.mycustomerDataStatus == States.ERROR_STATE){
                        return  ErrorScreen(refreshFunction: customerController.fetchMyCustomersData,);
                      } 
                      
                      else {
                        print(customerController.myCustomerList.length);
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () =>
                                customerController.fetchMyCustomersData(),
                            child: customerController.myCustomerList.isEmpty
                                ? NoCustomerAdded(
                                    button: () => Get.toNamed('/customer/add'))
                                : ListView.builder(
                                    itemCount: customerController
                                        .myCustomerList.length,
                                    itemBuilder: ((context, index) {
                                      return Dismissible(
                                        direction: DismissDirection.endToStart,
                                        confirmDismiss: (dis) async {
                                          return await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                title: const Text("Confirm"),
                                                content: const Text(
                                                    "Are you sure you wish to delete this item?"),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(false),
                                                    child: const Text(
                                                      "CANCEL",
                                                      style: TextStyle(
                                                          color: ThemeConfig
                                                              .WHITE_COLOR),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateColor
                                                                  .resolveWith(
                                                                      (states) =>
                                                                          Colors
                                                                              .red)),
                                                      onPressed: () {
                                                        customerController
                                                            .removeCustomer(
                                                                customerController
                                                                    .myCustomerList[
                                                                        index]
                                                                    .clientId);
                                                        Navigator.of(context)
                                                            .pop(true);
                                                      },
                                                      child: const Text(
                                                        "DELETE",
                                                        style: TextStyle(
                                                            color: ThemeConfig
                                                                .WHITE_COLOR),
                                                      )),
                                                ],
                                              );
                                            },
                                          );
                                          //  return Get.defaultDialog(
                                          //       title: 'Confirm Deletion ?',
                                          //       textConfirm: 'OK',
                                          //       middleText: '',

                                          //       cancelTextColor: ThemeConfig.PRIMARY_COLOR,
                                          //       confirmTextColor: ThemeConfig.WHITE_COLOR,
                                          //       buttonColor: ThemeConfig.PRIMARY_COLOR,
                                          //       textCancel: 'Cancel',
                                          //       onConfirm: () {
                                          //         customerController.removeCustomer(
                                          //             customerController
                                          //                 .myCustomerList[index]
                                          //                 .clientId);
                                          //          Navigator.of(context).pop(true);
                                          //       },
                                          //       onCancel: () {
                                          //         Navigator.of(context).pop(false);
                                          //       });
                                          //   // return booll;
                                        },
                                        onDismissed: (direction) {},
                                        background: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        key: UniqueKey(),
                                        child: MyCustomerListCard(
                                          index: index,
                                        ),
                                      );
                                    })),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            customerController.fetchAllCustomersData();
            Get.toNamed('/customer/add');
          },
          backgroundColor: ThemeConfig.DISTRUCTIVE_COLOR,
          child: const Icon(
            Icons.add,
            color: ThemeConfig.MAIN_TEXT_COLOR,
          ),
        ));
  }
}
