import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:intern_task/core/widgets/widget.dart';

Widget faqTile(BuildContext context, String question, String answer) {
  return Column(
    children: [
      Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, 
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(
              color: AppColors.salmonColor,
              fontSize: screenWidth(context) * 0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconColor: AppColors.salmonColor, 
          collapsedIconColor: AppColors.salmonColor, 
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth(context) * 0.04,
                right: screenWidth(context) * 0.04,
                bottom: 10,
              ),
              child: Text(
                answer,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: screenWidth(context) * 0.035,
                ),
              ),
            ),
          ],
        ),
      ),
      customDivider(),
    ],
  );
}
