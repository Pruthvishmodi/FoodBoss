import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatefulWidget {


  final String title;
  final String? videoUrl;
  const MyVideoPlayer(
      {Key? key,
     
      required this.title,  this.videoUrl})
      : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
  
}

class _MyVideoPlayerState extends State<MyVideoPlayer>{
 late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  bool _isPlayerReady = false;




  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
  ]);
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl!)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
    DeviceOrientation.values,
  );
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return youtube(size);
  }

 YoutubePlayerBuilder youtube(Size size) {
   return YoutubePlayerBuilder(
      // onExitFullScreen: () {
      //   // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
      //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      // },
      // onEnterFullScreen: (){
      //   SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      // },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          _isPlayerReady = true;
        },
        
        
      ),
      builder: (context, player) => Scaffold(
        // appBar: PreferredSize(preferredSize: const Size.fromHeight(50),child: CustomAppBar(title:  widget.title,noElevation: true,),),
        body: Container(
          width: size.width,
          height: size.height,
          child: player,),
      ),
    );
 }

  // Widget _text(String title, String value) {
  //   return Container(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         LabelText(titleString: '$title : '),
  //         Expanded(child: Desc(descString: value)),
  //       ],
  //     ),
  //   );
  // }

 

  // Widget get _space => const SizedBox(height: 10);

  // ListView(
  //         children: [
  //           player,
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 _space,
  //                 _text('Title', _videoMetaData.title),
  //                 _space,
  //                 _text('Channel', _videoMetaData.author),
  //                 _space,
  //                 _text('Video Id', _videoMetaData.videoId),
  //                 _space,
                  
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
}
