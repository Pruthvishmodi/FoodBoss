import 'package:flutter/material.dart';
import 'package:seller_app/models/catagories.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class SomethingWentWrongScreen extends StatelessWidget {
  const SomethingWentWrongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Something went wrong...',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                const Text(
                  'We are working on fixing the problem.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                const Text(
                  'Please try again.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.045,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 70),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeConfig.PRIMARY_COLOR,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.refresh),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Refresh',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      print('Done');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
