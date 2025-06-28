import 'package:get/get.dart';
import 'package:intern_task/modules/profile/views/chatApp/chatAppCustomerServeInterface.dart';
import 'package:intern_task/modules/profile/views/chatApp/chatAppUserInterface.dart';
import 'package:intern_task/modules/profile/views/customerServiceScreen/customerService.dart';
import 'package:intern_task/modules/profile/views/help&faqsScreen/help&faqsScreen.dart';

class AppRoutes {
  static const page1 = '/HelpFaqScreen';
  static const page2 = '/CustomerServiceScreen';
 static const page3 = '/ChatScreen';
  static const page4 = '/ChatScreenServe';
}

final List<GetPage> appRoutes = [
  GetPage(
    name: AppRoutes.page1,
    page: () => HelpFaqScreen(),
  ),
  GetPage(
    name: AppRoutes.page2,
    page: () =>CustomerServiceScreen(),
  ),
  GetPage(
    name: AppRoutes.page3,
    page: () => ChatScreen(),
  ),
   GetPage(
    name: AppRoutes.page4,
    page: () => ChatScreenServe(),
  ),
  
];
