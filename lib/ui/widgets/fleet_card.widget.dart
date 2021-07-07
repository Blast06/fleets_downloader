import 'package:fleetsdownloader/ui/widgets/chew_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class FleetCard extends StatelessWidget {
  final String? type;
  final String? url;
  const FleetCard({Key? key, required this.type, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == 'video'
        ? Container(
            margin: EdgeInsets.all(5),
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.network(
                url!,
              ),
              looping: true,
            ),
          )
        : Container(
            height: Get.height * .50,
            width: Get.width,
            margin: EdgeInsets.all(5),
            child: Image.network(url!),
          );
  }
}
