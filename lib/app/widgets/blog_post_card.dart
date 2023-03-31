import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/font_names.dart';
import 'package:sabriye/app/modules/blogs_listing/controllers/blogs_listing_controller.dart';
import '../routes/app_pages.dart';

class PostCards extends StatelessWidget {
  final BlogsListingController blogsListingController =
      Get.put(BlogsListingController());
  final int index, id;
  final String imagePath, title, appTitle;

  PostCards(
      {Key? key,
      required this.index,
      required this.imagePath,
      required this.title,
      required this.id,
      required this.appTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.BLOG_DETAILS, arguments: {
          'id': id,
          'appTitle': appTitle,
        });
      },
      child: Container(
        height: Get.height * .25,
        width: Get.width,
        padding: const EdgeInsets.fromLTRB(15, 0, 27, 15),
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: FontName.sourceSansPro,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
