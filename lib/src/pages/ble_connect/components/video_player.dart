import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plinic2/constants.dart';
import 'package:plinic2/src/pages/ble_connect/components/vieo_player_widget.dart';
import 'package:video_player/video_player.dart';

class AssetVideoPlayerWidget extends StatefulWidget {
  AssetVideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<AssetVideoPlayerWidget> createState() => _AssetVideoPlayerWidgetState();
}

class _AssetVideoPlayerWidgetState extends State<AssetVideoPlayerWidget> {
  VideoPlayerController? controller;
  final _random = Random();
  List videoUrl = [
    'https://plinic.s3.ap-northeast-2.amazonaws.com/210426_03Plinic_Motion_Graphics.mp4',
    'https://plinic.s3.ap-northeast-2.amazonaws.com/220218_plinic_single_manual.mp4',
    'https://plinic.s3.ap-northeast-2.amazonaws.com/220302stem.mp4',
    'https://plinic.s3.ap-northeast-2.amazonaws.com/220302youtubue_60sec.mp4'
  ];
  @override
  void initState() {
    super.initState();
    // print('랜덤 숫자는? ${_random.nextInt(videoUrl.length)}');
    controller = VideoPlayerController.network(
        videoUrl[_random.nextInt(videoUrl.length)])
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller!.play());
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller!.value.volume == 0;

    return Column(
      children: [
        VideoPlayerWidget(controller: controller),
        const SizedBox(height: 32),
        if (controller != null && controller!.value.isInitialized)
          CircleAvatar(
            radius: 30,
            backgroundColor: primary,
            child: IconButton(
              onPressed: () => controller!.setVolume(isMuted ? 1 : 0),
              icon: Icon(isMuted ? Icons.volume_mute : Icons.volume_up,
                  color: white),
            ),
          ),
      ],
    );
  }
}
