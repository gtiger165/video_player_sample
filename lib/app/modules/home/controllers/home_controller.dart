import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late VideoPlayerController videoController;

  @override
  void onInit() {
    super.onInit();
    videoController = VideoPlayerController.network(
        "https://vmssamarinda.iconpln.co.id:8443/mt/api/rest/v1/media?session=AYMAfP8KEOFwg8Ds1UExjWk1VvcCCekSFgoU0G5CuklqFnXFV03Ig4NXcZheawwaEBizRmfua0JZiThkB8gsBZYiEG4SCpxUgk9ivN4Jozv2qgkqEFBlbWtvdCBTYW1hcmluZGEyIRoQTZ6shHLARv-_iI3yRVfLVyoNYWRtaW5pc3RyYXRvcg&cameraId=4xIx1DOxSE00M040NE9LsdBLTsw1MBASEE7vKs8odvBuM3dQEV72LA4A&format=fmp4&frames=all&media=video&quality=high&t=live")
      ..initialize().then((value) => update());
    videoController.play();
  }

  bool isVideoInitialized() => videoController.value.isInitialized;

  bool isPlaying() => videoController.value.isPlaying;

  void buttonPlayCallback() {
    if (isPlaying()) {
      videoController.pause();
    } else {
      videoController.play();
    }

    update();
  }

  @override
  void onClose() {
    videoController.dispose();
  }
}
