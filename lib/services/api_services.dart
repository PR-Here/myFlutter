import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sabriye/app/constants/api_constants.dart';
import 'package:sabriye/app/constants/app_colors.dart';
import '../app/local_storage/sessions.dart';
import '../app/routes/app_pages.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';

class ApiServices {
  Future<List> getAllPost() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL + API_GET_BLOGPOST_LIST),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllTeachingsCategories() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL + API_GET_TEACHINNGS_CATEGORIES),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getAkashaHealingCertificationIntro() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_INTRO),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(
        Get.snackbar(
          'Something Went Wrong',
          e.toString(),
          colorText: AppColor.white,
          backgroundColor: AppColor.primaryBrown,
          duration: const Duration(seconds: 8),
        ),
      );
    }
  }

  Future<List> getAkashaHealingTestimony() async {
    print({"getAkashaHealingTestimony URLLLLL ... ",API_BASE_URL_2 + API_GET_AKASHA_HEALING_TESTIMONY});
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_TESTIMONY),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getAkashaHealingClosingDoor() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_CLOSING_DOOR),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getAkashaHealingClientResults() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_CLIENTS_RESULTS),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getAkashaHealingCeritifcation() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_CERTIFICATION),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAkashaHealingModulesList() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_MODULES),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(
        Get.snackbar(
          e.toString(),
          e.toString(),
        ),
      );
    }
  }

  Future<Map> getAkashaHealingWhoIsInProgram() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_WHO_IS_PROGRAM),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAkashaHealingCarouselData() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_CAROUSEL_DATA),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAkashaHealingInvestment() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_INVESTMENT),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAkashaHealingFaqList() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_AKASHA_HEALING_FAQ_LIST),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllTeachingsSubCategories(String id) async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL +
              API_GET_TEACHINNGS_SUBCATEGORIES +
              id +
              '&hide_empty=1',
        ),
      );
      // print({'url of teching heading... ', API_BASE_URL +
      //     API_GET_TEACHINNGS_SUBCATEGORIES +
      //     id +
      //     '&hide_empty=1'});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllSpritiualSpotlightVideoInterview() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL + API_GET_ALL_SPIRITUAL_SPOTLIGHT_VIDEO_INTERVIEW,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getAboutInfo() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_ABOUT_INFO,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getBookDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_BOOK_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getSpiritualSpotlightVideoInterViewDetails(String id) async {
    try {
      print("ApiRequestURL==" +
          API_BASE_URL +
          API_GET_SPIRITUAL_SPOTLIGHT_VIDEO_INTERVIEW_DETAILS +
          id);
      var response = await http.get(
        Uri.parse(
          API_BASE_URL +
              API_GET_SPIRITUAL_SPOTLIGHT_VIDEO_INTERVIEW_DETAILS +
              id,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllBlogsByTeachingsSubCategories(String id) async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL + API_GET_BLOGPOST_BY_SUB_TEACHING + id),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getBlogDetailsById(String id) async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL + API_GET_BLOG_DETAILS_ID + id,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getTeachingDetailsById(String id) async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL + API_GET_TEACHING_DETAILS_ID + id,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getGivingBackInfo() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_GIVING_BACK,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getGivingBackInfo2() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_GIVING_BACK2,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getFaqIntro() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_INTRO,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqInnerUnion() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_INNER_UNION,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqTeachings() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_TEACHING,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqAccount() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_MANAGING_ACCOUNT,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqTroubleshoot() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_MANAGING_ACCOUNT,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqInnerUnionWork() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_INNER_UNION_WORK,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqHealing() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_HEALING,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqMasterMindGroup() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_MASTERMIND_GROUP,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqPaymentPlans() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_PAYMENT_PLANS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqMangingMyAccount2() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_MANAGING_MY_ACCOUNT_2,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getFaqTroubleshoot2() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FAQ_TROUBLESHOOT_2,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getMembershipDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL + API_GET_MEMBERSHIP_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<void> loginUser(String? basicAuth) async {
    try {
      var response = await http.post(
        Uri.parse(
          API_BASE_URL + API_LOGIN,
        ),
        headers: <String, String>{'Authorization': basicAuth!},
      );

      if (response.statusCode == 200) {
        final finalResponse = jsonDecode(response.body);
        SessionManager.saveUserToken(basicAuth!);
        SessionManager.saveUserId(finalResponse['id']);
        SessionManager.saveUserEmail(finalResponse['email']);
        SessionManager.saveFirstName(finalResponse['first_name']);
        SessionManager.savelastName(finalResponse['last_name']);
        SessionManager.saveProfileImagePath(finalResponse['avatar_urls']['96']);
        Get.offAllNamed(Routes.MAIN_SCREEN);
        //  Fluttertoast.showToast(
        //   msg: finalResponse,
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.red,
        //   textColor: Colors.yellow);
      } else {
        print("Login Falied");
        AlertController.show(
            "Login Falied", "Invalid Credintials", TypeAlert.error);
        Future.error('Server Error');
      }
    } catch (e) {
      Future.error(e);
      print({'Login error', e});
      AlertController.show(
          "Login Falied", "Invalid Credintial", TypeAlert.error);
      // Fluttertoast.showToast(
      //     msg: e.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.yellow);
    }
  }

  Future<List> getAllCards() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL + API_GET_ALL_CARDS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllCommentsById() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL + API_GET_COMMENTS_BY_ID),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllStories() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_ALL_STORIES),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getRelatedPosts() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL + API_GET_RELATED_POST),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getComingIntoOneness() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_COMING_INTO_ONENESS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getPattyTestimonial() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_PATTY_TESTIMONIALS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getTheProgramDetailsComingInOneness() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_THE_PROGRAM_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getWhoIsComingInOneness() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_WHO_IS_COMING_INTO_ONENESS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> fourStagesInnerUnion() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_FOUR_STAGES_INNER_UNION,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> membershipIntro() async {
    print({
      "membershipIntro URLLLL ... ",
      API_BASE_URL_2 + API_GET_MEMBERSHIP_INTRO
    });
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_MEMBERSHIP_INTRO,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> membershipCheckPoints() async {
    print({
      "membershipCheckPoints URLLLLL... ",
      API_BASE_URL_2 + API_GET_MEMBERSHIP_CHECKPOINTS
    });
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_MEMBERSHIP_CHECKPOINTS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> membershipAccordion() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_MEMBERSHIP_ACCORDIONS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getMembershipPlansDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_MEMBERSHIP_PAYMENTS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> innerLearningPaymentBelowText() async {
    print({
      "innerLearningPaymentBelowText URLLLLL... ",
      API_BASE_URL_2 + API_GET_MEMBERSHIP_BELOW_PAYMENTS_TEXT
    });
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_MEMBERSHIP_BELOW_PAYMENTS_TEXT,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_PART1_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionDetailsPartTwo() async {
    print({
      "getSessionDetailsPartTwo URLLLL ... ",
      API_BASE_URL_2 + API_GET_SESSIONS_PART2_DETAILS
    });
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_PART2_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionDetailsPartThree() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_PART3_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionDetailsPartFour() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_PART4_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionDetailsPartFive() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_PART5_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllOneOffCardsDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_CARDS_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> getAllAkashaHealingCardsDetails() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_AKASHA_HEALING_CARDS_DETAILS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionCheckPoints() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_CHECKPOINTS,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<List> sessionTestimony() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_TESTIMONY,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionSecretToUnlockingHeavenEarth() async {

    print({"sessionSecretToUnlockingHeavenEarth URLLLL ... ", API_BASE_URL_2 + API_GET_SESSIONS_SECRET_UNLOCK_HEAVEN_EARTH});

    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_SECRET_UNLOCK_HEAVEN_EARTH,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> sessionFaciliatedAkasha() async {
    try {
      var response = await http.get(
        Uri.parse(
          API_BASE_URL_2 + API_GET_SESSIONS_FACILITATED_AKASHA,
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<void> captureEmail(String email, name) async {
    try {
      var response = await http.post(
        Uri.parse(
          'http://app.sabriyeayana.com/?ac_request=1&ac_email=$email&fname=$name',
        ),
      );
      if (response.statusCode == 200) {
        return debugPrint('Email Captured Sucessfully');
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<void> forgotPassword(String registeredEmail) async {
    try {
      var response = await http.post(
        Uri.parse(
          'https://sabriyeayana.com/wp-json/bdpwr/v1/reset-password',
        ),
        body: {
          "email": registeredEmail,
        },
      );
      if (response.statusCode == 200) {
        final finalResponse = jsonDecode(response.body);
        Get.snackbar(
          'Reset Password Link send to Email',
          finalResponse['message'],
          backgroundColor: AppColors.white,
        );
      } else {
        final finalResponse = jsonDecode(response.body);
        return Future.error(
          Get.snackbar(
            finalResponse['code'],
            finalResponse['message'],
            backgroundColor: AppColors.white,
          ),
        );
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<http.Response?> changeEmail(String basicAuth, String newEmail) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(API_UPDATE_EMAIL),
        headers: <String, String>{'Authorization': basicAuth},
        body: {
          "user_email": newEmail,
        },
      );
    } catch (e) {
      Get.snackbar('Something Went Wrong', e.toString());
    }
    return response;
  }

  Future<http.Response?> changePassword(
      String basicAuth, String newPassword, String confirmPassword) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(API_UPDATE_PASSWORD),
        headers: <String, String>{'Authorization': basicAuth},
        body: {
          "new_password": newPassword,
          "confirm_password": confirmPassword,
        },
      );
    } catch (e) {
      Get.snackbar(
        'Something Went Wrong',
        e.toString(),
      );
    }
    return response;
  }

  Future<http.Response?> verifyEmailOtp(String basicAuth, String otp) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(API_VERIFY_EMAIL_OTP),
        headers: <String, String>{'Authorization': basicAuth},
        body: {
          "otp": otp,
        },
      );
    } catch (e) {
      Get.snackbar('Something Went Wrong', e.toString());
    }
    return response;
  }

  Future<http.Response?> verifyPasswordOtp(String basicAuth, String otp) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(API_VERIFY_PASSWORD_OTP),
        headers: <String, String>{'Authorization': basicAuth},
        body: {
          "otp": otp,
        },
      );
    } catch (e) {
      Get.snackbar('Something Went Wrong', e.toString());
    }
    return response;
  }

  Future<http.Response?> getProfileImage(String basicAuth) async {
    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(API_GET_PROFILE_IMAGE),
        headers: <String, String>{'Authorization': basicAuth},
      );
      final finalResponeJson = jsonDecode(response.body);
      if (finalResponeJson['status'] == 'success') {
        SessionManager.saveProfileImagePath(
          finalResponeJson['profile_image'].toString(),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Something Went Wrong',
        e.toString(),
      );
    }
    return response;
  }

  Future<Map> getDashboardBannerImage() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_ALL_BANNER_IMAGE),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getBlogBannerImage() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_ALL_BANNER_IMAGE),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getInnerUnionBannerImage() async {
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_ALL_BANNER_IMAGE),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getInnerUnionIntroText() async {
    print({
      'URLLLLL getInnerUnionIntroText... ',
      API_BASE_URL_2 + API_GET_INNER_UNION_INTRO_TEXT
    });
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_INNER_UNION_INTRO_TEXT),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }

  Future<Map> getThankYouApi() async {
    print({'URLLLLL getThankYouApi... ', API_BASE_URL_2 + API_GET_THANK_YOU});
    try {
      var response = await http.get(
        Uri.parse(API_BASE_URL_2 + API_GET_THANK_YOU),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error('Exception error');
    }
  }
}
