import 'package:flutter/material.dart';

class NoOrder extends StatelessWidget {
  const NoOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: 200,
              image: AssetImage('assets/images/Capture.png'),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // SizedBox(
            //   width: 350,
            //   child: Row(
            //     children: const [
            //       Expanded(
            //         child: TitleText(
            //           titleString: "No Orders to deliver"
            //           // style: TextStyle(
            //           //   color: ThemeConfig.MAIN_TEXT_COLOR,
            //           //   fontSize: 30,
            //           // ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // const SizedBox(
            //   width: 300,
            //   child: Desc(
            //     descString:
            //         "It will take few seconds to add products from our global store",
            //     // style: TextStyle(color: ThemeConfig.MAIN_TEXT_COLOR, fontSize: 15),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.02,
            ),

            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     const Desc(
            //       descString: "Already bought plan?",
            //     ),
            //     const SizedBox(
            //       width: 2,
            //     ),
            //     GestureDetector(
            //       onTap: () async {
            //        await function();
            //       },
            //       child: const LabelText(
            //         titleString: "Refresh",
            //       ),
            //     ),
            //   ],
            // )
            // NoProductsButton(
            //   size: size,
            //   text: 'Global Store',
            // )
          ],
        ),
      ),
    );
  }
}
