import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:intern_task/core/widgets/ui.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';

final CustomerServiceController controller = Get.find();

Widget customTextField(BuildContext context) {
  final CustomerServiceController controller = Get.find();
  
  return TextField(
    focusNode: controller.searchFocusNode,
    onChanged: (value) => controller.searchQuestion(value),
    decoration: InputDecoration(
      hintText: 'Search',
      hintStyle: TextStyle(color: AppColors.brownRosyColor),
      filled: true,
      fillColor: AppColors.beigeColor,
      prefixIcon: InkWell(
        onTap: () {
          controller.searchFocusNode.requestFocus();
          FocusScope.of(context).requestFocus(controller.searchFocusNode);
        },
        child: Icon(Icons.search, color: AppColors.brownRosyColor),
      ),
      suffixIcon: InkWell(
        onTap: () {
          controller.searchFocusNode.requestFocus();
          // Add filter logic here if needed
        },
        child: backGroundcircle(
          screenWidth(context) * 0.035,
          Icon(
            Icons.filter_list,
            color: AppColors.beigeColor,
            size: screenWidth(context) * 0.06,
          ),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: bodyHeight(context) * 0.015,
      ),
    ),
  );
}