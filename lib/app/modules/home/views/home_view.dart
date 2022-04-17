import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (home) {
        return Scaffold(
          appBar: AppBar(
            title: Text(home.videoController.dataSource),
            centerTitle: true,
          ),
          body: Center(
            child: home.isVideoInitialized()
                ? AspectRatio(
                    aspectRatio: home.videoController.value.aspectRatio,
                    child: VideoPlayer(home.videoController),
                  )
                : Container(child: Text("Can't play the video")),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: home.buttonPlayCallback,
            child: Icon(
              home.isPlaying() ? Icons.pause : Icons.play_arrow,
            ),
          ),
        );
      },
    );
  }
}
