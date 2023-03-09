import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:flutter/material.dart';

class ValueCounter extends StatefulWidget {
  ValueCounter({Key? key}) : super(key: key);

  @override
  State<ValueCounter> createState() => _ValueCounterState();
}

class _ValueCounterState extends State<ValueCounter> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 30,
      decoration: BoxDecoration(
        color: num == 0 ? ThemeConfig.whiteColor : ThemeConfig.primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      // width: num == 0 ? 40 : 90,
      // width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          num != 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (num > 0) {
                        num--;
                      }
                    });
                  },
                  child: Container(
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.remove,
                        size: 20,
                      )))
              : Container(),
          num != 0
              ? Text(
                  num.toString(),
                  style: const TextStyle(fontSize: 15),
                )
              : Container(),
          GestureDetector(
              onTap: () {
                setState(() {
                  num++;
                });
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 40,
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ))),
        ],
      ),
    );
  }
}