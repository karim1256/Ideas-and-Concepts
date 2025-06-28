import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';

Widget tabBar(BuildContext context) {
  final tabs = ['FAQ', 'Contact Us'];
  final CustomerServiceController CustomerServcontroller = Get.put(
    CustomerServiceController(),
  ); 

  return Wrap(
    spacing: screenWidth(context) * 0.02,
    runSpacing: bodyHeight(context) * 0.015,
    children:
        tabs.map((tab) {
          return MaterialButton(
            onPressed: () {
              CustomerServcontroller.selectedTab.value =
                  tab; 
            },
            child: GetX<CustomerServiceController>(
              init: CustomerServcontroller,
              builder: (controller) {
                return Container(
                  width: screenWidth(context) * 0.3,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.04,
                    vertical: bodyHeight(context) * 0.012,
                  ),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedTab.value == tab
                            ? AppColors.terracottaColor
                            : AppColors.beigeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      tab,
                      style: TextStyle(
                        color:
                            controller.selectedTab.value == tab
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                        fontSize: screenWidth(context) * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
  );
}
