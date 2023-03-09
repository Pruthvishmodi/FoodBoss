import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/controller/business_controller/auth/user_controller.dart';
import 'package:rider_app/models/auth/UserModel.dart';
import 'package:rider_app/widgets/main_label.dart';

class ProfileForDrawer extends StatelessWidget {
  const ProfileForDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    User user = userController.getUser;
    bool value = false;
    return Container(
      color: ThemeConfig.PRIMARY_COLOR,
      // margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 80, bottom: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                radius: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                   MainLabelText(
                    titleString: user.Username!,
                    isWhite: true,
                  ),
                   Text(
                    user.email!,
                    style: TextStyle(
                      color: ThemeConfig.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                '+91 ${user.phoneNumber!}',
                style: TextStyle(
                  color: ThemeConfig.WHITE_COLOR,
                ),
              ),
              Switch.adaptive(
                  activeColor: ThemeConfig.WHITE_COLOR,
                  inactiveThumbColor: ThemeConfig.DISTRUCTIVE_COLOR,
                  value: value,
                  onChanged: (newValue) {
                    value = newValue;
                  })
            ],
          )
        ],

      ),
    );
  }
}
