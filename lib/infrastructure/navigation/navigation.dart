import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_cli/presentation/input_kegiatan/input_kegiatan.screen.dart';
import 'package:get_cli/presentation/mou/mou.screen.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(
        nama: '',
      ),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => AuthLoginScreen(),
      binding: AuthLoginControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_REGISTER,
      page: () => AuthRegisterScreen(),
      binding: AuthRegisterControllerBinding(),
    ),
    GetPage(
      name: Routes.MOU,
      page: () => MouScreen(),
      binding: MouControllerBinding(),
    ),
    GetPage(
      name: Routes.PRODI,
      page: () => ProdiScreen(),
      binding: ProdiControllerBinding(),
    ),
    GetPage(
      name: Routes.MOA,
      page: () => MoaScreen(),
      binding: MoaControllerBinding(),
    ),
    GetPage(
      name: Routes.INPUT_KEGIATAN,
      page: () => InputKegiatanScreen(),
      binding: InputKegiatanControllerBinding(),
    ),
    GetPage(
      name: Routes.MOU_DETAIL,
      page: () => MouDetailScreen(),
      binding: MouDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.MOA_DETAIL,
      page: () => MoaDetailScreen(),
      binding: MoaDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
  ];
}
