import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:seller_app/screens/Buy_order_details/buy_details.dart';
import 'package:seller_app/screens/add_customer/add_customer.dart';
import 'package:seller_app/screens/add_orders/layout.dart';
import 'package:seller_app/screens/address_add_screen/address_add_screen.dart';
import 'package:seller_app/screens/customer_details/layout.dart';
import 'package:seller_app/screens/delivery_boy_details/delivery_boy_details.dart';
import 'package:seller_app/screens/edit_profile_screen/layout.dart';
import 'package:seller_app/screens/faq_screen/layout.dart';
import 'package:seller_app/screens/global_store_screen/product_list_screen.dart';
import 'package:seller_app/screens/global_store_screen/store.dart';
import 'package:seller_app/screens/home/home_screen.dart';
import 'package:seller_app/screens/individual%20reports/individual_report_screen.dart';
import 'package:seller_app/screens/intro_screen.dart';
import 'package:seller_app/screens/khata%20management%20screen/layout.dart';
import 'package:seller_app/screens/khata%20request/layout.dart';
import 'package:seller_app/screens/khata_customer_details/khata_customer_details.dart';
import 'package:seller_app/screens/khata_customer_details/khata_pdf_report.dart';
import 'package:seller_app/screens/login_screen/layout.dart';
import 'package:seller_app/screens/my%20report%20screen/layout.dart';
import 'package:seller_app/screens/my%20report%20screen/pdf_report_preview.dart';
import 'package:seller_app/screens/my_delivery_boy_screen/layout.dart';
import 'package:seller_app/screens/new_delivery_boy_screen/layout.dart';
import 'package:seller_app/screens/new_order_pdf_preview.dart';
import 'package:seller_app/screens/order%20summary/order_summary_screen.dart';
import 'package:seller_app/screens/orders%20screen/assign_rider.dart';
import 'package:seller_app/screens/otp/layout.dart';
import 'package:seller_app/screens/permission_screens.dart';
import 'package:seller_app/screens/pick_location_screen/pick_location_screen.dart';
import 'package:seller_app/screens/plan_history_screen/previous_plan.dart';
import 'package:seller_app/screens/privacy_screen/layout.dart';
import 'package:seller_app/screens/product_store_screen/product_details_screen.dart';
import 'package:seller_app/screens/product_store_screen/product_store_screen.dart';
import 'package:seller_app/screens/report_problem_screen/layout.dart';
import 'package:seller_app/screens/scan_product_screen/scan_product_screen.dart';
import 'package:seller_app/screens/select_delivery_boy/select_delivery_boy.dart';
import 'package:seller_app/screens/signup_screen/layout.dart';
import 'package:seller_app/screens/splash_screen.dart';
import 'package:seller_app/screens/store_registration_screen/layout.dart';
import 'package:seller_app/screens/store_registration_screen/store_registration_screen.dart';
import 'package:seller_app/screens/terms_and_conditions/layout.dart';
import 'package:seller_app/screens/video_help_screen/layout.dart';
import 'package:seller_app/widgets/drawer/about_us.dart';
import 'package:seller_app/widgets/view%20customer%20details/layout.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  //For push notifications
  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title!),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body!)],
                ),
              ),
            );
          },
        );
      }
    });

    getToken();
  }

  late String token;
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print('fcm token - $token');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
      title: 'Foodboss Seller',
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
        page: () => KhataRequestPage()),
    GetPage(
        name: '/store-product/individual',
        page: () => const ProductDetailsScreen()),
    GetPage(name: '/rider-management', page: () => const MyDeliveryBoyPage()),
    GetPage(
        name: '/store-registration',
        page: () => const StoreRegistrationScreen()),
    GetPage(
        name: '/delivery-schedule', page: () => const DeliverySchedulePage()),
    GetPage(name: '/reports', page: () => const ReportsPage()),
    GetPage(name: '/reports/individual', page: () => IndividualReports()),
    GetPage(name: '/videos', page: () => VideoPage()),
    GetPage(name: '/support', page: () => const SupportPage()),
    GetPage(name: '/faqs', page: () => FaqPage()),
    GetPage(name: '/buy-orders', page: () => const PaymentScreen()),
    GetPage(name: '/edit-profile', page: () => const EditProfilePage()),
    GetPage(name: '/deliveryboys/add', page: () => const AddDeliveryBoyPage()),
    GetPage(name: '/customer/add', page: () => const AddCustomer()),
    GetPage(name: '/ordersummary', page: () => const OrderSummary()),
    GetPage(name: '/product-store', page: () => ProductStoreScreen()),
    GetPage(name: '/deliveryboy-detail', page: () => DeliveryBoyDetails()),
    GetPage(
        name: '/khata-management/details',
        page: () => const KhataCustomerDetails()),
    GetPage(name: '/my-customer', page: () => const MyCustomerDetails()),
    GetPage(name: '/deliveryboy/select', page: () => const SelectDeliveryBoy()),

    GetPage(name: '/store-add', page: () => const StoreRegistrationScreen()),
    GetPage(name: '/store-address', page: () => const AddressAddScreen()),
    // GetPage(name: '/global-store', page: () => GlobalStoreScreen()),
    GetPage(name: '/global-store', page: () => const Store()),
    GetPage(name: '/pick-location', page: () => const PickLocationScreen()),

    GetPage(name: '/barcode', page: () => const ScanProductBarcode()),
    GetPage(name: '/privacy', page: () => PrivacyPolicyScreen()),
    GetPage(name: '/product-list-screen', page: () => ProductListScreen()),
    GetPage(name: '/terms', page: () => Terms()),
    GetPage(name: '/about-us', page: () => AboutUs()),
    

    GetPage(name: '/plan-history', page: () => const PreviousPlan()),
    GetPage(name: '/assign-delivery', page: () => const AssignRiderPage()),
    GetPage(name: '/test-address', page: () =>  const StoreRegistrationScreen()),
    GetPage(name: '/test', page: () => const IntroScreen()),
    GetPage(name: '/buy-details', page: () => const BuyDetails()),
    GetPage(name: '/permit', page: () => PermissionScreens1()),
    // GetPage(name: '/permit2', page: () => PermissionScreens2()),
    GetPage(name: '/permit3', page: () => PermissionScreens2()),
    GetPage(name: '/new_order_pdf', page: () => NewOrdersPdfPreview()),
    GetPage(name: '/report-pdf-preview', page: () => const PdfReportPreview()),
    GetPage(name: '/khata-pdf-preview', page: () => const KhataReportPdf())
  ];
}
