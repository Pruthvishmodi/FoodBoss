import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/khata_controller.dart';
import 'package:seller_app/utils/states.dart';

import 'package:seller_app/widgets/text_widgets/desc.dart';
import 'package:seller_app/widgets/text_widgets/label_widget.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:url_launcher/url_launcher.dart';

class KhataRequest extends StatelessWidget {
  KhataController controller = Get.put(KhataController(), permanent: false);
  KhataRequest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status == States.SUCCESS_STATE) {
        return Center(
          child: RefreshIndicator(
            onRefresh: ()async => controller.getKhataRequestList(),
            child: ListView.builder(
              itemCount: controller.data.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var khata = controller.data.data![index];
                return ListForRequest(
                  index: index,
                  img: khata.image!,
                  name: khata.customerName == '' ? "User" : khata.customerName!,
                  number: khata.phone!,
                );
              },
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

class ListForRequest extends StatelessWidget {
  final String name;
  final int index;

  final String number;
  final String img;

  const ListForRequest(
      {Key? key, required this.name, required this.number, required this.img, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: 
      Container(
                                height: 50,
                                width: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(
                                  color: ThemeConfig.FORM_COLOR,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  name.split('')[0].toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: ThemeConfig.PRIMARY_COLOR),
                                ),
                              ),
      // CircleAvatar(
      //   foregroundImage: NetworkImage(img),
      // ),
      title: LabelText(
        titleString: name,
      ),
      subtitle: GestureDetector(
        // onTap: () => launch("tel://8780508717"),
        child: Desc(descString: number),
      ),
      trailing: const Icon(Icons.arrow_forward_rounded),
      onTap: () {
        Get.toNamed("/khata-management/request/individual",arguments: [index]);
      },
    );
  }
}
