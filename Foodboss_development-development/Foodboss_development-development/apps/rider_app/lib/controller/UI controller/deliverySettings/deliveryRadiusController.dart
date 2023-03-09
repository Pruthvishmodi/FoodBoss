import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/infrastructure/auth_call.dart';
import 'package:shared_widgets/Config/theme_config.dart';

class DeliveryRadiusController extends GetxController {
  final LatLng initialcameraposition =
      const LatLng(23.114179660666736, 72.54057023580381);

  var icon = BitmapDescriptor.defaultMarker.obs;
  getIcons() async {
    var newicon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 3.2),
        "assets/images/locationIcon.png");
    icon.value = newicon;
    // setState(() {
    //   this.icon = icon;
    // });
  }

  // GoogleMapController? controller;
  Completer<GoogleMapController> _controller = Completer();

  //marker
  late Set<Marker> markers = {
    Marker(
      markerId: const MarkerId('1'),
      icon: icon.value,
      position: LatLng(
          initialcameraposition.latitude, initialcameraposition.longitude),
      onTap: () {},
    ),
  };
  var radius = 1.obs;

  //Circle
  var circles = Set<Circle>().obs;

  Set<Circle> get getCircles => circles.value;
  // var locationData;

  void onMapCreated(GoogleMapController _cntlr) async {
    _controller.complete(_cntlr);
    // controller = await _controller.future;
  }

  var sliderValue = 3.obs;

  //Slider on change

  onSliderChange(value) {
    print('hello');
    // setState(() {
    circles.clear();
    Circle c = Circle(
      circleId: const CircleId('1'),
      center: LatLng(
          initialcameraposition.latitude, initialcameraposition.longitude),
      strokeWidth: 3,
      strokeColor: ThemeConfig.PRIMARY_COLOR,
      radius: value < 10
          ? value * 100
          : value < 20
              ? (value - 9) * 1000
              : value < 25
                  ? (value - 17) * 5000
                  : value,
    );

    circles.add(c);
    circles.refresh();
    // });
  }

  // Add here store location latitude and longitude

  changeZoomValue(double value) async {
    GoogleMapController ctrl = await _controller.future;

    if (value < 4) {
      ctrl.animateCamera(CameraUpdate.zoomTo(16));
    } else if (value < 8) {
      ctrl.animateCamera(CameraUpdate.zoomTo(15));
    } else if (value < 10) {
      ctrl.animateCamera(CameraUpdate.zoomTo(14));
    } else if (value < 13) {
      ctrl.animateCamera(CameraUpdate.zoomTo(13));
    } else if (value < 20) {
      ctrl.animateCamera(CameraUpdate.zoomTo(11));
    } else if (value < 25) {
      ctrl.animateCamera(CameraUpdate.zoomTo(10));
    }
  }

  @override
  void onInit() {
    // getIcons();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MapDeliveryController extends GetxController {
  var initialcameraposition = LatLng(23.114179660666736, 72.54057023580381).obs;
  // Rx<GoogleMapController> _controller = Rx<GoogleMapController>();
  var icon = BitmapDescriptor.defaultMarker.obs;
  var radious = ''.obs;

  RxMap<int, DeliveryModel> rangesDelivery = RxMap<int, DeliveryModel>();
  RxList<String> ranges1 = RxList<String>();
  RxList<String> ranges2 = RxList<String>();
  RxList<String> ranges3 = RxList<String>();

  Map<int, int> ranges = {
    0: 100,
    1: 200,
    2: 300,
    3: 400,
    4: 500,
    5: 600,
    6: 700,
    7: 800,
    8: 900,
    9: 1000,
    10: 2000,
    11: 3000,
    12: 4000,
    13: 5000,
    14: 6000,
    15: 7000,
    16: 8000,
    17: 9000,
    18: 10000,
    19: 15000,
    20: 20000,
    21: 25000,
    22: 30000,
  };

  Completer<GoogleMapController> _controller = Completer();

  onMapCreated(GoogleMapController _cntlr) async {
    // changeZoomValue(0);
    // _controller.complete(_cntlr);
    List<double> letlang = await AuthCall.getLocation();
    initialcameraposition.value = LatLng(letlang[0], letlang[1]);
    if (!_controller.isCompleted) {
      //first calling is false
      //call "completer()"
      _controller.complete(_cntlr);
    } else {
      //other calling, later is true,
      //don't call again completer()
    }
    _cntlr.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(letlang[0], letlang[1]),
          zoom: 11,
        ),
      ),
    );
  }

  var sliderValue = 0.obs;

  //Slider on change

  onSliderChange(double value) {
    sliderValue.value = value.ceilToDouble().toInt();
    sliderValue.refresh();
    radious.value = ranges[sliderValue.value].toString();

    rangesDelivery.value.forEach((key, value) {
      int.parse(rangesDelivery.value[key]!.range) >= ranges[sliderValue.value]!
          ? rangesDelivery.value[key]!.range =
              ranges[sliderValue.value].toString()
          : rangesDelivery.value[key]!.range = rangesDelivery.value[key]!.range;
    });
    rangesDelivery.refresh();
    getRanges();
  }

  changeZoomValue(double value) async {
    double radius = ranges[sliderValue.value]!.toDouble();
    GoogleMapController controller = await _controller.future;
    double zoomLevel = 11;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 350;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = double.parse(zoomLevel.toString());
    printError(info: initialcameraposition.value.toString());
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: initialcameraposition.value,
          zoom: zoomLevel,
        ),
      ),
    );
  }

  getRanges() {
    // printError(info: "called");
    ranges1.value = [];
    ranges2.value = [];
    ranges3.value = [];
    ranges.keys.forEach((element) {
      if (element <= sliderValue.value) {
        ranges1.add(ranges[element].toString());
        ranges2.add(ranges[element].toString());
        ranges3.add(ranges[element].toString());
      }
    });
    ranges1.refresh();
    ranges2.refresh();
    ranges3.refresh();
    // printError(info: "called2");
  }

  addDelivery(int id) {
    if (rangesDelivery.value.length <= 2) {
      rangesDelivery.value[id] = DeliveryModel(
          price: "price", range: "100", controller: TextEditingController());
      rangesDelivery.value[id]!.controller.text =
          rangesDelivery.value[id]!.price;
      // print(rangesDelivery.value.length);
    }
    rangesDelivery.refresh();
  }

  removeDelivery(int id) {
    if (rangesDelivery.value.length > 0) {
      rangesDelivery.value.remove(id);
      // ranges.value[id] = DeliveryModel(price: "price", range: "500m");
      print(rangesDelivery.value.length);
    }
    rangesDelivery.refresh();
  }
  // @override
  // void onInit() {
  //   // getIcons();
  //   // TODO: implement onInit
  //   addDelivery(1);
  //   super.onInit();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class AddSettingsController extends GetxController {
  RxMap<int, DeliveryModel> ranges = RxMap<int, DeliveryModel>();
  MapDeliveryController controller = Get.find<MapDeliveryController>();
  RxList<String> ranges1 = RxList<String>();

  getRanges() {
    ranges1.value = [];
    controller.ranges.keys.forEach((element) {
      if (element <= controller.sliderValue.value) {
        ranges1.add(controller.ranges[element].toString());
      }
    });
  }

  addDelivery(int id) {
    if (ranges.value.length <= 2) {
      ranges.value[id] = DeliveryModel(
          price: "price", range: "500 m", controller: TextEditingController());
      ranges.value[id]!.controller.text = ranges.value[id]!.price;
      print(ranges.value.length);
    }
    ranges.refresh();
  }

  removeDelivery(int id) {
    if (ranges.value.length > 0) {
      ranges.value.remove(id);
      // ranges.value[id] = DeliveryModel(price: "price", range: "500m");
      print(ranges.value.length);
    }
    ranges.refresh();
  }

  // @override
  // void onInit() {
  //   // getIcons();
  //   // TODO: implement onInit
  //   super.onInit();
  //   addDelivery(1);
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}

class InitialController extends GetxController {
  AddSettingsController controller = Get.find<AddSettingsController>();

  @override
  void onInit() {
    // getIcons();
    // TODO: implement onInit
    super.onInit();
    controller.addDelivery(1);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class DeliveryModel {
  String price;
  String range;
  TextEditingController controller;
  DeliveryModel(
      {required this.price, required this.range, required this.controller});
}
