import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/controller/my_store_controller.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailableStores extends StatelessWidget {
  const AvailableStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyStoreController myStoreController =
        Get.put(MyStoreController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: ThemeConfig.WHITE_COLOR,
        iconTheme: const IconThemeData(color: ThemeConfig.WHITE_COLOR),
        title: const Text("Available Stores",
            style: TextStyle(color: ThemeConfig.WHITE_COLOR)),
        elevation: 0,
        backgroundColor: ThemeConfig.PRIMARY_COLOR,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Obx(() {
            if (myStoreController.data.data != null) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: myStoreController.data.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var list = myStoreController.data.data![index];
                  return MyStoreCard(
                    name: list.name!,
                    address: list.address!,
                    phone: list.phone!,
                    time: '',
                    img: list.image!,
                    lat: list.latitude!,
                    lang: list.longitude!,
                    op: () {
                      myStoreController.sendShhopRequest(
                          list.id.toString(), 'accept');
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}

class MyStoreCard extends StatelessWidget {
  final String name;
  final VoidCallback op;
  final String address;
  final String phone;
  final String lat;
  final String lang;

  final String time;
  final String img;
  final bool? canAdd;
  const MyStoreCard(
      {Key? key,
      required this.name,
      required this.phone,
      required this.time,
      required this.img,
      this.canAdd,
      required this.address,
      required this.lat,
      required this.lang,
      required this.op})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool switchValue = true;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.00),
          color: ThemeConfig.WHITE_COLOR,
        ),
        margin: const EdgeInsets.only(
          top: 20.00,
        ),
        padding: const EdgeInsets.all(20.00),
        child: Column(
          children: [
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      // child: child,
                      decoration: BoxDecoration(
                          // color: ThemeConfig.primaryColorLite,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(img),
                          )),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      height: 100,
                      // alignment: Alignment.,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainLabelText(titleString: name),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: LabelText(
                                    isLeft: 'yes',
                                    titleString: address,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => launch("tel://${phone}"),
                            child: Desc(descString: "+91-${phone}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      launch(
                          'https://www.google.com/maps/search/?api=1&query=$lat,$lang');
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.red,
                    )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: PrimaryButton(
                  // width: MediaQuery.of(context).size.width,
                  text: 'Send Requset',
                  op: op,
                  type: 'filled'),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
