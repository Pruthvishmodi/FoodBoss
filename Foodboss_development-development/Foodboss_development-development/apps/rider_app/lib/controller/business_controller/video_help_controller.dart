import 'package:get/get.dart';
import 'package:rider_app/infrastructure/video_help_call.dart';
import 'package:rider_app/models/video_help_modal.dart';
import 'package:rider_app/utils/states.dart';

class VideoController extends GetxController {
  var _data = VideoHelp().obs;
  var _state = States.INITIAL_STATE.obs;

  String get video_state => _state.value;

  List<VideoData> get data => _data.value.data!.data!;

  Future<void> videos() async {
    _state.value = States.LOADING_STATE;
    try {
      VideoHelp? response = await VideoHelpCall.getVideoes();
      print(response);
      if (response == null) {
        _state.value = States.ERROR_STATE;
        Get.snackbar('Error', 'Something went wrong while loading videos');
      } else {
        if (response.success == false) {
          _state.value = States.ERROR_STATE;
          Get.snackbar('Error', response.message!);
        } else {
          _data.value = response;
          _state.value = States.SUCCESS_STATE;
        }
      }
    } catch (e) {
      print(e);
      Get.snackbar("Opps", "Something went wrong");
      _state.value = States.ERROR_STATE;
    }
  }

  @override
  void onInit() {
    videos();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
