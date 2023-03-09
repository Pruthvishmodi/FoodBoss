import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/food%20boss%20card/primary_card.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';

class ProductList extends StatelessWidget {
  final String ordertype;
  final bool? isCancelled;
  final bool? isreturned;

  final bool isCheck = false;
  const ProductList(
      {Key? key, required this.ordertype, this.isCancelled, this.isreturned})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Row(children: [
                  // ordertype == 'Pending'
                  //     ? Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 5),
                  //       child: Checkbox(
                  //           side: MaterialStateBorderSide.resolveWith(
                  //             (states) => const BorderSide(
                  //                 width: 1.0, color: ThemeConfig.PRIMARY_COLOR),
                  //           ),
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10)),
                  //           splashRadius: 10,
                  //           checkColor: Colors.white,
                  //           focusColor: ThemeConfig.PRIMARY_COLOR,
                  //           activeColor: ThemeConfig.PRIMARY_COLOR,
                  //           onChanged: (bool? value) {
                  //             isCheck == value;
                  //           },
                  //           value: isCheck,
                  //         ),
                  //     )
                  //     : Container(),

                 

                  // const SizedBox(
                  //   width: 10,
                  // ),
                  Container(height: 100,width: 100, child: Image.asset('assets/images/fruits.jpg')),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      LabelText(titleString: 'TATA Sev'),
                      Desc(descString: 'Kg')
                      // const Text(
                      //   "TATA Sev ",
                      //   style: TextStyle(
                      //       color: ThemeConfig.MAIN_TEXT_COLOR,
                      //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                      //       fontWeight: FontWeight.bold,
                      //       letterSpacing: 1.00),
                      // ),
                      // const Text(
                      //   "1 kg ",
                      //   style: TextStyle(
                      //       color: ThemeConfig.SECONDARY_TEXT_COLOR,
                      //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                      //       fontWeight: FontWeight.normal,
                      //       letterSpacing: 1.00),
                      // ),
                    ],
                  ),
                ]),
              ),
              isCancelled == true
                  ? Column(
                      children: const [
                        Text(
                          "\u{20B9} 15.43 ",
                          style: TextStyle(
                              color: ThemeConfig.PRIMARY_COLOR,
                              fontSize: ThemeConfig.SUB_TITLE_SIZE,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.00),
                        ),
                        Desc(descString: 'Cancelled')

                        // Text(
                        //   "Cancelled",
                        //   style: TextStyle(
                        //       color: ThemeConfig.PRIMARY_COLOR,
                        //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                        //       fontWeight: FontWeight.bold,
                        //       letterSpacing: 1.00),
                        // ),
                      ],
                    )
                  : isreturned == true
                      ? Column(
                          children: const [
                            Text(
                              "\u{20B9}15.43 ",
                              style: TextStyle(
                                  color: ThemeConfig.PRIMARY_COLOR,
                                  fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.00),
                            ),
                            Desc(descString: 'Returned')
                            // Text(
                            //   "Returned",
                            //   style: TextStyle(
                            //       color: ThemeConfig.PRIMARY_COLOR,
                            //       fontSize: ThemeConfig.SUB_TITLE_SIZE,
                            //       fontWeight: FontWeight.bold,
                            //       letterSpacing: 1.00),
                            // ),
                          ],
                        )
                      : Column(
                          children: const [
                            Text(
                              "\u{20B9}15.43 ",
                              style: TextStyle(
                                  color: ThemeConfig.PRIMARY_COLOR,
                                  fontSize: ThemeConfig.SUB_TITLE_SIZE,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.00),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                      ordertype== 'Pending'? GestureDetector(
                          onTap: (){_showMyDialog(context);},
                          child: Icon(Icons.cancel_outlined,color: ThemeConfig.SECONDARY_TEXT_COLOR,),
                        )
                        :Container()
              // SizedBox(width: 5,),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MEDIUM),
        ),
        title: Text('Confirm Deletion'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Choose reason for cancelling order'),
              SizedBox(height: 10),
              DropdownButton(
                isExpanded: true,
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                underline: Container(
                  height: 0,
                ),
                value: "stock unavailable",
                elevation: 3,
                style: const TextStyle(
                  color: ThemeConfig.PRIMARY_COLOR,
                ),
                items: reasons
                    .map((String value) => DropdownMenuItem(
                        value: value,
                        child: SubText(
                          text: value,
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          size: ThemeConfig.NOTIFICATION_SIZE,
                        )))
                    .toList(),
                onChanged: (Object? values) {},
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}