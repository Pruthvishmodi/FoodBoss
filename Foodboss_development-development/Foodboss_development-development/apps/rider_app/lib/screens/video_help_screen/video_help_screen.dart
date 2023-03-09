import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

import 'package:rider_app/controller/business_controller/video_help_controller.dart';
import 'package:rider_app/models/video_help_modal.dart';
import 'package:rider_app/screens/video_help_screen/video_player_screen.dart';
import 'package:rider_app/utils/states.dart';

import 'package:rider_app/widgets/BodyContainer.dart';
import 'package:rider_app/widgets/label_widget.dart';
import 'package:rider_app/widgets/text_widgets/desc.dart';
import 'package:shared_widgets/shared_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoHelpScreen extends StatelessWidget {
  const VideoHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VideoController controller = Get.put(VideoController(), permanent: false);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: size.height - 100,
        color: ThemeConfig.FORM_COLOR,
        padding: const EdgeInsets.only(top: 10),
        child: Obx(() {
          print(controller.video_state);
          if (controller.video_state == States.SUCCESS_STATE) {
            // print(controller.data.length);
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 500 ? 4 : 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                var video = controller.data[index];
                return videoHelpCard(context, index, video);
              },
            );
          } else if (controller.video_state == States.ERROR_STATE) {
            return ErrorScreen(
              refreshFunction: controller.videos,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  Widget videoHelpCard(BuildContext context, int index, VideoData video) {
    _launchURL() async {
      var videoUrl = video.videosUrl!;
      // Get.snackbar("video", videoUrl);
      try {
        // if (await canLaunch(videoUrl)) {
        await launch(videoUrl, enableJavaScript: true);
        // } else {
        //   throw 'Could not launch $videoUrl';
        // }
      } catch (e) {
        Get.snackbar("video", e.toString());
      }
    }

    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Container(
        // height: 100,
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ThemeConfig.WHITE_COLOR,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ThemeConfig.SECONDARY_TEXT_COLOR.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Image(
              image: NetworkImage(video.hasMedia == true
                  ? video.media![0].url!
                  : ThemeConfig.NOIMAGELINK),
              fit: BoxFit.fill,
            )),
            const SizedBox(
              height: 10,
            ),
            LabelText(titleString: video.title!),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: ThemeConfig.DISTRUCTIVE_COLOR,
    //     borderRadius: BorderRadius.circular(ThemeConfig.BORDERRADIUS_MIN),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           _launchURL();
    //         },
    //         child: Expanded(
    //           flex: 1,
    //           child: Container(
    //             child: Stack(
    //               alignment: Alignment.center,
    //               children: [
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: Image(
    //                     image: NetworkImage(
    //                       video.hasMedia==true?video.media![0].url!:''
    //                       // YoutubePlayer.getThumbnail(
    //                       //     videoId: YoutubePlayer.convertUrlToId(
    //                       //         video.videosUrl!)!),
    //                     ),
    //                   ),
    //                 ),
    //                 const Center(
    //                   child: Icon(
    //                     Icons.play_arrow,
    //                     color: Colors.white,
    //                     size: 35,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Container(
    //           alignment: Alignment.centerLeft,
    //           padding: const EdgeInsets.all(5),
    //           child: Desc(
    //             descString: video.title!,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.refreshFunction})
      : super(key: key);

  final Future<void> Function() refreshFunction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height - 200,
        width: size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.030,
                ),
                const Text(
                  'Not Found ',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Features you are looking is missing... ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                InkWell(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ThemeConfig.PRIMARY_COLOR,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.refresh,
                            color: ThemeConfig.WHITE_COLOR,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Refresh',
                            style: TextStyle(
                                fontSize: 15, color: ThemeConfig.WHITE_COLOR),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () async {
                    await refreshFunction();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
