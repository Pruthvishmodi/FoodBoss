import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';

import 'package:rider_app/widgets/BigRoundedInputField.dart';
import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/CustomAppBar.dart';
import 'package:rider_app/widgets/CustomOutlineButton.dart';
import 'package:rider_app/widgets/Heading.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/form_input.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/shared_widgets.dart';

class ProductStoreScreen extends StatefulWidget {
  final String? pageTitle;

  const ProductStoreScreen({Key? key, this.pageTitle}) : super(key: key);

  @override
  State<ProductStoreScreen> createState() => _ProductStoreScreenState();
}

class _ProductStoreScreenState extends State<ProductStoreScreen> {
  bool value = false;

  int quantity = 1;
  int deliveryRange = 1;

  String dropDownValue2 = 'Unit';

  List<String> productQuantity = ['Unit', 'g', 'kg', 'L'];
  double sliderValue = 3;

  String dropDownValue = 'kg';
  List<String> units = ['kg', 'gms'];
  // openBottomSheet(Size size, int index) {
  //   Get.bottomSheet(Wrap(
  //     children: [
  //       Container(
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(20),
  //           ),
  //           color: ThemeConfig.WHITE_COLOR,
  //         ),
  //         padding: EdgeInsets.all(size.width * 0.07),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Heading(
  //                 productList[index].productName, ThemeConfig.MAIN_TEXT_COLOR),
  //             SizedBox(
  //               height: size.height * 0.05,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Expanded(
  //                   flex: 2,
  //                   child: LabelText(titleString: 'Quantity'),
  //                 ),
  //                 Expanded(
  //                     flex: 1,
  //                     child: FormInput(attr: productList[index].quantity)),
  //               ],
  //             ),
  //             SizedBox(
  //               height: size.height * 0.01,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Expanded(
  //                   flex: 2,
  //                   child: LabelText(titleString: 'Price'),
  //                 ),
  //                 Expanded(
  //                     flex: 1,
  //                     child: FormInput(attr: productList[index].price)),
  //               ],
  //             ),
  //             SizedBox(
  //               height: size.height * 0.03,
  //             ),
  //             Container(
  //               height: 40,
  //               width: double.infinity,
  //               child: Expanded(
  //                 child: PrimaryButton(
  //                   op: () {},
  //                   text: 'Save',
  //                   type: "filled",
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var image;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeConfig.WHITE_COLOR,
        title: Text(widget.pageTitle!),
        elevation: 0,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
      ),
      body: BodyContainer(
        child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.01),
                const SubText(
                    text: 'Apple',
                    color: ThemeConfig.MAIN_TEXT_COLOR,
                    size: ThemeConfig.SUB_TITLE_SIZE),
                SizedBox(height: size.height * 0.01),
                _imageSection(size, image),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SubText(
                        text: 'Avaibility',
                        color: ThemeConfig.MAIN_TEXT_COLOR,
                        size: ThemeConfig.SUB_TITLE_SIZE),
                    Switch.adaptive(
                        activeColor: ThemeConfig.PRIMARY_COLOR,
                        value: value,
                        onChanged: (newValue) {
                          setState(() {
                            value = newValue;
                          });
                        })
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                // const SubText(
                //     text: 'Manual Selection',
                //     color: ThemeConfig.MAIN_TEXT_COLOR,
                //     size: ThemeConfig.SUB_TITLE_SIZE),
                // SizedBox(height: size.height * 0.01),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: ThemeConfig.WHITE_COLOR,
                //           ),
                //           child: const SmallRoundedInputField(
                //             textType: TextInputType.number,
                //             hintText: '',
                //           ),
                //           height: 40,
                //           width: 80,
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         const SubText(
                //             text: 'kg',
                //             color: ThemeConfig.MAIN_TEXT_COLOR,
                //             size: ThemeConfig.NOTIFICATION_SIZE),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: ThemeConfig.WHITE_COLOR,
                //           ),
                //           child: const SmallRoundedInputField(
                //             textType: TextInputType.number,
                //             hintText: '',
                //           ),
                //           height: 40,
                //           width: 80,
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         const SubText(
                //             text: 'gm',
                //             color: ThemeConfig.MAIN_TEXT_COLOR,
                //             size: ThemeConfig.NOTIFICATION_SIZE),
                //       ],
                //     ),
                //   ],
                // ),
// ,                Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: const SubText(
//                           text: 'Kilo',
//                           color: ThemeConfig.MAIN_TEXT_COLOR,
//                           size: ThemeConfig.NOTIFICATION_SIZE),
//                     ),

//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: ThemeConfig.FORM_COLOR,
//                       ),
//                       child: const SmallRoundedInputField(
//                         textType: TextInputType.number,
//                         hintText: 'kg',
//                       ),
//                       height: 40,
//                       width: 80,
//                     ),

//                   ],
//                 ),
//                 SizedBox(height: size.height * 0.01),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: const SubText(
//                           text: 'Gram',
//                           color: ThemeConfig.MAIN_TEXT_COLOR,
//                           size: ThemeConfig.NOTIFICATION_SIZE),
//                     ),

//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: ThemeConfig.FORM_COLOR,
//                       ),
//                       child: const SmallRoundedInputField(
//                         textType: TextInputType.number,
//                         hintText: 'gm',
//                       ),
//                       height: 40,
//                       width: 80,
//                     ),

//                   ],
//                 ),
                SizedBox(height: size.height * 0.01),
                const SubText(
                    text: 'Product Description',
                    color: ThemeConfig.MAIN_TEXT_COLOR,
                    size: ThemeConfig.SUB_TITLE_SIZE),
                SizedBox(height: size.height * 0.02),
                const Desc(
                    descString:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
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
                            children: const [
                              Expanded(
                                child: SmallRoundedInputField(
                                  hintText: 'Enter Value',
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
                            children: const [
                              Expanded(
                                child: SmallRoundedInputField(
                                  hintText: 'Enter Value',
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

                //     const SubText(
                //         text: 'Pricing',
                //         color: ThemeConfig.MAIN_TEXT_COLOR,
                //         size: ThemeConfig.SUB_TITLE_SIZE),
                //     // SizedBox(height: size.height * 0.02),
                //     Row(
                //       children: [
                //        Expanded(
                //   flex: 1,
                //   child: Container(

                //         margin: const EdgeInsets.symmetric(vertical: 10),
                //         // padding:
                //             // const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //         child: TextFieldContainer(
                //     color: ThemeConfig.WHITE_COLOR,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //       child: TextFormField(
                //         decoration: const InputDecoration(
                //           hintText: "Enter Value",
                //           border: InputBorder.none,
                //         ),
                //       ),
                //     ),
                //   ),
                //       ),
                // ),

                //       ],
                //     ),
                //     SizedBox(height: size.height * 0.05),
                //     const SubText(
                //         text: 'Stock',
                //         color: ThemeConfig.MAIN_TEXT_COLOR,
                //         size: ThemeConfig.SUB_TITLE_SIZE),
                //     // SizedBox(height: size.height * 0.01),
                //     Row(
                //       children: [
                //        Expanded(
                //   flex: 1,
                //   child: Container(

                //         margin: const EdgeInsets.symmetric(vertical: 10),
                //         // padding:
                //             // const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //         child: TextFieldContainer(
                //     color: ThemeConfig.WHITE_COLOR,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //       child: TextFormField(
                //         decoration: const InputDecoration(
                //           hintText: "Enter Value",
                //           border: InputBorder.none,
                //         ),
                //       ),
                //     ),
                //   ),
                //       ),
                // ),

                //       ],
                //     ),

                SizedBox(height: size.height * 0.05),
                const SubText(
                    text: 'Add Variations',
                    color: ThemeConfig.MAIN_TEXT_COLOR,
                    size: ThemeConfig.SUB_TITLE_SIZE),
                SizedBox(height: size.height * 0.02),

                Container(
                  padding: const EdgeInsets.only(bottom: 3),
                  height: 60 * quantity.toDouble(),
                  child: ListView.builder(
                      itemCount: quantity,
                      itemBuilder: (context, i) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: SmallRoundedInputField(
                                    hintText: 'Price',
                                    textType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  flex: 2,
                                  child: SmallRoundedInputField(
                                    hintText: 'Quantity',
                                    textType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ThemeConfig.WHITE_COLOR,
                                      border: Border.all(
                                          width: 1,
                                          color: ThemeConfig.PRIMARY_COLOR),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: DropdownButton(
                                      isDense: true,
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(10),
                                      underline: Container(
                                        height: 0,
                                      ),
                                      value: dropDownValue2,
                                      elevation: 3,
                                      style: const TextStyle(
                                        color: ThemeConfig.PRIMARY_COLOR,
                                      ),
                                      items: productQuantity
                                          .map((String value) =>
                                              DropdownMenuItem(
                                                  value: value,
                                                  child: SubText(
                                                    text: value,
                                                    color: ThemeConfig
                                                        .MAIN_TEXT_COLOR,
                                                    size: ThemeConfig
                                                        .NOTIFICATION_SIZE,
                                                  )))
                                          .toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          dropDownValue2 = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                i == quantity - 1
                                    ? Expanded(
                                        child: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          if (quantity < 100) {
                                            setState(() {
                                              quantity = quantity + 1;
                                            });
                                          }
                                        },
                                      ))
                                    : Expanded(
                                        child: IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          if (quantity > 0) {
                                            setState(() {
                                              quantity = quantity - 1;
                                            });
                                          }
                                        },
                                      ))
                              ],
                            ),
                          )),
                ),
                // SizedBox(width: MediaQuery.of(context).size.width, child: Expanded(child: PrimaryButton(text: 'Add Variations', op: (){}, type: 'outlined'))),
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                          text: 'Submit',
                          op: () {
                            Navigator.pushNamed(
                                context, '/report_problem_screen');
                          },
                          type: 'filled'),
                    ),
                  ],
                ),
                // CustomOutlineButton(
                //   ontap: () {
                //     Navigator.pushNamed(context, '/report_problem_screen');
                //   },
                //   text: 'SUBMIT',
                //   outlineColor: ThemeConfig.PRIMARY_COLOR,
                //   backColor: ThemeConfig.PRIMARY_COLOR,
                //   fontColor: ThemeConfig.WHITE_COLOR,
                // ),
                SizedBox(height: size.height * 0.02),
              ],
            )),
      ),
    );
  }

  Container _imageSection(Size size, image) {
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://5.imimg.com/data5/AK/RA/MY-68428614/apple-500x500.jpg',
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
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              PageRouteBuilder(pageBuilder: (context, _, __) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black.withOpacity(0.9),
                                child: Center(
                                  child: CarouselSlider(
                                    items: [
                                      //1st Image of Slider
                                      Container(
                                        margin: const EdgeInsets.all(6.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://5.imimg.com/data5/AK/RA/MY-68428614/apple-500x500.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      //2nd Image of Slider
                                      Container(
                                        margin: const EdgeInsets.all(6.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://5.imimg.com/data5/AK/RA/MY-68428614/apple-500x500.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      //3rd Image of Slider
                                      Container(
                                        margin: const EdgeInsets.all(6.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://5.imimg.com/data5/AK/RA/MY-68428614/apple-500x500.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],

                                    //Slider Container properties
                                    options: CarouselOptions(
                                      height: 400.0,
                                      enlargeCenterPage: true,
                                      autoPlay: false,
                                      aspectRatio: 16 / 9,
                                      // autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: true,
                                      // autoPlayAnimationDuration:
                                      //     const Duration(milliseconds: 800),
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
                                  image ??
                                      'https://5.imimg.com/data5/AK/RA/MY-68428614/apple-500x500.jpg',
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: const Center(
                              child: Text(
                                "+2",
                                style: TextStyle(
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
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeConfig.WHITE_COLOR,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: image != null
                              ? Image(
                                  image: AssetImage(image!),
                                  fit: BoxFit.fill,
                                )
                              : const Center(
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
