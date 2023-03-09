import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/shimmers/card_shimmer.dart';
class MyStoreShimmer extends StatefulWidget {
  MyStoreShimmer({Key? key}) : super(key: key);

  @override
  State<MyStoreShimmer> createState() => _MyStoreShimmerState();
}

class _MyStoreShimmerState extends State<MyStoreShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ThemeConfig.WHITE_COLOR, 
          ),
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [SizedBox(width: 0,),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimmerWidget.rectangular(
                        height: 70,
                        width: 70,
                        border: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 0,
                          ),
                          ShimmerWidget.rectangular(
                      height: 15,
                      width: double.infinity,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                        const SizedBox(
                            height: 5,
                          ),  
                          
                         ShimmerWidget.rectangular(
                      height: 15,
                      width: double.infinity,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                                    const SizedBox(
                            height: 5,
                          ),
                          ShimmerWidget.rectangular(
                      height: 15,
                      width: double.infinity,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          const SizedBox(height: 0,),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              
            ],
          ),
        );
  }
}