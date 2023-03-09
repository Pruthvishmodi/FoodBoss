import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DyLinkHelperClass {
  DyLinkHelperClass();

  Future<String> createDynamicStoreLink(
      int id, String imgUrl, String storeName) async {
    print('https://web.foodboss.in?screen=/store?paramId=$id');
    var parameters = DynamicLinkParameters(
      uriPrefix: 'https://foodboss.page.link',
      link: Uri.parse('https://web.foodboss.in?screen=/store&paramId=$id'),
      androidParameters: const AndroidParameters(
          packageName: "com.foodboss.user", minimumVersion: 0),
      // iosParameters: IOSParameters(
      //   bundleId: 'com.foodboss.user',
      // ),
      socialMetaTagParameters: SocialMetaTagParameters(
          imageUrl: Uri.parse(imgUrl), title: storeName),
      navigationInfoParameters:
          const NavigationInfoParameters(forcedRedirectEnabled: true),
      //Uncomment for iOS
      iosParameters: IOSParameters(
        bundleId: "com.foodboss.user",
        appStoreId: '1640038993',
      ),
    );

    var shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    var shortUrl = shortLink.shortUrl;

    return shortUrl.toString();
  }

  Future<String> createDynamicProductLink(
      int storeId, int productId, String imgUrl, String productName) async {
    // print('https://web.foodboss.in?screen=/store?paramId=$id');
    log('https://web.foodboss.in?screen=/product&storeId=$storeId&productId=$productId');
    String link =
        'https://web.foodboss.in?screen=/product&storeId=$storeId&productId=$productId';
    var parameters = DynamicLinkParameters(
      uriPrefix: 'https://foodboss.page.link',
      link: Uri.parse(link),
      androidParameters: const AndroidParameters(
          packageName: "com.foodboss.user", minimumVersion: 0),
      // iosParameters: IOSParameters(
      //   bundleId: 'com.foodboss.user',
      // ),
      socialMetaTagParameters: SocialMetaTagParameters(
          imageUrl: Uri.parse(imgUrl), title: productName),
      navigationInfoParameters:
          const NavigationInfoParameters(forcedRedirectEnabled: true),
      //Uncomment for iOS
      iosParameters: IOSParameters(
        bundleId: "com.foodboss.user",
        appStoreId: '1640038993',
      ),
    );

    var shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    var shortUrl = shortLink.shortUrl;

    return shortUrl.toString();
  }

  // Future<String> createDynamicProductLink(
  //     int storeId, int productId, String imgUrl, String productName) async {
  //   log(storeId.toString());
  //   log('https://web.foodboss.in?screen=/product?xyz=$storeId&storeId=$storeId&productId=$productId');
  //   String link =
  //       'https://web.foodboss.in?screen=/product&storeId=$storeId&productId=$productId';
  //   var parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://foodboss.page.link',
  //     socialMetaTagParameters: SocialMetaTagParameters(
  //         imageUrl: Uri.parse(imgUrl), title: productName),
  //     link: Uri.parse(link),
  //     androidParameters: const AndroidParameters(
  //       packageName: "com.foodboss.user",
  //       minimumVersion: 0,
  //     ),

  //     // iosParameters: IOSParameters(
  //     //   bundleId: 'com.foodboss.user',
  //     // ),
  //     navigationInfoParameters:
  //         const NavigationInfoParameters(forcedRedirectEnabled: true),
  //     //Uncomment for iOS
  //     iosParameters: IOSParameters(
  //       bundleId: "com.foodboss.user",
  //       appStoreId: '1640038993',
  //     ),
  //   );

  //   var shortLink =
  //       await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  //   var shortUrl = shortLink.previewLink;

  //   return shortUrl.toString();
  // }
}
