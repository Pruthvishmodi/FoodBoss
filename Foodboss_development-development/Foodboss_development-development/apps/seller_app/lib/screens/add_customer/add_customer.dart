import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/customer/customer_controller.dart';
import 'package:seller_app/screens/404_error_screen.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/customer_list_card.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class AddCustomer extends StatelessWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomerController customerController = Get.find<CustomerController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,bottomSheet: ,
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
        elevation: 0,
        title: const Text("Add Customer"),
      ),
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
                  child: SmallRoundedInputField(
                    hintText: "Search",
                    onChange: (value) {
                      if (value == "") {
                        customerController.fetchAllCustomersData();
                      } else {
                        customerController.searchFromAllCustomer(value);
                      }
                    },
                    tailingIcon: Icons.search,
                    textType: TextInputType.number,
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: size.height * 0.01,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Row(
                //         children: [
                //           PrimaryButton(text: 'Unblock', op: () {}, type: ''),
                //           const SizedBox(
                //             width: 10,
                //           ),
                //           PrimaryButton(
                //             text: 'Block',
                //             op: () {},
                //             type: '',
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // const CustomerListCard(
                //   deliveryType: 'Free Delivery',
                //   name: 'Suraj Barot',
                //   number: '+91 8252632589',
                // ),
                // const CustomerListCard(
                //   deliveryType: 'Free Delivery',
                //   name: 'Suraj Barot',
                //   number: '+91 8252632589',
                // ),
                // const CustomerListCard(
                //   deliveryType: 'Free Delivery',
                //   name: 'Suraj Barot',
                //   number: '+91 8252632589',
                // ),
                // const CustomerListCard(
                //   deliveryType: 'Free Delivery',
                //   name: 'Suraj Barot',
                //   number: '+91 8252632589',
                // ),
                Obx(
                  () {
                    print(customerController.allCustomerDataStatus);
                    if (customerController.allCustomerDataStatus ==
                        States.LOADING_STATE) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (customerController.allCustomerDataStatus ==
                        States.ERROR_STATE) {
                      return ErrorScreen(
                        refreshFunction:
                            customerController.fetchAllCustomersData,
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount:
                                customerController.allCustomerList.length,
                            itemBuilder: ((context, index) {
                              return AllCustomerListCard(
                                customerData:
                                    customerController.allCustomerList[index],
                              );
                            })),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
