import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'chewie_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
  VideoPlayerController? videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://iptelevision.in/hls/ruahtv.m3u8')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Center(
            child: ChewieListItem(

              videoPlayerController: VideoPlayerController.network(
                'https://iptelevision.in/hls/ruahtv.m3u8',),
              looping: true, isLive: true, fullScreenByDefault: true,


            )

        ),
      ),
    );

  }
  @override
  void dispose() {
    videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
  }