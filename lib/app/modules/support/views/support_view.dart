import 'package:flutter/material.dart';
import 'package:sabriye/app/constants/font_names.dart';
import '../../../constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:sabriye/app/constants/app_assets.dart';
import 'package:sabriye/app/widgets/gapper.dart';
import '../../../constants/app_constants.dart';
import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          AppConstants.supportText,
          style: TextStyle(
            fontFamily: FontName.sourceSansPro,
            color: AppColors.brownColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalGap(gap: 20),
          Container(
            height: deviceHeight(context) * 0.06,
            width: deviceWidth(context) * 1,
            //color: Colors.lightBlue,
            child: Text(
              AppConstants.doYouNeedSupportText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: deviceWidth(context) * .06,
                fontWeight: FontWeight.w400,
                fontFamily: FontName.gastromond,
                color: AppColor.brown,
              ),
            ),
          ),
          const VerticalGap(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            //onPressed:() => _showToast(context),
          ),
          const VerticalGap(gap: 10),
          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    AppAssets.supportEmailIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                const HorizontalGap(gap: 15),
                InkWell(
                    child: const Text(
                      AppConstants.supportMailIdText,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      controller.launchGmail();
                    }),
              ],
            ),
          ),
          const VerticalGap(gap: 25),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              AppConstants.pleaseAlsoRespectOurTime,
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontName.gastromond,
                fontWeight: FontWeight.w400,
                color: AppColor.brown,
                height: 1.4,
              ),
            ),
          ),
          const VerticalGap(gap: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              AppConstants.supportMainContentText,
              style: TextStyle(
                fontSize: 15,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            ),
          ),
          const VerticalGap(gap: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              AppConstants.supportMainContentText2,
              style: TextStyle(
                fontSize: 15,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            ),
          ),
          const VerticalGap(gap: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              AppConstants.withMyDeepestLoveText,
              style: TextStyle(
                fontSize: 15,
                fontFamily: FontName.sourceSansPro,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            ),
          ),
          const VerticalGap(gap: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            width: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.sabriyeSignature),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
