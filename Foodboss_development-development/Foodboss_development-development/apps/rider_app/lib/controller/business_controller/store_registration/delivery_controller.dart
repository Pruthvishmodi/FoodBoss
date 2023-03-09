import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
import 'package:rider_app/controller/UI%20controller/deliverySettings/openDaysController.dart';
import 'package:rider_app/controller/UI%20controller/deliverySettings/storeTimingsController.dart';
import 'package:rider_app/infrastructure/addshopservices/add_shop_services.dart';
import 'package:rider_app/infrastructure/auth_call.dart';
import 'package:rider_app/models/store_delivery/delivry_module.dart';
import 'package:rider_app/models/store_delivery/get_delivery_settings.dart';
import 'package:rider_app/ui_logic/login_to_otp.dart';
import 'package:rider_app/utils/states.dart';
import 'package:rider_app/widgets/custom_snackbar.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryTimeController.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/openDaysController.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/storeTimingsController.dart';
// import 'package:seller_app/models/store_delivery/delivry_module.dart';
// import 'package:seller_app/widgets/date_picker.dart';

class DeliveryController extends GetxController {
  // AddSettingsController controllerRanges =
  //     Get.put(AddSettingsController(), permanent: false);
  MapDeliveryController controllerMap =
      Get.put(MapDeliveryController(), permanent: false);
  OpenDaysController controllerDay =
      Get.put(OpenDaysController(), permanent: false);
  StoreTimingsController controllerTimings =
      Get.put(StoreTimingsController(), permanent: false);
  // DeliveryTimeController controllerTimingsRange =
  //     Get.put(DeliveryTimeController(), permanent: false);
  Rx<DeliveryModelMain> model = DeliveryModelMain().obs;
  // var minimum = "".obs;
  // Rx<TextEditingController> minController = TextEditingController().obs;
  LoginController authController = Get.put(LoginController(), permanent: false);

  var getDeliveryset = GetDeliverySettings().obs;
  var getStatus = States.INITIAL_STATE.obs;

  getDeliverySettings() async {
    try {
      getStatus.value = States.LOADING_STATE;

      var response = await AddShopServices.getDeliveySet();

      if (response != null) {
        getDeliveryset.value = response;
        print(getDeliveryset.value.data!.longitude!);
        print('asasa${double.parse(getDeliveryset.value.data!.latitude!)}');
        print(double.parse(getDeliveryset.value.data!.longitude!.toString()));

        controllerMap.initialcameraposition.value = LatLng(
            double.parse(getDeliveryset.value.data!.latitude!),
            double.parse(getDeliveryset.value.data!.longitude!));
        AuthCall.setLocation(double.parse(getDeliveryset.value.data!.latitude!),
            double.parse(getDeliveryset.value.data!.longitude!));
        controllerTimings.time1.value = TimeOfDay(
            hour: getDeliveryset.value.data!.storeTimings!.startTime!.split(" ")[1] ==
                    'PM'
                ? int.parse(getDeliveryset.value.data!.storeTimings!.startTime!
                        .split(" ")[0]
                        .split(':')[0]) +
                    12
                : int.parse(getDeliveryset.value.data!.storeTimings!.startTime!
                    .split(" ")[0]
                    .split(':')[0]),
            minute: int.parse(getDeliveryset.value.data!.storeTimings!.startTime!
                .split(" ")[0]
                .split(':')[1]));
        controllerTimings.time2.value = TimeOfDay(
            hour: getDeliveryset.value.data!.storeTimings!.endTime!.split(" ")[1] ==
                    'PM'
                ? int.parse(getDeliveryset.value.data!.storeTimings!.endTime!
                        .split(" ")[0]
                        .split(':')[0]) +
                    12
                : int.parse(getDeliveryset.value.data!.storeTimings!.endTime!
                    .split(" ")[0]
                    .split(':')[0]),
            minute: int.parse(getDeliveryset.value.data!.storeTimings!.endTime!
                .split(" ")[0]
                .split(':')[1]));

        controllerMap.ranges.forEach((key, value) {
          if (value == getDeliveryset.value.data!.deliveryRadius!.range) {
            controllerMap.sliderValue.value = value;
            controllerMap.sliderValue.refresh();
            controllerMap.onSliderChange(key.toDouble());
            controllerMap.changeZoomValue(0);
            // controllerMap.ranges
          }
        });
        controllerMap.radious.value =
            getDeliveryset.value.data!.deliveryRadius!.range.toString();
        // controllerMap.changeZoomValue(controllerMap.sliderValue.value.toDouble());
        controllerMap.radious.value =
            controllerMap.sliderValue.value.toString();
        controllerDay.days.value['Sunday'] =
            getDeliveryset.value.data!.openDays!.sunday!;
        controllerDay.days.value['Monday'] =
            getDeliveryset.value.data!.openDays!.monday!;
        controllerDay.days.value['Tuesday'] =
            getDeliveryset.value.data!.openDays!.tuesday!;
        controllerDay.days.value['Wednesday'] =
            getDeliveryset.value.data!.openDays!.wednesday!;
        controllerDay.days.value['Thursday'] =
            getDeliveryset.value.data!.openDays!.thursday!;
        controllerDay.days.value['Friday'] =
            getDeliveryset.value.data!.openDays!.friday!;
        controllerDay.days.value['Saturday'] =
            getDeliveryset.value.data!.openDays!.saturday!;
        getStatus.value = States.SUCCESS_STATE;
      } else {
        getStatus.value = States.ERROR_STATE;

        Get.snackbar('Error', 'Delivery Settings is not set');
      }
    } catch (e) {
      getStatus.value = States.ERROR_STATE;
      print(e);
      Get.snackbar('Error', 'Something went wrongoo');
    }
  }

  addLocalData(
    BuildContext context,
  ) async {
    model.value.openedAt = controllerTimings.getTime(context, 1);
    model.value.closedAt = controllerTimings.getTime(context, 2);
    // model.value.minimumOrderPrice = minimum.value;
    OpenDays days = OpenDays(
      sunday: controllerDay.days.value['Sunday'],
      monday: controllerDay.days.value['Monday'],
      tuesday: controllerDay.days.value['Tuesday'],
      wednesday: controllerDay.days.value['Wednesday'],
      thursday: controllerDay.days.value['Thursday'],
      friday: controllerDay.days.value['Friday'],
      saturday: controllerDay.days.value['Saturday'],
    );
    model.value.openDays = days;

    // List<DeliveryRange> arr = [];
    // controllerRanges.ranges.value.forEach((key, value) {
    //   arr.add(DeliveryRange(range: value.range, amount: value.price));
    // });
    // model.value.deliveryRange = arr;
    // List<DeliveryTimings> array = [];
    // controllerTimingsRange.deliveryTimes.value.forEach((element) {
    //   array.add(DeliveryTimings(
    //       startTime: element.getstartTime(context),
    //       endTime: element.getendTime(context)));
    // });
    // model.value.deliveryTimings = array;
    model.value.deliveryRadious = controllerMap.radious.value;

    // print(model.value.toJson());
    await updateSettings(context);
    // AuthCall.setLocation(model.value.a, long)
  }

  updateSettings(BuildContext context) async {
    try {
      bool? data = await AddShopServices.updateDelivery(model.value);
      if (data == true) {
        CustomSnackbar.showDefaultSuccessSnackbarStatic(context);
        Get.offAllNamed("/home");
        // Get.snackbar("title", "message");
      } else {
        CustomSnackbar.showDefaultErrorSnackbarStatic(context);
        // Get.snackbar("Opps", "Something went wrong!");
      }
    } catch (e) {
      CustomSnackbar.showDefaultErrorSnackbarStatic(context);
      // Get.snackbar("Opps", "Something went wrong!");
      // Get.snackbar("title", "error");
      print(e);
    }
  }

  @override
  void onInit() {
    // getDeliverySettings();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // controllerRanges.dispose();

    controllerMap.dispose();
    controllerDay.dispose();
    controllerTimings.dispose();
    // controllerTimingsRange.dispose();
    // minController.value.dispose();
    super.dispose();
  }
}
