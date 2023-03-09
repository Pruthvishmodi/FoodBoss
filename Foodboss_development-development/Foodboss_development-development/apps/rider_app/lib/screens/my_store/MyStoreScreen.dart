import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/config/page_layout.dart';
import 'package:rider_app/controller/my_store_controller.dart';
import 'package:rider_app/screens/my_store/Available_store.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/desc.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/main_label.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyStoreController myStoreController =
        Get.put(MyStoreController(), permanent: false);
    codeSheet() {
      Get.bottomSheet(Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                color: ThemeConfig.WHITE_COLOR),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      LabelText(titleString: 'QR Code'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
    }

    var size = MediaQuery.of(context).size;

    return PageLayout(
      appbarFunc: () {
        Get.to(const AvailableStores());
      },
      bottombar: true,
      title: 'My Store',
      color: ThemeConfig.PRIMARY_COLOR,
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Obx(() {
            if (myStoreController.myStoreData.data != null) {
              return ListView.builder(
                itemCount: myStoreController.myStoreData.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var list = myStoreController.myStoreData.data![index];
                  return MyStoreCard(
                    name: list.name!,
                    address: list.address!,
                    phone: list.phone!,
                    time: '',
                    img: list.image!,
                    lat: list.latitude!,
                    long: list.longitude!,
                    op: () => myStoreController.removeStore(list.id!),
                    earning: list.deliveryCharge!,
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
  final String address;
  final String phone;
  final String time;
  final String lat;
  final String earning;

  final String long;
  final VoidCallback op;
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
      required this.long,
      required this.op,
      required this.earning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
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
            children: [
              Container(
                height: 90,
                width: 90,
                // child: child,
                decoration: BoxDecoration(
                    // color: ThemeConfig.primaryColorLite,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(img),
                    )),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainLabelText(
                      titleString: '${name}',
                      isAlign: true,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: LabelText(
                              isLeft: 'yes',
                              titleString: "${address}",
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        launch(
                            'https://www.google.com/maps/search/?api=1&query=$lat,$long');
                      },
                      behavior: HitTestBehavior.translucent,
                      child: const Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Desc(descString: '\u{20B9}${earning.split('.')[0]}')
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: PrimaryButton(
                // width: MediaQuery.of(context).size.width,
                text: 'Remove Store',
                op: op,
                type: 'filled'),
          ),
        ],
      ),
    );
  }
}
