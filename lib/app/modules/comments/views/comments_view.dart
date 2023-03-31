import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/font_names.dart';
import '../../../widgets/gapper.dart';
import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {
  const CommentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.commentsText,
          style: TextStyle(
            color: AppColors.brownColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 25),
              width: Get.width * .8,
              child: TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: AppConstants.enterYourCommentsText,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
            child: IconButton(
              onPressed: () {
                debugPrint(AppConstants.sendCommentsText);
              },
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.commentsList.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: index == 0
                              ? const EdgeInsets.fromLTRB(20, 20, 20, 0)
                              : const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  controller.commentsList[index]
                                      ['author_avatar_urls']['96'],
                                ),
                              ),
                              const HorizontalGap(),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.commentsList[index]
                                          ['author_name'],
                                      style: const TextStyle(
                                        fontFamily: FontName.gastromond,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Html(
                                      data: controller.commentsList[index]
                                          ['content']['rendered'],
                                      style: {
                                        "p": Style(
                                          fontFamily: FontName.sourceSansPro,
                                          fontWeight: FontWeight.w400,
                                        )
                                      },
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Reply',
                                        style: TextStyle(
                                          color: AppColor.primaryBrown,
                                          fontFamily: FontName.sourceSansPro,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
