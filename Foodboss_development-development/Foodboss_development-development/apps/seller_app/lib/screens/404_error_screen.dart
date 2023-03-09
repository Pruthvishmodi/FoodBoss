import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.refreshFunction}) : super(key: key);

  final Future<void> Function() refreshFunction; 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height - 200,
        width: size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.030,
                ),
                const Text(
                  'Not Found ',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Features you are looking is missing... ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                InkWell(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ThemeConfig.PRIMARY_COLOR,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.refresh,color: ThemeConfig.WHITE_COLOR,),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Refresh',
                            style: TextStyle(fontSize: 15, color: ThemeConfig.WHITE_COLOR),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async{
                    await refreshFunction();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
