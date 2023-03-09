// ignore_for_file: prefer_const_constructorsimport 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_widgets/Config/theme_config.dart';
import 'package:rider_app/screens/store_registration_screen/deliveryTimingSection.dart';
import 'package:rider_app/screens/store_registration_screen/delivery_radius_section.dart';
import 'package:rider_app/screens/store_registration_screen/openDaysSection.dart';
import 'package:rider_app/screens/store_registration_screen/storeTimingsSection.dart';
import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/SmallRoundedInputField.dart';
import 'package:rider_app/widgets/SubText.dart';
import 'package:rider_app/widgets/TextFieldContainer.dart';
import 'package:rider_app/widgets/button.dart';
import 'package:rider_app/widgets/text_widgets/label_widget.dart';

class StoreRegistrationScreen2 extends StatefulWidget {
  const StoreRegistrationScreen2({Key? key}) : super(key: key);

  @override
  State<StoreRegistrationScreen2> createState() =>
      _StoreRegistrationScreen2State();
}

class _StoreRegistrationScreen2State extends State<StoreRegistrationScreen2> {
  List<String> ranges = [
    '500 m',
    '1 km',
    '1.5 km',
    '2 km',
    '3 km',
    '5 km',
    '10 km',
    '15 km',
    '30 km'
  ];
  bool value = false;
  String rangeValue = '500 m';

  int deliveryRange = 1;
  String dropDownValue = 'Start Time';
  String dropDownValue2 = 'End Time';

  double sliderValue = 3;

  // Add here store location latitude and longitude
  LatLng _initialcameraposition =
      const LatLng(23.114179660666736, 72.54057023580381);

  BitmapDescriptor? icon;

  @override
  void initState() {
    getIcons();
    super.initState();
  }

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 3.2),
        "assets/images/locationIcon.png");
    setState(() {
      this.icon = icon;
    });
  }

  GoogleMapController? _controller;

  //marker
  late Set<Marker> markers = {
    Marker(
      markerId: const MarkerId('1'),
      icon: icon!,
      position: LatLng(
          _initialcameraposition.latitude, _initialcameraposition.longitude),
      onTap: () {},
    ),
  };
  double radius = 1;

  //Circle
  Set<Circle> circles = {};
  // var locationData;

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
  }

  int deliveryTimings = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BodyContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),

              const OpenDaysSection(),
              SizedBox(height: size.height * 0.03),
              StoreTimingsSection(),
              SizedBox(height: size.height * 0.02),
              DeliveryTimingSection(),
              SizedBox(height: size.height * 0.03),

              const LabelText(titleString: 'Minimum Order Value'),

              SizedBox(
                height: size.height * 0.02,
              ),

              SmallRoundedInputField(
                hintText: 'Enter value',
                textType: TextInputType.number,
                labelText: 'Order',
                onChange: (value) {},
              ),
              SizedBox(height: size.height * 0.03),
              DeliveryRadiusSection(),
              SizedBox(
                height: size.height * 0.03,
              ),

              const SubText(
                  text: 'Delivery Range',
                  color: ThemeConfig.MAIN_TEXT_COLOR,
                  size: ThemeConfig.SUB_TITLE_SIZE),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: 70 * deliveryRange.toDouble(),
                child: ListView.builder(
                    itemCount: deliveryRange,
                    itemBuilder: (context, index) => _deliveryRange(index)),
              ),
              // SizedBox(height: size.height * 0.02),
              // Container(
              //   alignment: Alignment.center,
              //   child: const SubText(
              //       text: 'OR',
              //       color: ThemeConfig.PRIMARY_COLOR,
              //       size: ThemeConfig.SUB_TITLE_SIZE),
              // ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: 'Submit',
                      type: 'filled',
                      op: () => Get.toNamed('/home'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  changeZoomValue(double value) => {
        if (value < 4)
          {_controller!.animateCamera(CameraUpdate.zoomTo(16))}
        else if (value < 8)
          {_controller!.animateCamera(CameraUpdate.zoomTo(15))}
        else if (value < 10)
          {_controller!.animateCamera(CameraUpdate.zoomTo(14))}
        else if (value < 13)
          {_controller!.animateCamera(CameraUpdate.zoomTo(13))}
        else if (value < 20)
          {_controller!.animateCamera(CameraUpdate.zoomTo(11))}
        else if (value < 25)
          {_controller!.animateCamera(CameraUpdate.zoomTo(10))}
      };

  Container _deliveryRange(int index) {
    TextEditingController rangeController = TextEditingController();
    TextEditingController printController = TextEditingController();
    String labelText = '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: ThemeConfig.WHITE_COLOR,
                border: Border.all(width: 1, color: ThemeConfig.PRIMARY_COLOR),
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MAX),
              ),
              child: DropdownButton(
                isDense: true,
                isExpanded: true,
                borderRadius:
                    BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
                underline: Container(
                  height: 0,
                ),
                value: rangeValue,
                elevation: 3,
                style: const TextStyle(
                  color: ThemeConfig.PRIMARY_COLOR,
                ),
                items: ranges
                    .map((String value) => DropdownMenuItem(
                        value: value,
                        child: SubText(
                          text: value,
                          color: ThemeConfig.MAIN_TEXT_COLOR,
                          size: ThemeConfig.NOTIFICATION_SIZE,
                        )))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    rangeValue = value!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: SmallRoundedInputField(
                hintText: 'Price',
                textType: TextInputType.number,
                labelText: 'P',
                onChange: (value) {}),
          ),
          index == deliveryRange - 1
              ? Expanded(
                  child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (deliveryRange < 3) {
                      setState(() {
                        deliveryRange = deliveryRange + 1;

                        // Circle c1 = Circle(
                        //   circleId: const CircleId('2'),
                        //   center: LatLng(_initialcameraposition.latitude,
                        //       _initialcameraposition.longitude),
                        //   strokeWidth: 1,
                        //   strokeColor: Colors.blue,
                        //   radius: int.parse(rangeController.text) * 1000,
                        // );

                        // circles.add(c1);
                      });
                    }
                  },
                ))
              : Expanded(
                  child: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (deliveryRange > 0) {
                      setState(() {
                        deliveryRange = deliveryRange - 1;
                      });
                    }
                  },
                ))
        ],
      ),
    );
  }
}
