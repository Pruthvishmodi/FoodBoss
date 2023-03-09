import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/profile_controller.dart';
import 'package:seller_app/models/shop_close_request.dart';
import 'package:seller_app/utils/states.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:seller_app/controller/business_controller/auth/user_controller.dart';
import 'package:seller_app/models/auth/UserModel.dart';
import 'package:seller_app/widgets/main_label.dart';

class ProfileForDrawer extends StatelessWidget {
  ProfileForDrawer({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    ProfileController profileController =
        Get.put(ProfileController(), permanent: false);
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
              Obx(() {
                if (profileController.status == States.SUCCESS_STATE) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(
                        profileController.getUser.ownerImage.toString()),
                    radius: 40,
                  );
                } else {
                  return CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile_pic.jpg'),
                    radius: 40,
                  );
                }
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MainLabelText(
                    titleString: user.Username!,
                    isWhite: true,
                  ),
                  // Text(
                  //   user.email!,
                  //   style: const TextStyle(
                  //     fontSize: ThemeConfig.NOTIFICATION_SIZE,
                  //     color: ThemeConfig.WHITE_COLOR,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '+91 ${user.phoneNumber!}',
                style: const TextStyle(
                  color: ThemeConfig.WHITE_COLOR,
                ),
              ),
              Obx(
                () => Switch.adaptive(
                    activeColor: ThemeConfig.WHITE_COLOR,
                    inactiveThumbColor: ThemeConfig.DISTRUCTIVE_COLOR,
                    value: !profileController.storeStatus.value,
                    onChanged: (newValue) {
                      int i = profileController.storeStatus.value ? 0 : 1;
                      profileController
                          .toggleShopStatus(ShopCloseRequest(isShopClose: i));
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
