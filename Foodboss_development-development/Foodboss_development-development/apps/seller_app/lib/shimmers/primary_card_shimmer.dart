import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/shimmers/card_shimmer.dart';
class PrimaryCardShimmer extends StatefulWidget {
  PrimaryCardShimmer({Key? key}) : super(key: key);

  @override
  State<PrimaryCardShimmer> createState() => _PrimaryCardShimmerState();
}

class _PrimaryCardShimmerState extends State<PrimaryCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.00),
        color: ThemeConfig.WHITE_COLOR,
      ),
      margin: const EdgeInsets.all(20.00),
      padding: const EdgeInsets.all(20.00),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 50,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(height: 5,),

                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 50,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                // width: 20,
                // height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                 
                ),
                padding: EdgeInsets.all(10),
                child: ShimmerWidget.rectangular(
                  height: 40,
                  width: 40,
                  border: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(height: 5,),
                    ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ShimmerWidget.rectangular(
                  height: 40,
                  width: double.infinity,
                  border: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
