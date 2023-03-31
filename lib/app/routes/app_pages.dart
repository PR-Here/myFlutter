import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/account_settings/bindings/account_settings_binding.dart';
import '../modules/account_settings/views/account_settings_view.dart';
import '../modules/akasha_healing_full_details/bindings/akasha_healing_full_details_binding.dart';
import '../modules/akasha_healing_full_details/views/akasha_healing_full_details_view.dart';
import '../modules/blog_details/bindings/blog_details_binding.dart';
import '../modules/blog_details/views/blog_details_view.dart';
import '../modules/blogs_listing/bindings/blogs_listing_binding.dart';
import '../modules/blogs_listing/views/blogs_listing_view.dart';
import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/books_listing/bindings/books_listing_binding.dart';
import '../modules/books_listing/views/books_listing_view.dart';
import '../modules/bootomview_test/bindings/bootomview_test_binding.dart';
import '../modules/bootomview_test/views/bootomview_test_view.dart';
import '../modules/change_email/bindings/change_email_binding.dart';
import '../modules/change_email/views/change_email_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/coming_into_oneness/bindings/coming_into_oneness_binding.dart';
import '../modules/coming_into_oneness/views/coming_into_oneness_view.dart';
import '../modules/comments/bindings/comments_binding.dart';
import '../modules/comments/views/comments_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/divine_union_book/bindings/divine_union_book_binding.dart';
import '../modules/divine_union_book/views/divine_union_book_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/giving_back/bindings/giving_back_binding.dart';
import '../modules/giving_back/views/giving_back_view.dart';
import '../modules/inner_union_oracle/bindings/inner_union_oracle_binding.dart';
import '../modules/inner_union_oracle/views/inner_union_oracle_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/membership/bindings/membership_binding.dart';
import '../modules/membership/views/membership_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/programs_details/bindings/programs_details_binding.dart';
import '../modules/programs_details/views/programs_details_view.dart';
import '../modules/programs_listing/bindings/programs_listing_binding.dart';
import '../modules/programs_listing/views/programs_listing_view.dart';
import '../modules/programs_testimonials/bindings/programs_testimonials_binding.dart';
import '../modules/programs_testimonials/views/programs_testimonials_view.dart';
import '../modules/retreats_testimonials/bindings/retreats_testimonials_binding.dart';
import '../modules/retreats_testimonials/views/retreats_testimonials_view.dart';
import '../modules/session_details/bindings/session_details_binding.dart';
import '../modules/session_details/views/session_details_view.dart';
import '../modules/session_details_akashay/bindings/session_details_akashay_binding.dart';
import '../modules/session_details_akashay/views/session_details_akashay_view.dart';
import '../modules/sessions_listing/bindings/sessions_listing_binding.dart';
import '../modules/sessions_listing/views/sessions_listing_view.dart';
import '../modules/sessions_testimonials/bindings/sessions_testimonials_binding.dart';
import '../modules/sessions_testimonials/views/sessions_testimonials_view.dart';
import '../modules/set_reminder/bindings/set_reminder_binding.dart';
import '../modules/set_reminder/views/set_reminder_view.dart';
import '../modules/side_menu/bindings/side_menu_binding.dart';
import '../modules/side_menu/views/side_menu_view.dart';
import '../modules/spiritual_spotlight/bindings/spiritual_spotlight_binding.dart';
import '../modules/spiritual_spotlight/views/spiritual_spotlight_view.dart';
import '../modules/spiritual_spotlight_details/bindings/spiritual_spotlight_details_binding.dart';
import '../modules/spiritual_spotlight_details/views/spiritual_spotlight_details_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/store/bindings/store_binding.dart';
import '../modules/store/views/store_view.dart';
import '../modules/story_page/bindings/story_page_binding.dart';
import '../modules/story_page/views/story_page_view.dart';
import '../modules/support/bindings/support_binding.dart';
import '../modules/support/views/support_view.dart';
import '../modules/teachings1/bindings/teachings1_binding.dart';
import '../modules/teachings1/views/teachings1_view.dart';
import '../modules/teachings2/bindings/teachings2_binding.dart';
import '../modules/teachings2/views/teachings2_view.dart';
import '../modules/teachings_details/bindings/teachings_details_binding.dart';
import '../modules/teachings_details/views/teachings_details_view.dart';
import '../modules/thank_you/bindings/thank_you_binding.dart';
import '../modules/thank_you/views/thank_you_view.dart';
import '../modules/top_testimonials/bindings/top_testimonials_binding.dart';
import '../modules/top_testimonials/views/top_testimonials_view.dart';
import '../modules/verification_email/bindings/verification_email_binding.dart';
import '../modules/verification_email/views/verification_email_view.dart';
import '../modules/verification_password/bindings/verification_password_binding.dart';
import '../modules/verification_password/views/verification_password_view.dart';
import '../modules/welcome_screens/bindings/welcome_screens_binding.dart';
import '../modules/welcome_screens/views/welcome_screens_view.dart';

// ignore_for_file: constant_identifier_names
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
  //  GetPage(
  //     name: _Paths.BOOTOMVIEW_TEST,
  //     page: () => const BootomviewTestView(),
  //     binding: BootomviewTestBinding(),
  //   ),
    GetPage(
      name: _Paths.WELCOME_SCREENS,
      page: () => const WelcomeScreensView(),
      binding: WelcomeScreensBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => const MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => const StoreView(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTINGS,
      page: () =>  AccountSettingsView(),
      binding: AccountSettingsBinding(),
    ),
    GetPage(
      name: _Paths.SIDE_MENU,
      page: () =>  SideMenuView(),
      binding: SideMenuBinding(),
    ),
    GetPage(
      name: _Paths.TEACHINGS_DETAILS,
      page: () => const TeachingsDetailsView(),
      binding: TeachingsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_EMAIL,
      page: () => const ChangeEmailView(),
      binding: ChangeEmailBinding(),
    ),
    GetPage(
      name: _Paths.SPIRITUAL_SPOTLIGHT,
      page: () => const SpiritualSpotlightView(),
      binding: SpiritualSpotlightBinding(),
    ),
    GetPage(
      name: _Paths.BLOGS_LISTING,
      page: () => const BlogsListingView(),
      binding: BlogsListingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKS_LISTING,
      page: () => const BooksListingView(),
      binding: BooksListingBinding(),
    ),
    GetPage(
      name: _Paths.SESSIONS_LISTING,
      page: () => const SessionsListingView(),
      binding: SessionsListingBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAMS_LISTING,
      page: () => const ProgramsListingView(),
      binding: ProgramsListingBinding(),
    ),
    GetPage(
      name: _Paths.INNER_UNION_ORACLE,
      page: () => const InnerUnionOracleView(),
      binding: InnerUnionOracleBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAILS,
      page: () => const BookDetailsView(),
      binding: BookDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.SET_REMINDER,
      page: () =>  SetReminderView(),
      binding: SetReminderBinding(),
    ),
    GetPage(
      name: _Paths.MEMBERSHIP,
      page: () => const MembershipView(),
      binding: MembershipBinding(),
    ),
    GetPage(
      name: _Paths.TOP_TESTIMONIALS,
      page: () => const TopTestimonialsView(),
      binding: TopTestimonialsBinding(),
    ),
    GetPage(
      name: _Paths.SESSIONS_TESTIMONIALS,
      page: () => const SessionsTestimonialsView(),
      binding: SessionsTestimonialsBinding(),
    ),
    GetPage(
      name: _Paths.SESSION_DETAILS,
      page: () => const SessionDetailsView(),
      binding: SessionDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SESSION_DETAILS_AKASHAY,
      page: () => const SessionDetailsAkashayView(),
      binding: SessionDetailsAkashayBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAMS_DETAILS,
      page: () => const ProgramsDetailsView(),
      binding: ProgramsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BLOG_DETAILS,
      page: () => const BlogDetailsView(),
      binding: BlogDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SPIRITUAL_SPOTLIGHT_DETAILS,
      page: () => SpiritualSpotlightDetailsView(),
      binding: SpiritualSpotlightDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.GIVING_BACK,
      page: () => const GivingBackView(),
      binding: GivingBackBinding(),
    ),
    GetPage(
      name: _Paths.COMMENTS,
      page: () => const CommentsView(),
      binding: CommentsBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAMS_TESTIMONIALS,
      page: () => const ProgramsTestimonialsView(),
      binding: ProgramsTestimonialsBinding(),
    ),
    GetPage(
      name: _Paths.RETREATS_TESTIMONIALS,
      page: () => const RetreatsTestimonialsView(),
      binding: RetreatsTestimonialsBinding(),
    ),
    GetPage(
      name: _Paths.AKASHA_HEALING_FULL_DETAILS,
      page: () => const AkashaHealingFullDetailsView(),
      binding: AkashaHealingFullDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TEACHINGS1,
      page: () => const Teachings1View(),
      binding: Teachings1Binding(),
    ),
    GetPage(
      name: _Paths.TEACHINGS2,
      page: () => const Teachings2View(),
      binding: Teachings2Binding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.STORY_PAGE,
      page: () => const StoryPageView(),
      binding: StoryPageBinding(),
    ),
    GetPage(
      name: _Paths.COMING_INTO_ONENESS,
      page: () => const ComingIntoOnenessView(),
      binding: ComingIntoOnenessBinding(),
    ),
    GetPage(
      name: _Paths.DIVINE_UNION_BOOK,
      page: () => const DivineUnionBookView(),
      binding: DivineUnionBookBinding(),
    ),
    GetPage(
      name: _Paths.THANK_YOU,
      page: () => const ThankYouView(),
      binding: ThankYouBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_PASSWORD,
      page: () => const VerificationPasswordView(),
      binding: VerificationPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_EMAIL,
      page: () => const VerificationEmailView(),
      binding: VerificationEmailBinding(),
    ),
   
  ];
}
