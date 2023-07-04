import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_values.dart';
import '../../../../core/widget/search.dart';
import 'general_lookup_controller.dart';

class GeneralLookupView extends BaseView<GeneralLookupController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppValues.largePadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomDropdownSearch(items: controller.listDocument.value,selectedItem: controller.listDataSearch,)
              ),
              const SizedBox(width: AppValues.smallPadding),
              InkWell(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppValues.radius_6),
                    color: const Color(0xffFEEBEF),
                  ),
                  padding: const EdgeInsets.all(AppValues.smallPadding),
                  child: SvgPicture.asset(
                    'images/bookmark.svg',
                    color: Colors.red,
                  ),
                ),
                onTap: (){
                  print(controller.listDataSearch.value);
                },
              )
            ],
          ),
        ],
      ),
    );
  }


}
