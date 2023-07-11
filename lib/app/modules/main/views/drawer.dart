import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 113,
            child: DrawerHeader(
              decoration: BoxDecoration(
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/logo_login.png', height: 24,),
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.clear, size: 24,))
                ],
              )
            ),
          ),
          _renderMenuItem("Ký biên bản chính thức", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
          _renderMenuItem("Ký biên bản bàn giao chi nhánh", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
          _renderMenuItem("Ký biên bản phí đầu số", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
          _renderMenuItem("Ký biên bản test", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/edit.svg")),
          _renderMenuItem("Báo cáo", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/report_bottombar.svg", color: Colors.black,)),
          _renderMenuItem("Cài đặt", Routes.DOCUMENT_SIGN_LIST, SvgPicture.asset("images/setting.svg", color: Colors.black,)),
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
        Get.toNamed(url);
      },
    );
  }
}
