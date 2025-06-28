import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/widgets/ui.dart';
import 'package:intern_task/core/widgets/widget.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = screenWidth(context);
    double height = bodyHeight(context);
    final CustomerServiceController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,

        elevation: 0,
        title: Text(
          'Customer Service',
          style: TextStyle(
            color: AppColors.salmonColor,
            fontSize: width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hello! I'm Here To Assist You",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: width * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.02),
            customDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: bodyHeight(context) * 0.022,
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue lorem vel tincidunt.',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: width * 0.035,
                ),
              ),
            ),
            customDivider(),
            _serviceTile(
              context,
              title: 'How can we help you?',
              subtitle: 'Support',
              onTap: () {
                Get.toNamed('/HelpFaqScreen');
              },
            ),
            customDivider(),
            _serviceTile(
              context,
              title: 'Help center',
              subtitle: 'General Information',
              onTap: () {
                Get.toNamed('/ChatScreen');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: bodyHeight(context) * 0.007),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: screenWidth(context) * 0.042,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: screenWidth(context) * 0.035,
          ),
        ),
        trailing:
         backGroundcircle(
          screenWidth(context) * 0.041,
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.beigeColor,
            size: screenWidth(context) * 0.06,
          ),
        ),

        onTap: onTap,
      ),
    );
  }
}
