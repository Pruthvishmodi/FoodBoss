import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class KhataRequest extends StatelessWidget {
  const KhataRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550),
        child: ListView(
          children: const [
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
            ListForRequest(),
          ],
        ),
      ),
    );
  }
}

class ListForRequest extends StatelessWidget {
  const ListForRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        foregroundImage: AssetImage('assets/images/profile_pic.jpg'),
      ),
      title: const LabelText(
        titleString: "Jay Soni",
      ),
      subtitle: GestureDetector(
        onTap: () => launch("tel://8780508717"),
        child: Desc(descString: "+91-8787878787"),
      ),
      trailing: const Icon(Icons.arrow_forward_rounded),
      onTap: () {
        Get.toNamed("/khata-management/request/individual");
      },
    );
  }
}
