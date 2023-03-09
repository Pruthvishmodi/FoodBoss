class Urls {
  static const String SERVER = 'https://www.foodboss.in/admin5483157238/api';
  static const String DRIVER = SERVER + '/driver';

  //auth
  static const String REGISTRATION_URL = DRIVER + '/register';
  static const String CHECK_USER_URL = DRIVER + '/get-profile';
  static const String LOGIN_URL = DRIVER + '/login';
  static const String OTP_URL = DRIVER + '/otpverify';
  static const String RESEND_OTP_URL = DRIVER + '/resendotp';

  static const String SPLASH_SCREEN = DRIVER + '/get-splash-screen';

  //common
  static const String FAQ_URL = SERVER + '/faqs?category_id=15';
  static const String FAQCAEGORY_URL = SERVER + '/faq_categories';
  static const String PRIVACY_URL = SERVER + '/get_privacy_settings';
  static const String VIDEO_URL = DRIVER + '/videohelp';
  static const String DASHBOARD_URL = DRIVER + '/dashboard';
  static const String MYAVAILABLESTORE_URL = DRIVER + '/available-stores';
  static const String REMOVESTORE = DRIVER + '/remove-stores';
  static const String MYSTORE_URL = DRIVER + '/my-stores';

  // profile
  static const String GET_PROFILE_URL = DRIVER + '/get-profile';
  static const String UPDATE_PROFILE_URL = DRIVER + '/add-or-update-profile';
  static const String UPDATE_SETTINGS = DRIVER + '/update-delivery-setting';
  static const String GET_SETTINGS = DRIVER + '/get-delivery-setting';

  // global store
  static const String MAIN_CATAGORY = DRIVER + '/parent-category';
  static String SUB_CATAGORY(int id) =>
      DRIVER + '/chid-category/' + id.toString();
  static String CATAGORY(int id) => DRIVER + '/category/' + id.toString();
  static String OR_URL(int id) => DRIVER + '/get-food-by-qr/' + id.toString();
  static String PRODUCTS(int id) => DRIVER + '/get-foods/' + id.toString();
  static String PRODUCTS_BY_CAT(int id) =>
      "http://51.79.254.75/admin5483157238/api/driver/get-foods-sub-category/" +
      id.toString();

  static String ADD_PRODUCTS = DRIVER + '/add-foods';

  // Report Problem screen
  static String HELPCATAGORIES = DRIVER + '/helpCategory';
  static String SUPPORTREQUEST = DRIVER + '/helpQuery';

  static String MYEARNINGREQUEST = DRIVER + '/my-earning';
  static String MYCOLLECTREQUEST = DRIVER + '/order-collect-screen';

  static String SHIPPEDCODEURL = DRIVER + '/collect-customer-screen';
  static String PAYMNETCODE = DRIVER + '/payment-seller-screen';
  static String ADDSTOREREQUEST = DRIVER + '/add-store-request';

  //orders screen
  static String NEWORDERURL = DRIVER + '/new-order-list';
  static String NEWORDERBYSTOREURL(int id) =>
      DRIVER + '/new-order-by-store?shop_id=$id';

  static String SHIPPEDORDERURL = DRIVER + '/order-shipped-list';
  static String COMPLETEDORDERURL = DRIVER + '/order-completed-list';
  static String PAYRETURNURL = DRIVER + '/order-return-list';
}
