import 'package:get/get.dart';

import 'package:getwork/app/modules/home/bindings/home_binding.dart';
import 'package:getwork/app/modules/home/views/home_view.dart';
import 'package:getwork/app/modules/landing/bindings/landing_binding.dart';
import 'package:getwork/app/modules/landing/views/landing_view.dart';
import 'package:getwork/app/modules/login/bindings/login_binding.dart';
import 'package:getwork/app/modules/login/views/login_view.dart';
import 'package:getwork/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:getwork/app/modules/sign_up/views/sign_up_view.dart';
import 'package:getwork/app/modules/splash/bindings/splash_binding.dart';
import 'package:getwork/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
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
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
  ];
}
