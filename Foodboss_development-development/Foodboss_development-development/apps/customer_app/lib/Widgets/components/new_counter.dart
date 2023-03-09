import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class NewCounter extends StatelessWidget {
  final double? width;
  final int count;
  final VoidCallback increment;
  final VoidCallback decrement;

  const NewCounter({
    Key? key,
    this.width,
    required this.count,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: width ?? 80,
          height: 30,
          decoration: BoxDecoration(
              color:
                  count < 1 ? ThemeConfig.whiteColor : ThemeConfig.primaryColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 0.5,
                  color: count < 1
                      ? ThemeConfig.greyColor
                      : ThemeConfig.primaryColor)),
          child: count < 1
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: increment,
                  child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: const Text('Add',
                          style: TextStyle(
                              color: ThemeConfig.secondaryColor,
                              fontSize: ThemeConfig.labelSize,
                              fontWeight: FontWeight.w900))))
              : Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: decrement,
                            child: Container(
                              // color: ThemeConfig.whiteColor,
                              width: double.infinity,
                              height: double.infinity,
                              child: const Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ))),
                    Center(
                        child: Text(count.toString(),
                            style: const TextStyle(
                                color: ThemeConfig.mainTextColor,
                                fontSize: ThemeConfig.labelSize,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: increment,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: const Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ))),
                  ],
                )),
    );
  }
}
