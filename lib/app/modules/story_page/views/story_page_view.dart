import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/widgets/story_view.dart';
import '../controllers/story_page_controller.dart';

class StoryPageView extends GetView<StoryPageController> {
  const StoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        controller: controller.storyController,
        storyItems: [
          StoryItem.pageImage(
            url:'https://app.sabriyeayana.com/wp-content/uploads/2022/12/ebook-mockup1.png',
            controller: controller.storyController,
          ),
          StoryItem.pageVideo(
            'https://app.sabriyeayana.com/wp-content/uploads/2022/12/Sabriye-Ayana-media-reel-1.mp4',
            controller: controller.storyController,
          ),
          StoryItem.pageVideo(
            'https://app.sabriyeayana.com/wp-content/uploads/2022/12/Skype_Video.mp4',
            controller: controller.storyController,
          ),
        ],
        inline: false,
        repeat: false,
        onComplete: () {
          Get.back();
        },
      ),
    );
  }
}
