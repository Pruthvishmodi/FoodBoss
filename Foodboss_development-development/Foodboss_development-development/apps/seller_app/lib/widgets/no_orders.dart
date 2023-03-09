import 'package:flutter/material.dart';
import 'package:seller_app/widgets/button.dart';
import 'package:seller_app/widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/main_label.dart';

class NoOrders extends StatelessWidget {
  final String descString;
  final VoidCallback refresh; 
  const NoOrders({ Key? key, required this.descString, required this.refresh }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // OrderListController ctrl = Get.find<OrderListController>();
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async{
         refresh();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: size.width,
          height: size.height - 250,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage(
                'assets/images/no_order.png'
              ),width: 150,),
              MainLabelText(titleString: "No Orders found"),
              SizedBox(width: 200, child: Desc(descString: descString,alignment: TextAlign.center,)),
              SizedBox(height: 10,),
              SizedBox(
                width: 200,
                child: Row(
                  children: [
                    Expanded(child: PrimaryButton(op: () async{
                      refresh();
                    }, text: 'Refresh', type: 'filled',) ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}