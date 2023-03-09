import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryTimeController.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/openDaysController.dart';
import 'package:seller_app/controller/UI%20controller/deliverySettings/storeTimingsController.dart';
import 'package:seller_app/controller/business_controller/auth/profile_controller.dart';
import 'package:seller_app/infrastructure/addshopservices/add_shop_services.dart';
import 'package:seller_app/infrastructure/auth_call.dart';
import 'package:seller_app/models/store_delivery/delivry_module.dart';
import 'package:seller_app/models/store_delivery/get_delivery_setting_model.dart';
// import 'package:seller_app/models/store_delivery/get_delivery_setting_model.dart';
import 'package:seller_app/ui_logic/login_to_otp.dart';
import 'package:seller_app/utils/states.dart';
import 'package:seller_app/widgets/custom_snackbar.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryRadiusController.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/deliveryTimeController.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/openDaysController.dart';
// import 'package:seller_app/controller/UI%20controller/deliverySettings/storeTimingsController.dart';
// import 'package:seller_app/models/store_delivery/delivry_module.dart';
// import 'package:seller_app/widgets/date_picker.dart';

class DeliveryController extends GetxController {
  MapDeliveryController controllerMap =
      Get.put(MapDeliveryController(), permanent: false);
  AddSettingsController controllerRanges =
      Get.put(AddSettingsController(), permanent: false);
  OpenDaysController controllerDay =
      Get.put(OpenDaysController(), permanent: false);
  StoreTimingsController controllerTimings =
      Get.put(StoreTimingsController(), permanent: false);
  DeliveryTimeController controllerTimingsRange =
      Get.put(DeliveryTimeController(), permanent: false);
  Rx<DeliveryModelMain> model = DeliveryModelMain().obs;

  ProfileController profileController =
      Get.put(ProfileController(), permanent: false);
  var minimum = "".obs;
  Rx<TextEditingController> minController = TextEditingController().obs;
  LoginController authController = Get.put(LoginController(), permanent: false);

  var getDeliveryset = GetDeliverySettings().obs;
  var getStatus = States.INITIAL_STATE.obs;

  var settingsLoading = false.obs;

  getDeliverySettings() async {
    settingsLoading.value = true;
    try {
      print('get called');
      getStatus.value = States.LOADING_STATE;

      var response = await AddShopServices.getDeliveySet();

      if (response != null) {
        getDeliveryset.value = response;
        print(int.parse(getDeliveryset.value.data!.first.restaurants!.closedAt!
                .split(" ")[0]
                .split(':')[0]) +
            12);
        minimum.value = getDeliveryset
            .value.data!.first.restaurants!.minimumOrderPrice
            .toString();
        minController.value.text = getDeliveryset
            .value.data!.first.restaurants!.minimumOrderPrice
            .toString();
        controllerTimings.time1.value = TimeOfDay(
            hour: getDeliveryset.value.data!.first.restaurants!.openedAt!.split(" ")[1] == 'PM'
                ? int.parse(getDeliveryset.value.data!.first.restaurants!.openedAt!
                        .split(" ")[0]
                        .split(':')[0]) +
                    12
                : int.parse(getDeliveryset.value.data!.first.restaurants!.openedAt!
                    .split(" ")[0]
                    .split(':')[0]),
            minute: int.parse(getDeliveryset
                .value.data!.first.restaurants!.openedAt!
                .split(" ")[0]
                .split(':')[1]));
        controllerTimings.time2.value = TimeOfDay(
            hour: getDeliveryset.value.data!.first.restaurants!.closedAt!.split(" ")[1] == 'PM'
                ? int.parse(getDeliveryset.value.data!.first.restaurants!.closedAt!
                        .split(" ")[0]
                        .split(':')[0]) +
                    12
                : int.parse(getDeliveryset.value.data!.first.restaurants!.closedAt!
                    .split(" ")[0]
                    .split(':')[0]),
            minute: int.parse(getDeliveryset
                .value.data!.first.restaurants!.closedAt!
                .split(" ")[0]
                .split(':')[1]));

        AuthCall.setLocation(
            double.parse(
                getDeliveryset.value.data!.first.restaurants!.latitude!),
            double.parse(
                getDeliveryset.value.data!.first.restaurants!.longitude!));

        // controllerMap.ranges.forEach((key, value) {
        //   if (value == getDeliveryset.value.data!.!.range) {
        //     controllerMap.sliderValue.value = value;
        //     controllerMap.sliderValue.refresh();
        //     controllerMap.onSliderChange(key.toDouble());
        //     // controllerMap.changeZoomValue(key.toDouble());
        //     // controllerMap.ranges
        //   }
        // });
        controllerTimingsRange.deliveryTimes.value = [];
        getDeliveryset.value.data!.first.deliveryTimings!.forEach((element) {
          controllerTimingsRange.deliveryTimes.value.add(DeliveryTime(
              id: Random.secure().nextInt(10000),
              StartTime: TimeOfDay(
                  hour: int.parse(element.startTime!.split(':')[0]),
                  minute: int.parse(element.startTime!.split(':')[1])),
              EndTime: TimeOfDay(
                  hour: int.parse(element.endTime!.split(':')[0]),
                  minute: int.parse(element.endTime!.split(':')[1]))));
        });
        int i = 0;
        TextEditingController textEditingController = TextEditingController();
        getDeliveryset.value.data!.first.deliveryRange!.forEach((element) {
          if (i == 0) {
            controllerMap.ranges.keys.forEach((ele) {
              if (ele <= element.range!) {
                controllerMap.ranges1.add(controllerMap.ranges[ele].toString());
              }
            });
          }
          if (i == 1) {
            controllerMap.ranges.keys.forEach((ele) {
              if (ele <= element.range!) {
                controllerMap.ranges2.add(controllerMap.ranges[ele].toString());
              }
            });
          }
          if (i == 2) {
            controllerMap.ranges.keys.forEach((ele) {
              if (ele <= element.range!) {
                controllerMap.ranges3.add(controllerMap.ranges[ele].toString());
              }
            });
          }
          controllerMap.rangesDelivery.value[i] = DeliveryModel(
              price: element.price!,
              range: element.range.toString(),
              controller: TextEditingController());
          i++;
        });
        print(controllerRanges.ranges.value.toString());
        controllerRanges.ranges.refresh();
        controllerMap.radious.value = getDeliveryset
            .value.data!.first.restaurants!.deliveryRadious!
            .toString();
        controllerMap.ranges.forEach((key, value) {
          if (value ==
              getDeliveryset.value.data!.first.restaurants!.deliveryRadious!) {
            controllerMap.sliderValue.value = key;
            controllerMap.radious.value = controllerMap.ranges[key].toString();
            print('aoeifiof  ${controllerMap.radious.value}');
          }
        });
        // controllerMap.changeZoomValue(controllerMap.sliderValue.value.toDouble());
        controllerDay.days.value['Sunday'] =
            getDeliveryset.value.data!.first.openDays!.sunday!;
        controllerDay.days.value['Monday'] =
            getDeliveryset.value.data!.first.openDays!.monday!;
        controllerDay.days.value['Tuesday'] =
            getDeliveryset.value.data!.first.openDays!.tuesday!;
        controllerDay.days.value['Wednesday'] =
            getDeliveryset.value.data!.first.openDays!.wednesday!;
        controllerDay.days.value['Thursday'] =
            getDeliveryset.value.data!.first.openDays!.thursday!;
        controllerDay.days.value['Friday'] =
            getDeliveryset.value.data!.first.openDays!.friday!;
        controllerDay.days.value['Saturday'] =
            getDeliveryset.value.data!.first.openDays!.saturday!;
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
    settingsLoading.value = false;
  }

  addLocalData(
    BuildContext context,
  ) async {
    model.value.openedAt = controllerTimings.getTime(context, 1);
    model.value.closedAt = controllerTimings.getTime(context, 2);
    model.value.minimumOrderPrice = minimum.value;
    var days = OpenDay(
      sunday: controllerDay.days.value['Sunday'],
      monday: controllerDay.days.value['Monday'],
      tuesday: controllerDay.days.value['Tuesday'],
      wednesday: controllerDay.days.value['Wednesday'],
      thursday: controllerDay.days.value['Thursday'],
      friday: controllerDay.days.value['Friday'],
      saturday: controllerDay.days.value['Saturday'],
    );
    model.value.openDays = days;
    List<DeliveryRanges> arr = [];
    controllerMap.rangesDelivery.forEach((key, value) {
      arr.add(DeliveryRanges(range: value.range, amount: value.price));
    });

    model.value.deliveryRange = arr;
    printInfo(info: arr.length.toString());

    List<DeliveryTiming> array = [];
    controllerTimingsRange.deliveryTimes.value.forEach((element) {
      array.add(DeliveryTiming(
          startTime: element.getstartTime(context),
          endTime: element.getendTime(context)));
    });
    model.value.deliveryTimings = array;
    model.value.deliveryRadious = controllerMap.radious.value;
    print(controllerMap.radious.value);

    // print(model.value.toJson());
    await updateSettings(context);
  }

  updateSettings(BuildContext context) async {
    try {
      printInfo(info: model.value.toJson().toString());
      bool? data = await AddShopServices.updateDelivery(model.value);
      if (data == true) {
        CustomSnackbar.SucessSnackbar('Delivery Setting updated!');

        var step = await AuthCall.getSteps();
        if (step == 2) {
          await AuthCall.setSteps(3);
        }
        Get.offAllNamed("/home");
        profileController.getProfile();
        // Get.snackbar("title", "message");
      } else {
        CustomSnackbar.errorSnackbar();
        // Get.snackbar("Opps", "Something went wrong!");
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar();
      // Get.snackbar("Opps", "Something went wrong!");
      // Get.snackbar("title", "error");
      print(e);
    }
  }

  @override
  void onInit() {
    getDeliverySettings();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerRanges.dispose();
    controllerMap.dispose();
    controllerDay.dispose();
    controllerTimings.dispose();
    controllerTimingsRange.dispose();
    minController.value.dispose();
    super.dispose();
  }
}
