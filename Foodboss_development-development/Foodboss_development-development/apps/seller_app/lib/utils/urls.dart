class Urls {
  static const String SERVER = 'https://www.foodboss.in/admin5483157238/api';
  static const String SELLER = SERVER + '/seller';

  //auth
  static const String REGISTRATION_URL = SELLER + '/register';
  static const String CHECK_USER_URL = SELLER + '/get-profile';
  static const String LOGIN_URL = SELLER + '/login';
  static const String RESEND_OTP_URL = SELLER + '/resendotp';
  static const String OTP_URL = SELLER + '/otpverify';

  //common
  static const String FAQ_URL = SERVER + '/faqs?category_id=13';
  static const String FAQCAEGORY_URL = SERVER + '/faq_categories';
  static const String PRIVACY_URL = SERVER + '/get_privacy_settings';
  static const String VIDEO_URL = SELLER + '/videohelp';
  static const String PLAN_URL = SELLER + '/get-plan-list';
  static const String PLAN_HISTORY_URL = SELLER + '/get-plan-history';
  static const String GET_SETTINGS = SELLER + '/get-delivery-setting';

  static const String DASHBOARD_URL = SELLER + '/dashboard';
  static String ORDERDETAILS_STATUS(String id) =>
      SELLER + '/get-my-order-list?order_status=$id';

  static const String PURCHSE_PLAN_URL = SELLER + '/purchase-plan';
  static const String ORDER_ID_URL = SELLER + '/checkout-plan';

  // profile
  static const String GET_PROFILE_URL = SELLER + '/get-profile';
  static const String UPDATE_PROFILE_URL = SELLER + '/update-profile';
  static const String UPDATE_QR_CODE = SELLER + '/update-qr-number';

  // global store
  static const String MAIN_CATAGORY = SELLER + '/parent-category';
  static String SUB_CATAGORY(int id) =>
      SELLER + '/chid-category/' + id.toString();
  static String CATAGORY(int id) => SELLER + '/category/' + id.toString();
  static String OR_URL(int id) => SELLER + '/get-food-by-qr/' + id.toString();
  static String PRODUCTS(int id) => SELLER + '/get-foods/' + id.toString();
  static String PRODUCTS_BY_CAT(int id) =>
      "https://www.foodboss.in/admin5483157238/api/seller/get-foods-sub-category/" +
      id.toString();

  static String ADD_PRODUCTS = SELLER + '/add-foods';
  static String ADDIMAGETOPRODUCT = SELLER + '/add-food-images';
  static String PRODUCT_DETAILS(String id) => SELLER + '/get-food-details/$id';
  static String GET_ALL_FOOD(String name) =>
      SELLER + '/get-all-foods-from-elastic?search=$name';
  static String GET_STORE_SEARCH(String id, String name) =>
      SELLER + '/list-foods?main_category_id=$id&search=$name';
  // Report Problem screen
  static String HELPCATAGORIES = SELLER + '/helpCategory';
  static String SUPPORTREQUEST = SELLER + '/helpQuery';

  //Customers

  static String MYCUSTOMER = SELLER + '/get-my-customer';
  static String ALLCUSTOMER = SELLER + '/get-all-customers';
  static String SEARCHCUSTOMER(int val) =>
      SELLER + '/get-all-customers?search=$val';
  static String ADDCUSTOMER = SELLER + '/add-customers';
  static String REMOVECUSTOMER = SELLER + '/remove-customer';
  static String UPDATECUSTOMER = SELLER + '/update-customers';
  static String MYREPORTS = SELLER + '/my-report';
  static String MYREPORTLIST(String start, String end) =>
      SELLER + '/my-report-details?start_date=${start}&end_date=${end}';

  //Drivers

  static String ALLDRIVERS = SELLER + '/get-driver-list';
  static String SEARCHLLDRIVERS(int val) =>
      SELLER + '/get-driver-list?search=$val';
  static String MYDRIVERS = SELLER + '/get-my-driver-list';
  static String ADDDRIVER = SELLER + '/add-driver';
  static String REMOVEDRIVER = SELLER + '/remove-driver';

  static String MYSTORE_CAT = SELLER + '/get-food-main-category';
  static String UPDATE_FOOD = SELLER + '/update-foods';
  static String MYSTORE_CAT_ITEM(int id) =>
      SELLER + '/list-foods?main_category_id=' + id.toString();

  //Orders

  static String ORDER_CALL = SELLER + "/get-my-order-list";
  static String SHOP_STATUS_CHANGE = SELLER + "/shop-status-change";

  //ShopRegistration
  static String UPDATE_SHOP = SELLER + "/add-shop";
  static String UPDATE_SETTINGS = SELLER + "/update-delivery-setting";

  //orders
  static String ORDER_BY_STATUS({int id = 0}) =>
      SELLER + '/get-my-order-list?order_status=${id.toString()}';
  static String ORDER_STATUS = SELLER + '/get-order-status-list';
  static String ORDER_STATUS_CHANGE = SELLER + '/order-status-change';
  static String ORDER_CANCEL = SELLER + '/cancel-order';
  static String ORDER_PRODUCT_CANCEL = SELLER + '/cancel-product-order';
  static String ASSIGN_RIDER = SELLER + '/assign-rider';
  static String PICKUP_API = SELLER + '/pickup-order-screen';
  static String CRP_URL = SELLER + '/get-order-return-list';
  static String COMPLETED_URL = SELLER + '/get-order-completed-list';
  static String CODE_GEN = SELLER + '/generate-payment-code';

  // khata
  static const String KHATA_REQUEST_URL = SELLER + '/list-khata-requets';
  static const String GETMYKHATAS = SELLER + '/get-my-user-khata';
  static const String QUICKEDITKHATA = SELLER + '/quick-edit-customer-khata';
  static String GETKHATAUSERDETAILS(uid) =>
      SELLER + '/customer-khata-details?customer_id=$uid';
  static String SETKHATAURL = SELLER + "/set-khata-limit";
}
