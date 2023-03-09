import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/shimmers/card_shimmer.dart';
class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          ),
                      color: Colors.transparent),
                  // color: ThemeConfig.PRIMARY_COLOR,
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50),
                        child: Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerWidget.rectangular(
                      height: 150,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                                // Container(
                                //     child: Image.asset(
                                //   'assets/images/shopImage0.jpg',
                                //   height: 100,
                                //   width: 70,
                                //   fit: BoxFit.cover,
                                // ),),
                                const SizedBox(width: 20,),
                                Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15,),
                                    ShimmerWidget.rectangular(
                      height: 30,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                                    const SizedBox(height: 5,),

                                    SizedBox(
                                        width: size.width * .5,
                                        child: ShimmerWidget.rectangular(
                      height: 20,
                      width: 200,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
        Expanded(
            flex: 7,
            
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                                const SizedBox(height: 20,),

                   ShimmerWidget.rectangular(
                      height: 30,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     ShimmerWidget.rectangular(
                      height: 60,
                      width: 60,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                      // Container(
                      //     width: 100.0,
                      //     height: 100.0,
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      //       color: Colors.redAccent,
                      //     ),
                      //     child: const Image(
                      //       image: AssetImage('assets/images/profile_pic.jpg'),
                      //     )),
                      SizedBox(
                        width: size.height * 0.03,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            ShimmerWidget.rectangular(
                      height: 20,
                      width: 150,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                                const SizedBox(height: 5,),

                          ShimmerWidget.rectangular(
                      height: 20,
                      width: 150,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
            
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  ShimmerWidget.rectangular(
                      height: 30,
                      width: 150,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    const SizedBox(height:10 ,),

            
                  Container(padding:  const EdgeInsets.all(10),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10),),color: ThemeConfig.WHITE_COLOR),
                    // color: ThemeConfig.WHITE_COLOR,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                         const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                         const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                          ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                         const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                           ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                         const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                           ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                         const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(),
                        ),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                          ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
ShimmerWidget.rectangular(
                      height: 20,
                      width: 100,
                      border: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                          ],
                        ),
                      ],
                    
                    ),
                  ),
                  // SizedBox(height: 50,)
                  ],
                ),
              ),
            )
            ),
      ],
    );
  }
}