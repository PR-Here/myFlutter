
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController extends GetxController {
  @override
  void onClose() {}
  @override
  Future<void> onInit() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();
  }

  Future launchGmail() async {
    ///String mailTo = "helpdesk@sabriyeayana.com";
    //final url='mailto$mailTo';
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'helpdesk@sabriyeayana.com',
    );
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      print('Could not launch');
    }
  }
}
