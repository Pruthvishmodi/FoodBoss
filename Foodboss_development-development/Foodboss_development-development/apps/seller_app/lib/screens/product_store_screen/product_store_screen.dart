import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:seller_app/config/page_layout.dart';
import 'package:seller_app/controller/business_controller/my_store/add_photo_request_controller.dart';
import 'package:seller_app/controller/business_controller/my_store/my_store_controller.dart';
import 'package:seller_app/controller/business_controller/my_store/store_details_controller.dart';
import 'package:seller_app/models/store/mystore_item.dart';
import 'package:seller_app/screens/global_store_screen/modals.dart';
import 'package:seller_app/widgets/custom_image_picker.dart';
import 'package:seller_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/widgets/BigRoundedInputField.dart';
import 'package:seller_app/widgets/BodyContainer.dart';
import 'package:seller_app/widgets/CustomAppBar.dart';
import 'package:seller_app/widgets/CustomOutlineButton.dart';
import 'package:seller_app/widgets/Heading.dart';
import 'package:seller_app/widgets/SmallRoundedInputField.dart';
import 'package:seller_app/widgets/SubText.dart';
import 'package:seller_app/widgets/TextFieldContainer.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/form_input.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';

class ProductStoreScreen extends StatefulWidget {
  // ItemMyStoreData? item;

  ProductStoreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductStoreScreen> createState() => _ProductStoreScreenState();
}

class _ProductStoreScreenState extends State<ProductStoreScreen> {
  // var data = Get.arguments;
  bool value = false;

  int quantity = 1;
  int deliveryRange = 1;

  String dropDownValue2 = 'Unit';

  List<String> productQuantity = ['Unit', 'g', 'kg', 'L'];
  double sliderValue = 3;

  String dropDownValue = 'kg';
  List<String> units = ['kg', 'gms'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StoreDetailsController controller =
        Get.put(StoreDetailsController(), permanent: false);
    // var image;
    // widget.item = data[0]!;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        title: Text(controller.data.value.data != null
            ? controller.data.value.data!.name!.split('-')[0]
            : ""),
        elevation: 0,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
      ),
      body: BodyContainer(
        child: Obx(
          () => controller.loading.value == true
              ? const SizedBox(
                  width: 0,
                )
              : controller.error.value == true
                  ? const SizedBox(
                      width: 0,
                    )
                  : Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.01),
                          SubText(
                              text: controller.data.value.data != null
                                  ? controller.data.value.data!.name!
                                  : '',
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              size: ThemeConfig.SUB_TITLE_SIZE),
                          SizedBox(height: size.height * 0.01),
                          // _imageSection(size, controller),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SubText(
                                  text: 'Avaibility',
                                  color: ThemeConfig.MAIN_TEXT_COLOR,
                                  size: ThemeConfig.SUB_TITLE_SIZE),
                              Obx(
                                () => Switch.adaptive(
                                    activeColor: ThemeConfig.PRIMARY_COLOR,
                                    value: controller.data.value.data != null
                                        ? controller.data.value.data!
                                                    .isAvailable ==
                                                true
                                            ? true
                                            : false
                                        : false,
                                    onChanged: (newValue) {
                                      controller.changeAvailablity();
                                    }),
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          SizedBox(height: size.height * 0.01),
                          const SubText(
                              text: 'Product Description',
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              size: ThemeConfig.SUB_TITLE_SIZE),
                          SizedBox(height: size.height * 0.02),
                          controller.data.value.data != null
                              ? Html(
                                  data:
                                      controller.data.value.data!.description!)
                              : const SizedBox(width: 0),
                          SizedBox(height: size.height * 0.05),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SubText(
                                        text: 'Pricing',
                                        color: ThemeConfig.MAIN_TEXT_COLOR,
                                        size: ThemeConfig.SUB_TITLE_SIZE),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SmallRoundedInputField(
                                            hintText:
                                                controller.data.value.data !=
                                                        null
                                                    ? controller
                                                                .data
                                                                .value
                                                                .data!
                                                                .foodsUsers !=
                                                            null
                                                        ? controller
                                                            .data
                                                            .value
                                                            .data!
                                                            .foodsUsers!
                                                            .discountPrice
                                                            .toString()
                                                        : ""
                                                    : "",
                                            onChange: (val) {
                                              controller.changePrice(val);
                                            },
                                            textType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SubText(
                                        text: 'Stock',
                                        color: ThemeConfig.MAIN_TEXT_COLOR,
                                        size: ThemeConfig.SUB_TITLE_SIZE),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SmallRoundedInputField(
                                            hintText:
                                                controller.data.value.data !=
                                                        null
                                                    ? controller
                                                                .data
                                                                .value
                                                                .data!
                                                                .foodsUsers !=
                                                            null
                                                        ? controller
                                                            .data
                                                            .value
                                                            .data!
                                                            .foodsUsers!
                                                            .quantity
                                                            .toString()
                                                        : ""
                                                    : "",
                                            onChange: (val) {
                                              controller.changeStock(val);
                                            },
                                            textType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.05),
                          const SubText(
                              text: 'Add Variations',
                              color: ThemeConfig.MAIN_TEXT_COLOR,
                              size: ThemeConfig.SUB_TITLE_SIZE),
                          SizedBox(height: size.height * 0.02),

                          // Obx(
                          //   () => Container(
                          //     padding: const EdgeInsets.only(bottom: 3),
                          //     height:
                          //         60 * controller.data.value.varients!.length.toDouble(),
                          //     // 60 * controller.varientsLength.value.toDouble(),
                          //     child: ListView.builder(
                          //         itemCount: controller.data.value.varients!.length,
                          //         itemBuilder: (context, i) => Container(
                          //               margin: const EdgeInsets.symmetric(vertical: 5),
                          //               child: Row(
                          //                 children: [
                          //                   Expanded(
                          //                     flex: 2,
                          //                     child: SmallRoundedInputField(
                          //                       hintText: controller
                          //                           .data.value.varients![i].price
                          //                           .toString(),
                          //                       onChange: (val) {
                          //                         controller.changePriceVarient(val, i);
                          //                       },
                          //                       textType: TextInputType.number,
                          //                     ),
                          //                   ),
                          //                   const SizedBox(
                          //                     width: 10,
                          //                   ),
                          //                   Expanded(
                          //                     flex: 2,
                          //                     child: SmallRoundedInputField(
                          //                       hintText: controller
                          //                           .data.value.varients![i].quantity
                          //                           .toString(),
                          //                       onChange: (val) {
                          //                         controller.changeQuntityVarients(
                          //                             val, i);
                          //                       },
                          //                       textType: TextInputType.number,
                          //                     ),
                          //                   ),
                          //                   const SizedBox(
                          //                     width: 10,
                          //                   ),
                          //                   Expanded(
                          //                     flex: 2,
                          //                     child: Container(
                          //                       padding: const EdgeInsets.symmetric(
                          //                         horizontal: 15,
                          //                         vertical: 7,
                          //                       ),
                          //                       decoration: BoxDecoration(
                          //                         color: ThemeConfig.WHITE_COLOR,
                          //                         border: Border.all(
                          //                             width: 1,
                          //                             color: ThemeConfig.PRIMARY_COLOR),
                          //                         borderRadius: BorderRadius.circular(25),
                          //                       ),
                          //                       child: DropdownButton(
                          //                         isDense: true,
                          //                         isExpanded: true,
                          //                         borderRadius: BorderRadius.circular(10),
                          //                         underline: Container(
                          //                           height: 0,
                          //                         ),
                          //                         value: dropDownValue2,
                          //                         elevation: 3,
                          //                         style: const TextStyle(
                          //                           color: ThemeConfig.PRIMARY_COLOR,
                          //                         ),
                          //                         items: productQuantity
                          //                             .map((String value) =>
                          //                                 DropdownMenuItem(
                          //                                     value: value,
                          //                                     child: SubText(
                          //                                       text: value,
                          //                                       color: ThemeConfig
                          //                                           .MAIN_TEXT_COLOR,
                          //                                       size: ThemeConfig
                          //                                           .NOTIFICATION_SIZE,
                          //                                     )))
                          //                             .toList(),
                          //                         onChanged: (String? value) {
                          //                           setState(() {
                          //                             dropDownValue2 = value!;
                          //                           });
                          //                         },
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   i == controller.varientsLength.value - 1
                          //                       ? Expanded(
                          //                           child: IconButton(
                          //                           icon: const Icon(Icons.add),
                          //                           onPressed: () {
                          //                             controller.addVarients();
                          //                             // if (quantity < 100) {
                          //                             //   // setState(() {
                          //                             //   //   quantity = quantity + 1;
                          //                             //   // });
                          //                             // }
                          //                           },
                          //                         ))
                          //                       : Expanded(
                          //                           child: IconButton(
                          //                           icon: const Icon(Icons.remove),
                          //                           onPressed: () {
                          //                             controller.removeVarients(controller
                          //                                 .data.value.varients![i]);
                          //                             // if (quantity > 0) {
                          //                             //   // setState(() {
                          //                             //   //   quantity = quantity - 1;
                          //                             //   // });
                          //                             // }
                          //                           },
                          //                         ))
                          //                 ],
                          //               ),
                          //             )),
                          //   ),
                          // ),
                          // SizedBox(width: MediaQuery.of(context).size.width, child: Expanded(child: PrimaryButton(text: 'Add Variations', op: (){}, type: 'outlined'))),
                          SizedBox(height: size.height * 0.05),
                          Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => controller.loading.value == false
                                      ? PrimaryButton(
                                          text: 'Submit',
                                          op: () {
                                            controller
                                                .storeUpdateController(context);
                                            // Navigator.pushNamed(
                                            //     context, '/report_problem_screen');
                                          },
                                          type: 'filled')
                                      : DisabledButton(
                                          text: "SUBMIT",
                                          op: () {},
                                          type: "outlined"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                        ],
                      )),
        ),
      ),
    );
  }

  Container _imageSection(Size size, StoreDetailsController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: size.height * 0.3,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    controller.data.value.data!.hasMedia!
                        ? controller.data.value.data!.media![0].thumb!
                        : ThemeConfig.NOIMAGELINK,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.data.value.data!.media!.length - 1 <= 0
                        ? const SizedBox(
                            width: 0,
                          )
                        : Expanded(
                            flex: 1,
                            child: GestureDetector(
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
                                        child: CarouselSlider(
                                          items: controller
                                                  .data.value.data!.hasMedia!
                                              ? controller
                                                  .data.value.data!.media!
                                                  .map(
                                                    (e) => Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      decoration: BoxDecoration(
                                                        color: ThemeConfig
                                                            .WHITE_COLOR,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              e.url!),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList()
                                              : [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            6.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      image:
                                                          const DecorationImage(
                                                        image: NetworkImage(
                                                            ThemeConfig
                                                                .NOIMAGELINK),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                          options: CarouselOptions(
                                            height: 400.0,
                                            enlargeCenterPage: true,
                                            autoPlay: false,
                                            aspectRatio: 16 / 9,
                                            viewportFraction: 0.8,
                                          ),
                                        ),
                                        // child: Image(image: AssetImage('assets/images/shopImage0.jpg'),fit: BoxFit.cover,),
                                      ),
                                    ),
                                  );
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        controller.data.value.data!.hasMedia!
                                            ? controller.data.value.data!
                                                .media![0].thumb!
                                            : ThemeConfig.NOIMAGELINK,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+ ${controller.data.value.data!.media!.length - 1}",
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: ThemeConfig.WHITE_COLOR,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          addPhotoBottomSheet(
                              size, controller.data.value.data!.id!.toString());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.WHITE_COLOR,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

addPhotoBottomSheet(Size size, String productId) {
  AddPhotoRequestController addPhotoRequestController =
      Get.put(AddPhotoRequestController(), permanent: false);
  addPhotoRequestController.addPhotoIdName(productId);
  Get.bottomSheet(
    Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: ThemeConfig.WHITE_COLOR,
          ),
          padding: EdgeInsets.all(size.width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading('Want to add your product photo ?',
                  ThemeConfig.MAIN_TEXT_COLOR),
              SizedBox(
                height: size.height * 0.03,
              ),
              Obx(
                () {
                  // print(addPhotoRequestController.file1);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            CustomImagePicker.pickAndCrop(
                                addPhotoRequestController.addfile);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MEDIUM),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              height: 120,
                              width: double.infinity,
                              child: addPhotoRequestController
                                      .request.value.files.isEmpty
                                  ? const Icon(Icons.add)
                                  : Image.file(
                                      addPhotoRequestController.file1,
                                      fit: BoxFit.cover,
                                    ),
                              decoration: const BoxDecoration(
                                color: ThemeConfig.FORM_COLOR,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            CustomImagePicker.pickAndCrop(
                                addPhotoRequestController.addfile);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MEDIUM),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              height: 120,
                              width: double.infinity,
                              child: addPhotoRequestController
                                          .request.value.files.length <
                                      2
                                  ? const Icon(Icons.add)
                                  : Image.file(
                                      addPhotoRequestController.file2,
                                      fit: BoxFit.cover,
                                    ),
                              decoration: const BoxDecoration(
                                color: ThemeConfig.FORM_COLOR,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            CustomImagePicker.pickAndCrop(
                                addPhotoRequestController.addfile);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ThemeConfig.BORDERRADIUS_MEDIUM),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              height: 120,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: ThemeConfig.FORM_COLOR,
                              ),
                              child: addPhotoRequestController
                                          .request.value.files.length <
                                      3
                                  ? const Icon(Icons.add)
                                  : Image.file(
                                      addPhotoRequestController.file3,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      op: () {
                        addPhotoRequestController.addShop();
                        Get.back();
                      },
                      text: 'Save',
                      type: "filled",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
