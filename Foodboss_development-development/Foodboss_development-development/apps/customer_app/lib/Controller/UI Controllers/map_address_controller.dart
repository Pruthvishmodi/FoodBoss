import 'dart:async';
import 'dart:developer';

import 'package:customer_app/Config/ThemeConfig.dart';
import 'package:customer_app/Controller/UI%20Controllers/main_screen_ui_controller.dart';
import 'package:customer_app/Models/address_model.dart';
import 'package:customer_app/Services/address_services.dart';
import 'package:customer_app/Widgets/Buttons/button.dart';
import 'package:customer_app/Widgets/Text%20widgets/label_text.dart';
import 'package:customer_app/Widgets/Text%20widgets/main_label_text.dart';
import 'package:customer_app/Widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

enum Nickname {
  home,
  office,
  other,
}

class MapAdressController extends GetxController {
  var center = const LatLng(23.0225, 72.5714).obs;
  var lastMapPosition = const LatLng(23.0225, 72.5714).obs;
  var nickname = Nickname.home.obs;
  var _currentAddress = "".obs;
  var _mainAddress = "".obs;
  var _area = "".obs;
  var _city = "".obs;
  var _state = "".obs;
  var _country = "".obs;
  var _zip = "".obs;
  var _add1 = "".obs;
  var _add2 = "".obs;
  var _recipientName = ''.obs;

  Address get selectedAddress => allAddress.value.addressess!
      .firstWhere((element) => element.isDefault == true);

  get selectedAddressString =>
      '${selectedAddress.addressLine1} ${selectedAddress.addressLine2} ${selectedAddress.area} ${selectedAddress.city} ${selectedAddress.state} ${selectedAddress.country} ${selectedAddress.zip}';
  fromUpdate(id) async {
    loading.value = true;
    center.value = LatLng(
        allAddress.value.addressess!
            .firstWhere((element) => element.id == id)
            .latitude!,
        allAddress.value.addressess!
            .firstWhere((element) => element.id == id)
            .longitude!);
    lastMapPosition.value = center.value;
    await getLocationstring();
    loading.value = false;
  }

  changeNickname(val) {
    nickname.value = val;
    print(nickname.value.toString());
    nickname.refresh();
  }

  RxMap<String, TextEditingController> controllerText =
      RxMap<String, TextEditingController>();

  // LatLng get center => _center.value;
  String get currentAddress => _currentAddress.value;
  String get mainAddress => _mainAddress.value;
  // LatLng get lastMapPosition => _lastMapPosition.value;
  String get area => _area.value;
  String get city => _city.value;
  String get state => _state.value;
  String get country => _country.value;
  String get zip => _zip.value;
  String get add1 => _add1.value;
  String get add2 => _add2.value;
  // GoogleMapController _controller = G();
  Completer<GoogleMapController> _controller = Completer();

  void onCameraMove(CameraPosition position) {
    lastMapPosition.value = position.target;
    // lastMapPosition.refresh();
    printInfo(info: lastMapPosition.value.toString());
  }

  void onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  getLocationstring() async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        lastMapPosition.value.latitude,
        lastMapPosition.value.longitude,
      );

      printInfo(info: lastMapPosition.value.longitude.toString());

      geo.Placemark place = placemarks[0];
      // placemark = place;
      controllerText.value = {
        "add1": TextEditingController(),
        "add2": TextEditingController(),
        "area": TextEditingController(),
        "city": TextEditingController(),
        "state": TextEditingController(),
        "country": TextEditingController(),
        "zip": TextEditingController(),
        "recpname": TextEditingController(),
      };

      _mainAddress.value = place.subLocality!;
      _area.value = place.subLocality!;
      _city.value = place.locality!;
      _country.value = place.country!;
      _state.value = place.administrativeArea!;
      _zip.value = place.postalCode!;
      _add1.value = place.street!;
      _add2.value = place.subThoroughfare!;
      controllerText.value['add1']!.text = "";
      controllerText.value['add2']!.text = "";
      controllerText.value['area']!.text =
          _area.value == "" ? "Area" : _area.value;
      controllerText.value['city']!.text =
          _city.value == "" ? "City" : _city.value;
      controllerText.value['state']!.text =
          _state.value == "" ? "State" : _state.value;
      controllerText.value['country']!.text =
          _country.value == "" ? "Country" : _country.value;
      controllerText.value['zip']!.text = _zip.value == "" ? "Zip" : _zip.value;
      _currentAddress.value =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
      print('object');
      _area.refresh();
      _city.refresh();
      _state.refresh();
      _zip.refresh();
      _country.refresh();
    } catch (e) {
      print(e);
    }
  }

  var loading = true.obs;
  getloc() async {
    bool isLocationEnabled = await Location.instance.serviceEnabled();
    if (isLocationEnabled) {
      log('${isLocationEnabled} this function is called');
      printInfo(info: "called on init ctrl");
      var getLoc = await Location.instance.getLocation();
      center.value = LatLng(getLoc.latitude!, getLoc.longitude!);
      lastMapPosition.value = center.value;
      center.refresh();
      lastMapPosition.refresh();
      loading.value = false;
    } else {
      Get.defaultDialog(
          title: "Alert",
          contentPadding: EdgeInsets.all(0),
          titlePadding: EdgeInsets.only(top: 20),
          titleStyle: TextStyle(fontWeight: FontWeight.bold),
          content: BottomSheetLocation(op: getloc),
          barrierDismissible: false);
    }
  }

  var allAddress = AddressesModel().obs;
  //get addressess

  getAllAddress() async {
    try {
      var call = await AddressServices.getAddresses();

      if (call != null) {
        allAddress.value = call;
        allAddress.refresh();
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      // Get.snackbar('Something went wrong', 'Something went wrong');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  // Add new address

  addAddress() async {
    printInfo(info: lastMapPosition.value.toString());
    print(lastMapPosition.value.longitude);
    print(center.value.latitude);
    print(center.value.longitude);
    Address address = Address(
      addressLine1: controllerText.value['add1']!.text,
      addressLine2: controllerText.value['add2']!.text,
      area: controllerText.value['area']!.text,
      city: controllerText.value['city']!.text,
      country: controllerText.value['country']!.text,
      fullName: controllerText.value['recpname']!.text,
      isDefault: true,
      latitude: lastMapPosition.value.latitude,
      longitude: lastMapPosition.value.longitude,
      state: controllerText.value['state']!.text,
      zip: controllerText.value['zip']!.text,
      label: nickname.value == Nickname.home
          ? 'Home'
          : nickname.value == Nickname.office
              ? 'Office'
              : 'Other',
    );
    try {
      var call = await AddressServices.addAddress(address);

      if (call) {
        Get.back();
        getAllAddress();
        Get.offNamed('/home');
        // Get.back();
        // allAddress.value = call;
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Something went wrong', 'Something went wrong');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  //delete address

  deleteAddress(id) async {
    try {
      var call = await AddressServices.deleteAddress(id);

      if (call) {
        // Get.back();
        getAllAddress();
        // Get.offNamed('/manage-address-screen');
        // allAddress.value = call;
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Something went wrong', 'Something went wrong');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  //update address

  updateAddress(
      Address address, MainScreenController mainScreenController) async {
    try {
      var call = await AddressServices.updateAddres(address);

      if (call) {
        getAllAddress();
        allAddress.refresh();
        mainScreenController.scrollListener();
        // getAllAddress();
        // Get.offNamed('/manage-address-screen');
        // allAddress.value = call;
      } else {
        // Get.snackbar('Error', 'Something went wrong');
        CustomSnackbar.errorSnackbar();
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Something went wrong', 'Something went wrong');
      CustomSnackbar.errorSnackbar2('Something went wrong');
    }
  }

  start() async {
    await getloc();
    printInfo(info: "called on initmain");
    // _lastMapPosition.value = LatLng(, 72.5714);
    getLocationstring();
    getAllAddress();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class BottomSheetLocation extends StatelessWidget {
  final Function op;
  const BottomSheetLocation({Key? key, required this.op}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 180,
        color: ThemeConfig.whiteColor,
        child: Column(
          children: [
            const MainLabelText(
              text: "Enable your location",
              alignment: TextAlign.center,
              isBold: true,
            ),
            // SizedBox(height: 30),
            const Spacer(),
            const LabelText(
                text:
                    "Please turn on your GPS, to get your precise location for finding nearby stores",
                isNormal: true,
                alignment: TextAlign.center),
            // SizedBox(height: 30),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                      text: "Done",
                      op: () async {
                        Get.back();
                        await op();
                      },
                      type: "filled"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
