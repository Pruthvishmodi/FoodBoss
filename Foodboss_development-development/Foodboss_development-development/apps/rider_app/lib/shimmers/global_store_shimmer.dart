import 'package:flutter/material.dart';
import 'package:rider_app/shimmers/card_shimmer.dart';

class MainCategoryShimmer extends StatelessWidget {
  const MainCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 60,
            width: 60,
            border:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: ShimmerWidget.rectangular(
              height: 20,
              border: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
        ],
      ),
    );
  }
}

class SubcategoryShimmer extends StatelessWidget {
  const SubcategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ShimmerWidget.rectangular(
              height: 20,
              border: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 70,
            width: 70,
            border:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              ShimmerWidget.rectangular(
                height: 10,
      width: MediaQuery.of(context).size.width *.7,

                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 10,
              ),
              ShimmerWidget.rectangular(
                height: 10,
                      width: MediaQuery.of(context).size.width *.7,

                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 10,
              ),
              ShimmerWidget.rectangular(
                height: 10,
                      width: MediaQuery.of(context).size.width *.7,

                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
