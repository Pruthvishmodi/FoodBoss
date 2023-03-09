class Urls {
  static const String SERVER = 'https://www.foodboss.in/admin5483157238/api';
  static const String CUSTOMER = SERVER + '/client';

  //auth
  static const String LOGIN = CUSTOMER + '/login';
  static const String VERIFYOTP = CUSTOMER + '/otpverify';
  static const String SPLASHSCREEN = CUSTOMER + '/get-splash-screen';

  //
  static String HELPCATAGORIES = CUSTOMER + '/helpCategory';
  static String VIDEO_URL = CUSTOMER + '/videohelp';

  static String SUPPORTREQUEST = CUSTOMER + '/helpQuery';
  static String REVIEWREQUEST = CUSTOMER + '/make-restaurant-review';

  static const String PRIVACY_URL = SERVER + '/get_privacy_settings';
  static const String FAQ_URL = SERVER + '/faqs?category_id=14';

  //category

  static const String LIST_CATEGORIES = CUSTOMER + '/list-categories';
  static String GETSHOPLIST(int id) =>
      CUSTOMER + '/list-shop-categories?main_category=$id';

  //shop
  static const String LIST_SHOP = CUSTOMER + '/get-store-near-by-me';

  static String SEARCHPRODUCTS(String name) =>
      CUSTOMER + '/search-items?name=$name';

  static String TESTSEARCH =
      'https://07fd-103-240-204-185.in.ngrok.io/search/suggestion';

  //store

  static String GETPRODUCTSTOREWISE(int storeId, int categoryId) =>
      CUSTOMER +
      '/get-foods-by-shop-with-main-category-id?main_category_id=$categoryId&shop_id=$storeId';
  static String SEARCHPRODUCTSFROMSTORE(int storeId, String val) =>
      CUSTOMER + '/list-shop-products-from-elastic/$storeId?search=$val';
  static String GETSTORECATEGORIES(int storeId) =>
      CUSTOMER + '/get-categories-by-shopid?shop_id=$storeId';
  static String GETSTOREDETAILS(int storeId) =>
      CUSTOMER + '/get-store-near-by-me-details/$storeId';

  //cart
  static String ADDTOCART = CUSTOMER + '/add-to-cart-new';
  // static String ADDTOCARTNEW = CUSTOMER + '/add-to-cart-new';
  static String REMOVEFROMCART = CUSTOMER + '/remove-to-cart';
  static String GETCARTITEMS = CUSTOMER + '/get-cart-items-new';
  static String CARTCHECKOUT = CUSTOMER + '/cart-check-out-items-new';

  // Orders

  static String ONGOINGORDERLIST = CUSTOMER + '/get-my-orders';
  static String ORDERDETAILS(int orderId) =>
      CUSTOMER + '/get-order-details/${orderId}';
  static const String ORDERHISTORY = CUSTOMER + '/get-order-history';
  static const String GIVERIDERCODE = CUSTOMER + '/give-rider-code';

  //address

  static const String ADDADDRESS = CUSTOMER + '/add-address';
  static const String GETADDRESS = CUSTOMER + '/get-address';
  static const String DELETEADDRESS = CUSTOMER + '/remove-address';
  static const String UPDATEADDRESS = CUSTOMER + '/update-address';

  //banner

  static const String BANNERS = CUSTOMER + '/get-banner';

  //favorite

  static const String GETFAVFOOD = CUSTOMER + '/get-food-favorite';
  static const String ADDFAVFOOD = CUSTOMER + '/add-food-to-favorite';
  static const String REMOVEFAVFOOD = CUSTOMER + '/remove-food-to-favorite';

  static const String GETFAVSTORE = CUSTOMER + '/get-favorite-store';
  static const String ADDFAVSTORE = CUSTOMER + '/add-favorite-to-store';
  static const String REMOVEFAVSTORE = CUSTOMER + '/remove-favorite-to-store';

// product
  static String PRODUCTDETAILS(int shopId, int productId) =>
      CUSTOMER + '/get-food-details?shop_id=${shopId}&food_id=${productId}';
  static String RANDOMPRODUCTSBYSHOP(int shopId) =>
      CUSTOMER + '/list-shop-products/$shopId';

  //khata

  static String CHECKKHATAREQUEST =
      CUSTOMER + '/check-khata-account-exist-in-shop';
  static String ADDKHATAREQUEST = CUSTOMER + '/add-khata-request';
  static String GETMYKHATAS = CUSTOMER + '/get-my-khata';
  static String GETKHATADETAILS(int id) => CUSTOMER + '/get-khata-detail/$id';

  //contactus
  static String CONTACTUS = CUSTOMER + '/contact-us';

  static String SEARCHSUGGESTIONS = CUSTOMER + '/search-foods';
  static String GETSEARCHPROD(int id) => CUSTOMER + '/search/$id';
}
