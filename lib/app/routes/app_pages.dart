import 'package:get/get.dart';

import 'package:getwork/app/modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import 'package:getwork/app/modules/auth/forgot_password/views/forgot_password_view.dart';
import 'package:getwork/app/modules/auth/login/bindings/login_binding.dart';
import 'package:getwork/app/modules/auth/login/views/login_view.dart';
import 'package:getwork/app/modules/auth/otp/bindings/otp_binding.dart';
import 'package:getwork/app/modules/auth/otp/views/otp_view.dart';
import 'package:getwork/app/modules/auth/sign_up/bindings/sign_up_binding.dart';
import 'package:getwork/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:getwork/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:getwork/app/modules/dashboard/views/dashboard_view.dart';
import 'package:getwork/app/modules/home/bindings/home_binding.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';
import 'package:getwork/app/modules/job_details/bindings/job_details_binding.dart';
import 'package:getwork/app/modules/job_details/views/job_details_view.dart';
import 'package:getwork/app/modules/messages/bindings/messages_binding.dart';
import 'package:getwork/app/modules/messages/views/messages_view.dart';
import 'package:getwork/app/modules/my_dash/bindings/my_dash_binding.dart';
import 'package:getwork/app/modules/my_dash/views/my_dash_view.dart';
import 'package:getwork/app/modules/profile/bindings/profile_binding.dart';
import 'package:getwork/app/modules/profile/views/profile_view.dart';
import 'package:getwork/app/modules/proposals/bindings/proposals_binding.dart';
import 'package:getwork/app/modules/proposals/views/proposals_view.dart';
import 'package:getwork/app/modules/purchase_credits/bindings/purchase_credits_binding.dart';
import 'package:getwork/app/modules/purchase_credits/views/purchase_credits_view.dart';
import 'package:getwork/app/modules/splash/bindings/splash_binding.dart';
import 'package:getwork/app/modules/splash/views/splash_view.dart';
import 'package:getwork/app/modules/submit_proposal/bindings/submit_proposal_binding.dart';
import 'package:getwork/app/modules/submit_proposal/views/submit_proposal_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROPOSALS,
      page: () => ProposalsView(),
      binding: ProposalsBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: _Paths.JOB_DETAILS,
      page: () => JobDetailsView(),
      binding: JobDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SUBMIT_PROPOSAL,
      page: () => SubmitProposalView(),
      binding: SubmitProposalBinding(),
    ),
    GetPage(
      name: _Paths.MY_DASH,
      page: () => MyDashView(),
      binding: MyDashBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_CREDITS,
      page: () => PurchaseCreditsView(),
      binding: PurchaseCreditsBinding(),
    ),
  ];
}
