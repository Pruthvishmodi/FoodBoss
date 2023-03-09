import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Widgets/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      enabled: true,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(),
            SB.medium(),
            ShimmerContainer(
              height: 200,
              width: double.infinity,
            ),
            SB.medium(),
            ShimmerContainer(),
            SB.medium(),
            SB.medium(),
            ShimmerContainer(
              height: 200,
              width: double.infinity,
            ),
            SB.medium(),
            // ShimmerContainer(
            //   height: 200,
            //   width: double.infinity,
            // ),
          ],
        ),
      ),
    );
  }
}

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ThemeConfig.screenPadding,
      child: Row(
        children: [
          ShimmerContainerSquare(),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.start,
              children: const [
                ShimmerContainer(),
                ShimmerContainer(
                  width: double.infinity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerContainerSquare extends StatelessWidget {
  final double? size;
  const ShimmerContainerSquare({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            5,
          )),
      height: size ?? 100,
      width: size ?? 100,
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  const ShimmerContainer({
    Key? key,
    this.width, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            5,
          )),
      height: height ?? 30,
      width: width ?? 150,
    );
  }
}