import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';

import '../../../core/widget/dropdown_multiple.dart';
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
        padding: const EdgeInsets.symmetric(
            horizontal: AppValues.padding,
            vertical: AppValues.largePadding * 2),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final SearchItem item = controller.items[index];
            final isSelected = index == controller.selectedIndex.value;
            return Container(
              decoration: BoxDecoration(
                  color: isSelected ? Colors.red : Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1) ,blurRadius: 1,offset: Offset(0, 1), spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(AppValues.smallRadius)),
              padding: const EdgeInsets.symmetric(
                  vertical: AppValues.largePadding,
                  horizontal: AppValues.smallPadding),
              child: GestureDetector(
                onTap: () {
                  controller.selectedIndex(index);
                  Get.toNamed(item.value);
                },
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      margin:
                          const EdgeInsets.only(right: AppValues.smallMargin),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.red,
                        borderRadius:
                            BorderRadius.circular(AppValues.smallRadius),
                      ),
                      child: Center(
                          child: Text(
                        "7",
                        style: TextStyle(
                            color: isSelected ? Colors.red : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    Expanded(
                        child: Text(
                      item.label!,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('images/arrow-right.svg',
                            height: AppValues.iconDefaultSize,
                            width: AppValues.iconDefaultSize,
                            color: isSelected ? Colors.white : Colors.black))
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
