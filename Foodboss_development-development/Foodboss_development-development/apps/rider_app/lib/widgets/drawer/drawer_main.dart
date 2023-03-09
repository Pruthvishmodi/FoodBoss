import 'package:flutter/material.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/widgets/drawer/profile_for_drawer.dart';
import 'package:rider_app/widgets/drawer/routes_for_drawer.dart';

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
          // RoutesForDrawer(
          //   icon: Icons.list_alt_outlined,
          //   title: "Kahata Management",
          //   url: "/khata-management",
          //   badgeCount: 5,
          // ),
          // RoutesForDrawer(
          //   icon: Icons.person,
          //   title: "Rider management",
          //   url: "/rider-management",
          // ),
          RoutesForDrawer(
            url: "/my-orders",
            title: 'My Orders',
            icon: Icons.add_shopping_cart,
          ),
          RoutesForDrawer(
            url: "/my-earnings",
            title: 'My Earnings',
            icon: Icons.monetization_on,
          ),
          RoutesForDrawer(
            url: '/my-store',
            title: 'My Store',
            icon: Icons.store_mall_directory,
          ),
          RoutesForDrawer(url: 'progress-orders', title: 'Return in Progress Orders', icon: Icons.timeline),
          RoutesForDrawer(
            icon: Icons.delivery_dining,
            title: "Delivery Settings",
            url: "/delivery-schedule",
          ),
          // RoutesForDrawer(
          //   icon: Icons.receipt_long_rounded,
          //   title: "Reports",
          //   url: "/reports",
          // ),
          RoutesForDrawer(
            icon: Icons.people,
            title: "My customers",
            url: "/my-customer",
          ),

          RoutesForDrawer(
            icon: Icons.support_agent_rounded,
            title: "Support",
            url: "/support",
          ),
          RoutesForDrawer(
            icon: Icons.question_answer_rounded,
            title: "FAQs",
            url: "/faqs",
          ),
          RoutesForDrawer(
            icon: Icons.video_library_outlined,
            title: "Video for helps",
            url: "/videos",
          ),
          RoutesForDrawer(
            icon: Icons.security_outlined,
            title: "Privacy Policy",
            url: "/privacy",
          ),
          RoutesForDrawer(
            icon: Icons.privacy_tip_outlined,
            title: "Terms & Conditions",
            url: "/terms",
          ),
          RoutesForDrawer(
            icon: Icons.privacy_tip_outlined,
            title: "Test",
            url: "/store-registration",
          ),
        ],
      ),
    );
  }
}
