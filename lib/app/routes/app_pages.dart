import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/document_sign_list/bindings/document_sign_list_binding.dart';
import 'package:htds_mobile/app/modules/document_sign_list/views/document_sign_list_view.dart';
import 'package:htds_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:htds_mobile/app/modules/login/views/login_view.dart';
import 'package:htds_mobile/app/modules/reset_password/views/reset_password_view.dart';

import '../modules/reset_password/bindings/reset_password_binding.dart';
import '/app/modules/favorite/bindings/favorite_binding.dart';
import '/app/modules/favorite/views/favorite_view.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/bindings/main_binding.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/other/bindings/other_binding.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/project_details/bindings/project_details_binding.dart';
import '/app/modules/project_details/views/project_details_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT_SIGN_LIST,
      page: () => DocumentSignListView(),
      binding: DocumentSignListBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAILS,
      page: () => ProjectDetailsView(),
      binding: ProjectDetailsBinding(),
    ),
  ];
}
