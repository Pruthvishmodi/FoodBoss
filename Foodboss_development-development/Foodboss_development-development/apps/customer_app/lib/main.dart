import 'package:customer_app/Screens/Banner/test.dart';
import 'package:customer_app/Screens/FAQs/faq_screen.dart';
import 'package:customer_app/Screens/HelpAndSupportScreen/help_and_support.dart';
import 'package:customer_app/Screens/HomeScreen/home_screen.dart';
import 'package:customer_app/Screens/KhataManagementScreen/khata_management_screen.dart';
import 'package:customer_app/Screens/KhataManagementScreen/khata_store_detail_screen.dart';
import 'package:customer_app/Screens/LoginScreen/loginscreen.dart';
import 'package:customer_app/Screens/MainScreen/main_screen.dart';
import 'package:customer_app/Screens/ManageAddressScreen/manage_address_screen.dart';
import 'package:customer_app/Screens/ManageAddressScreen/pick_location_screen.dart';
import 'package:customer_app/Screens/OrderHistoryDetails/order_history_details.dart';
import 'package:customer_app/Screens/PrivacyScreen/privacy_screen.dart' as ps;
import 'package:customer_app/Screens/PrivacyScreen/terms_condition.dart';
import 'package:customer_app/Screens/ProductScreen/product_screen.dart';
import 'package:customer_app/Screens/ProfileScreen/about_us.dart';
import 'package:customer_app/Screens/ProfileScreen/favroite_store.dart';
import 'package:customer_app/Screens/ProfileScreen/manage_adress.dart';
import 'package:customer_app/Screens/ProfileScreen/my_orders_page.dart';
import 'package:customer_app/Screens/ProfileScreen/order_history.dart';
import 'package:customer_app/Screens/ReportProblem_screen/report_problem_screen.dart';
import 'package:customer_app/Screens/SearchScreen/search_screen.dart';
import 'package:customer_app/Screens/ShoppingCart/ongoing_order_screen.dart';
import 'package:customer_app/Screens/ShoppingCart/order_complete_screen.dart';
import 'package:customer_app/Screens/ShoppingCart/shopping_cart.dart';
import 'package:customer_app/Screens/ShoppingCart/store_wise_cart.dart';
import 'package:customer_app/Screens/SplashScreen/splash_screen.dart';
import 'package:customer_app/Screens/Store%20products%20screen/store_product_screen.dart';
import 'package:customer_app/Screens/StoreDetailScreen/store_detail_screen.dart';
import 'package:customer_app/Screens/StoreReviewScreen/store_review_screen.dart';
import 'package:customer_app/Screens/otp/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'Screens/StoreListScreen/store_list_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName:".env");
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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
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
      } else if (GetPlatform.isIOS) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              iOS: IOSNotificationDetails(
                threadIdentifier: channel.id,
                // channel.name,
                // channelDescription: channel.description,
                // color: Colors.blue,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                // icon: "@mipmap/ic_launcher",
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
      } else if (GetPlatform.isIOS) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification!.title!),
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
    if (GetPlatform.isIOS) {
      enableIOSNotifications();
    }
    getToken();
  }

  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
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
      title: 'Foodboss',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Montserrat'),
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
    // GetPage(name: '/intro', page: () => const IntroScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/shop-list', page: () => ChooseStoreList()),
    GetPage(name: '/search-screen', page: () => SearchScreen()),

    GetPage(name: '/loginpage', page: () => LoginScreen()),
    GetPage(name: '/mainscreen', page: () => const MainScreen()),
    GetPage(name: '/store-products-screen', page: () => StoreProductScreen()),
    GetPage(name: '/myorderspage', page: () => const MyOrdersPage()),
    GetPage(name: '/favroitestore', page: () => const FavroiteStore()),
    GetPage(name: '/orderhistorypage', page: () => const OrderHistoryPage()),
    GetPage(name: '/product-detail', page: () => ProductDetailScreen()),
    GetPage(name: '/manageaddress', page: () => ManageAddress()),
    GetPage(name: '/privacy', page: () => const ps.Privacy()),
    GetPage(name: '/legal', page: () => TermsAndCondition()),

    // GetPage(name: '/video-help', page: () => VideoHelpScreen()),

    GetPage(name: '/store-detail-screen', page: () => StoreDetailScreen()),

    GetPage(name: '/checkout-list', page: () => ShoppingCart()),
    GetPage(name: '/about-us', page: () => AboutUs()),

    GetPage(name: '/report', page: () => ReportScreen()),

    GetPage(name: '/manage-address-screen', page: () => ManageAddressScreen()),
    GetPage(name: '/pick-location-screen', page: () => PickLocationScreen()),

    GetPage(name: '/ongoing-orders', page: () => const OngoingOrders()),

    GetPage(name: '/store-review-screen', page: () => StoreReviewScreen()),
    GetPage(
        name: '/khata-management-screen', page: () => KhataManagementScreen()),
    GetPage(
        name: '/khata-store-detail-screen',
        page: () => KhataStoreDetailScreen()),

    GetPage(name: '/help-support', page: () => const HelpSupport()),
    GetPage(name: '/review-screen', page: () => StoreReviewScreen()),
    GetPage(name: '/faqs', page: () => FaqScreen()),
    GetPage(name: '/verify-otp', page: () => const OtpScreen()),
    GetPage(name: '/test', page: () => const Test()),
    GetPage(name: '/Basket', page: () => StoreWiseCart()),
    GetPage(
        name: '/order-history-details',
        page: () => const OrderHistoryDetails()),
    GetPage(
        name: '/order-completed-animation',
        page: () => const OrderCompletedAnimation()),
  ];
}
