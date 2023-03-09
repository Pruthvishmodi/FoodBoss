import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rider_app/config/theme_config.dart';
import 'package:rider_app/controller/business_controller/add_profile_controller.dart';
import 'package:rider_app/infrastructure/auth_call.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/main_label.dart';

class MapAdressController extends GetxController {
  var center = LatLng(23.0225, 72.5714).obs;
  var _lastMapPosition = LatLng(23.0225, 72.5714).obs;
  var _currentAddress = "".obs;
  var _mainAddress = "".obs;
  var _area = "".obs;
  var _city = "".obs;
  var _state = "".obs;
  var _country = "".obs;
  var _zip = "".obs;
  var _add1 = "".obs;
  var _add2 = "".obs;
  RxMap<String, TextEditingController> controllerText =
      RxMap<String, TextEditingController>();

  // LatLng get center => _center.value;
  String get currentAddress => _currentAddress.value;
  String get mainAddress => _mainAddress.value;
  LatLng get lastMapPosition => _lastMapPosition.value;
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
    // print(position.target);
    _lastMapPosition.value = position.target;
  }

  void onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  getLocationstring() async {
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        lastMapPosition.latitude,
        lastMapPosition.longitude,
      );

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
    } catch (e) {
      print(e);
    }
  }

  submitAddress() async {
    AddProfileController controller = Get.find<AddProfileController>();

    controller.addShopLetLang(
      lastMapPosition.latitude.toString(),
      lastMapPosition.longitude.toString(),
      "Address Line 1",
      "Address Line 2",
      _city.value,
      _state.value,
      _zip.value,
      _area.value,
      // _area.value,
    );
    await AuthCall.setLocation(
      lastMapPosition.latitude,
      lastMapPosition.longitude,
    );

    Get.toNamed("/store-address");
  }

  var loading = true.obs;
  _getloc() async {
    bool isLocationEnabled = await Location.instance.serviceEnabled();
    if (isLocationEnabled) {
      var getLoc = await Location.instance.getLocation();
      center.value = LatLng(getLoc.latitude!, getLoc.longitude!);
      _lastMapPosition.value = center.value;
      center.refresh();
      _lastMapPosition.refresh();
      loading.value = false;
      // GoogleMapController _ctrl = await _controller.future;
      // _ctrl.animateCamera(CameraUpdate.newCameraPosition(
      //       CameraPosition(
      //         target: _lastMapPosition.value,
      //         zoom: 17,
      //       ),),);
    } else {
      Get.bottomSheet(
        BottomSheetLocation(op: _getloc),
        isDismissible: false,
      );
    }
  }

  @override
  void onInit() async {
    await _getloc();
    // _lastMapPosition.value = LatLng(, 72.5714);
    getLocationstring();
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
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      color: ThemeConfig.WHITE_COLOR,
      child: Column(
        children: [
          MainLabelText(titleString: "Please Enable your location"),
          // SizedBox(height:10),
          Spacer(),
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
    );
  }
}
