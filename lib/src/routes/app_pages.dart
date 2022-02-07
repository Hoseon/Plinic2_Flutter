import 'package:get/get.dart';
import 'package:plinic2/src/app.dart';
import 'package:plinic2/src/bindings/ble_binding.dart';
import 'package:plinic2/src/bindings/creditCard_binding.dart';
import 'package:plinic2/src/bindings/home/home_biding.dart';
import 'package:plinic2/src/bindings/tabs_binding.dart';
import 'package:plinic2/src/pages/ble_connect/ble_care_v2.dart';
import 'package:plinic2/src/pages/ble_connect/ble_ready_v2.dart';
import 'package:plinic2/src/pages/home/home_main.dart';
import 'package:plinic2/src/pages/login.dart';
import 'package:plinic2/src/pages/review/review.dart';
import 'package:plinic2/src/pages/subscribe/subscribe_regist_cart.dart';
import 'package:plinic2/src/pages/tabs/tabs.dart';
import 'package:plinic2/src/splash.dart';
import 'package:plinic2/src/splash_2.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
    ),
    GetPage(
        name: '/splash2',
        page: () => Splash2Page(),
        transition: Transition.fadeIn),
    GetPage(name: '/login', page: () => Login(), transition: Transition.fadeIn),
    GetPage(
        name: '/app', page: () => App(), transition: Transition.noTransition),
    GetPage(name: '/home', page: () => HomeMainPage(), binding: HomeBinding()),
    GetPage(
        name: '/reviews',
        page: () => ReviewPage(),
        transition: Transition.fadeIn),
    GetPage(name: '/tabs', page: () => Tabs(), binding: TabsBinding()),
    GetPage(name: '/bleCare', page: () => BleCareV2Page()),
    GetPage(
        name: '/bleRedayV2',
        page: () => BleReadyV2Page(),
        binding: BleBinding()),
    GetPage(
        name: '/crediCard',
        page: () => SubScribeRegistCard(),
        binding: CreditCardBinding()),

    // GetPage(name: '/home', page:()=> HomePage(), binding: DrawerBinding()),
  ];
}
