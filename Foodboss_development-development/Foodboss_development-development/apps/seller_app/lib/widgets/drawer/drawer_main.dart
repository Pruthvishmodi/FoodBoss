import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/business_controller/auth/login_controller.dart';
import 'package:seller_app/widgets/drawer/profile_for_drawer.dart';
import 'package:seller_app/widgets/drawer/routes_for_drawer.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeConfig.WHITE_COLOR,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ProfileForDrawer(),
          // Divider(),
          RoutesForDrawer(
            icon: Icons.home,
            title: "Home",
            url: "/home",
          ),
          RoutesForDrawer(
            icon: Icons.list_alt_outlined,
            title: "Khata Management",
            url: "/khata-management",
            // badgeCount: 5,
          ),
          RoutesForDrawer(
            icon: Icons.person,
            title: "Rider management",
            url: "/rider-management",
          ),
          ListTile(
            title: const Text('Delivery Settings'),
            onTap: () {
              Get.offNamed(
                '/delivery-schedule',
              );
            },
            leading: const Icon(Icons.delivery_dining),
          ),
          // RoutesForDrawer(
          //   icon: Icons.delivery_dining,
          //   title: "Delivery Settings",
          //   url: "/delivery-schedule",
          // ),
          RoutesForDrawer(
            icon: Icons.receipt_long_rounded,
            title: "Reports",
            url: "/reports",
          ),
          RoutesForDrawer(
            icon: Icons.people,
            title: "My customers",
            url: "/my-customer",
          ),

          RoutesForDrawer(
            icon: Icons.question_answer_rounded,
            title: "FAQs",
            url: "/faqs",
          ),
          // RoutesForDrawer(
          //   icon: Icons.video_library_outlined,
          //   title: "Video for helps",
          //   url: "/videos",
          // ),
          ListTile(
            title: const Text('Videos for help'),
            onTap: () {
              Get.toNamed('/videos', arguments: [false]);
            },
            leading: const Icon(Icons.video_library_outlined),
          ),
          RoutesForDrawer(
            icon: Icons.support_agent_rounded,
            title: "Support",
            url: "/support",
          ),
          RoutesForDrawer(
            icon: Icons.security_outlined,
            title: "Privacy Policy",
            url: "/privacy",
            args: false,
          ),
          RoutesForDrawer(
            icon: Icons.privacy_tip_outlined,
            title: "Terms & Conditions",
            url: "/terms",
            args: false,
          ),
          // RoutesForDrawer(
          //   icon: Icons.privacy_tip_outlined,
          //   title: "About Us",
          //   url: "/about-us",
          //   args: false,
          // ),

          // RoutesForDrawer(
          //   icon: Icons.privacy_tip_outlined,
          //   title: "Test",
          //   // url: '/store-add',
          //   url: '/pick-location',
          // ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => AuthController().logout(),
            leading: const Icon(Icons.exit_to_app),
          )
        ],
      ),
    );
  }
}
