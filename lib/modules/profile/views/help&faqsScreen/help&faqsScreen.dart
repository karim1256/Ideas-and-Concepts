import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:intern_task/core/widgets/widget.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';
import 'package:intern_task/modules/profile/views/help&faqsScreen/faq.dart';
import 'package:intern_task/modules/profile/views/help&faqsScreen/helpCenter.dart';
import 'package:intern_task/modules/profile/views/help&faqsScreen/tabBar.dart';
class HelpFaqScreen extends StatelessWidget {
  const HelpFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = screenWidth(context);
    final double height = bodyHeight(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
        ),
        title: Text(
          'Help & FAQs',
          style: TextStyle(
            color: AppColors.salmonColor,
            fontSize: width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'How Can We Help You?',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.025),
                customDivider(),
                SizedBox(height: height * 0.025),
                tabBar(context),
                SizedBox(height: height * 0.017),
              ],
            ),
          ),
          Expanded( 
            child: GetX<CustomerServiceController>(
              builder: (controller) {
                return controller.selectedTab.value == 'FAQ'
                    ? Faq()
                    : ContactUsScreen();
              },
            ),
          ),
        ],
      ),
    );
  }
}