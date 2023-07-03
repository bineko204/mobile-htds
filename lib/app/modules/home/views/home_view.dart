import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/paging_view.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    // controller.getGithubGetxProjectList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        // controller.onRefreshPage();
      },
      onLoadNextPage: () {
        // controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: AppValues.largePadding*2),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(AppValues.smallRadius)),
              padding: const EdgeInsets.symmetric(
                  vertical: AppValues.largePadding,
                  horizontal: AppValues.smallPadding),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.DOCUMENT_SIGN_LIST, parameters: {"type": index.toString()} );
                },
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: AppValues.smallMargin),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppValues.smallRadius),
                      ),
                      child: const Center(
                          child: Text(
                        "7",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    const Expanded(
                        child: Text(
                      "Ký biên bản chính thức",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'images/arrow-right.svg',
                          height: AppValues.iconDefaultSize,
                          width: AppValues.iconDefaultSize,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: AppValues.largePadding),
        ),
      ),
    );
  }
}
