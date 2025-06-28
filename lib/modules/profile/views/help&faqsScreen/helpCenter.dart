import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/widgets/ui.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final Map<int, bool> _expandedStates = {};
  final CustomerServiceController controller = Get.put(
    CustomerServiceController(),
  );

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final height = bodyHeight(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...controller.contactMethods.asMap().entries.map((entry) {
                final index = entry.key;
                final method = entry.value;
                final isExpanded = _expandedStates[index] ?? false;

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _expandedStates[index] = !isExpanded;
                        });
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: backGroundcircle(
                          width * 0.05,
                          Icon(
                            _getIconData(method['icon'] ?? ''),
                            color: AppColors.blackColor,
                          ),
                        ),
                        title: Text(
                          method['label'] ?? '',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: width * 0.042,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    if (isExpanded) ...[
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.12,
                          right: width * 0.05,
                          bottom: height * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              method['details'] ?? '',
                              style: TextStyle(
                                fontSize: width * 0.038,
                                color: AppColors.blackColor.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            GestureDetector(
                              onTap: () => _launchURL(method['link'] ?? ''),
                              child: Text(
                                'Tap to open',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: AppColors.terracottaColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const Divider(),
                  ],
                );
              }),
            ],
          ),
        );
      }),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'support_agent':
        return Icons.support_agent;
      case 'language':
        return Icons.language;
      case 'facebook':
        return Icons.facebook;
      case 'message':
        return Icons.message;
      case 'camera_alt':
        return Icons.camera_alt;
      default:
        return Icons.help_outline;
    }
  }
}
