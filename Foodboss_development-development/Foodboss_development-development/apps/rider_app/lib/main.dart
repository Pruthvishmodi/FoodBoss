import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rider_app/screens/about_us.dart';
import 'package:rider_app/screens/add_orders/layout.dart';
import 'package:rider_app/screens/address_add_screen/address_add_screen.dart';
import 'package:rider_app/screens/customer_details/layout.dart';
import 'package:rider_app/screens/delivery_boy_details.dart';
import 'package:rider_app/screens/edit_profile_screen/layout.dart';
import 'package:rider_app/screens/faq_screen/layout.dart';
import 'package:rider_app/screens/global_store_screen/product_list_screen.dart';
import 'package:rider_app/screens/global_store_screen/store.dart';
import 'package:rider_app/screens/home/home_screen.dart';
import 'package:rider_app/screens/individual_report_screen.dart';
import 'package:rider_app/screens/intro_screen1.dart';
import 'package:rider_app/screens/khata%20management%20screen/layout.dart';
import 'package:rider_app/screens/khata%20request/layout.dart';
import 'package:rider_app/screens/khata_customer_details.dart';
import 'package:rider_app/screens/login_screen/layout.dart';
import 'package:rider_app/screens/my%20report%20screen/layout.dart';
import 'package:rider_app/screens/my_delivery_boy_screen/layout.dart';
import 'package:rider_app/screens/my_earnings/myEarningsScreen.dart';
import 'package:rider_app/screens/my_store/MyStoreScreen.dart';
import 'package:rider_app/screens/new_delivery_boy_screen/layout.dart';
import 'package:rider_app/screens/notification/NotificationScreen.dart';
import 'package:rider_app/screens/order%20summary/order_summary_screen.dart';
import 'package:rider_app/screens/orders%20screen/assign_rider.dart';
import 'package:rider_app/screens/orders%20screen/layout.dart';
import 'package:rider_app/screens/otp/layout.dart';
import 'package:rider_app/screens/pick_location_screen/pick_location_screen.dart';
import 'package:rider_app/screens/plan_history_screen/previous_plan.dart';
import 'package:rider_app/screens/privacy_screen/layout.dart';
import 'package:rider_app/screens/product_store_screen/product_store_screen.dart';
import 'package:rider_app/screens/report_problem_screen/layout.dart';
import 'package:rider_app/screens/return_in_progress_orders/ReturnInProgressOrdersScreen.dart';
import 'package:rider_app/screens/scan_product_screen/scan_product_screen.dart';
import 'package:rider_app/screens/select_delivery/select_delivery_boy.dart';
import 'package:rider_app/screens/signup_screen/layout.dart';
import 'package:rider_app/screens/splash_screen.dart';
import 'package:rider_app/screens/store_registration_screen/layout.dart';
import 'package:rider_app/screens/store_registration_screen/store_registration_screen.dart';
import 'package:rider_app/screens/terms_and_conditions/layout.dart';
import 'package:rider_app/screens/video_help_screen/layout.dart';
import 'package:rider_app/widgets/view%20customer%20details/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rider App',
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
      initialRoute: '/',
      getPages: Routes.routes,
      unknownRoute:
          GetPage(name: '/notfound', page: () => const SplashScreen()),
    );
  }
}

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/intro', page: () => const IntroScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/otpverify', page: () => const OtpPage()),
    GetPage(name: '/register', page: () => const SignUpPage()),
    GetPage(name: '/khata-management', page: () => const KhataPage()),
    GetPage(
        name: '/khata-management/request',
        page: () => const KhataRequestPageMain()),
    GetPage(
        name: '/khata-management/request/individual',
        page: () => const KhataRequestPage()),
    GetPage(
        name: '/store-product/individual',
        page: () => const ProductStoreScreen(
              pageTitle: "Red Apple",
            )),
    GetPage(name: '/rider-management', page: () => const MyDeliveryBoyPage()),
    GetPage(name: '/store-registration', page: () => StoreRegistrationScreen()),
    GetPage(
        name: '/delivery-schedule', page: () => const DeliverySchedulePage()),
    GetPage(name: '/reports', page: () => const ReportsPage()),
    GetPage(name: '/reports/individual', page: () => const IndividualReports()),
    GetPage(name: '/videos', page: () => const VideoPage()),
    GetPage(name: '/support', page: () => const SupportPage()),
    GetPage(name: '/faqs', page: () => FaqPage()),
    GetPage(name: '/buy-orders', page: () => const PaymentScreen()),
    GetPage(name: '/edit-profile', page: () => const EditProfilePage()),
    GetPage(name: '/deliveryboys/add', page: () => const AddDeliveryBoyPage()),
    GetPage(name: '/ordersummary', page: () => const OrderSummary()),
    GetPage(name: '/product-store', page: () => const ProductStoreScreen()),
    GetPage(name: '/deliveryboy-detail', page: () => DeliveryBoyDetails()),
    GetPage(
        name: '/khata-management/details',
        page: () => const KhataCustomerDetails()),
    GetPage(name: '/my-customer', page: () => const MyCustomerDetails()),
    GetPage(name: '/deliveryboy/select', page: () => const SelectDeliveryBoy()),

    GetPage(name: '/store-add', page: () => StoreRegistrationScreen()),
    GetPage(name: '/store-address', page: () => AddressAddScreen()),
    // GetPage(name: '/global-store', page: () => GlobalStoreScreen()),
    GetPage(name: '/global-store', page: () => Store()),
    GetPage(name: '/pick-location', page: () => const PickLocationScreen()),

    GetPage(name: '/barcode', page: () => ScanProductBarcode()),
    GetPage(name: '/about-us', page: () => AboutUs()),

    GetPage(name: '/privacy', page: () => PrivacyPolicyScreen()),
    GetPage(name: '/product-list-screen', page: () => ProductListScreen()),
    GetPage(name: '/terms', page: () => Terms()),

    GetPage(name: '/plan-history', page: () => const PreviousPlan()),
    GetPage(name: '/assign-delivery', page: () => const AssignRiderPage()),
    GetPage(name: '/test', page: () => const PickLocationScreen()),
    GetPage(name: '/test-address', page: () => DeliverySchedulePage()),

    GetPage(name: '/my-earnings', page: () => const MyEarningsScreen()),
    GetPage(name: '/my-orders', page: () => OrderPage()),
    GetPage(name: '/my-store', page: () => const MyStore()),
    GetPage(
        name: '/notification-screen', page: () => const NotificationScreen()),
    GetPage(
        name: '/progress-orders',
        page: () => const ReturnInProgressOrdersScreen()),

    // GetPage(name: '/test', page: page)
  ];
}
