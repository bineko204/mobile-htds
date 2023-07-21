import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';
import 'package:htds_mobile/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:htds_mobile/app/modules/main/controllers/main_controller.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';

import '../model/menu_code.dart';

class CustomDrawer extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;
  final MainController mainController = Get.find<MainController>();
  CustomDrawer({Key? key, required this.onNewMenuSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 113,
                  child: DrawerHeader(
                      decoration: const BoxDecoration(
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('images/logo_login.png', height: 24,),
                          IconButton(onPressed: (){
                            Get.back();
                          }, icon: const Icon(Icons.clear, size: 24,))
                        ],
                      )
                  ),
                ),
                _renderMenuItem("Ký biên bản chính thức", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
                _renderMenuItem("Ký biên bản bàn giao chi nhánh", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
                _renderMenuItem("Ký biên bản phí đầu số", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
                _renderMenuItem("Ký biên bản test", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
                _renderMenuItem("Báo cáo", Routes.REPORT, SvgPicture.asset("images/report_bottombar.svg", color: Colors.black,)),
                _renderMenuItem("Cài đặt", Routes.SETTINGS, SvgPicture.asset("images/setting.svg", color: Colors.black,)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppValues.largePadding),
            child: ElevatedButton(
                onPressed: () {
                  mainController.openConfirmPopup(content: "Bạn chắc chắn muốn đăng xuất?", onConfirm: (){
                    Get.back();
                    mainController.preferenceManager.setString("enableBioAuthentication", "");
                    mainController.preferenceManager.setString("username", "");
                    mainController.preferenceManager.setString("accessToken", "");
                    Get.offAllNamed(Routes.LOGIN);
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Đăng xuất",
                        style: TextStyle( fontSize: 12)),
                    SizedBox(width: AppValues.smallPadding,),
                    Icon(Icons.exit_to_app, size: 18,)
                  ],
                )),
          ),
          
        ],
      ),
    );
  }
  _renderMenuItem(String name, String url, Widget icon) {
    return ListTile(
      hoverColor: Colors.red,
      leading: icon,
      title: Text(name),
      onTap: () {
        Get.back();
        if (url == Routes.REPORT) {
          final BottomNavController navController = Get.find<BottomNavController>();
          navController.updateSelectedIndex(1);
          onNewMenuSelected(MenuCode.REPORT);
        }else {
          Get.toNamed(url);
        }
      },
    );
  }
}
