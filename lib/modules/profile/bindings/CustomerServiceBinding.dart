import 'package:get/get.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';
import 'package:intern_task/modules/profile/views/help&faqsScreen/help&faqsScreen.dart';

class CustomerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerServiceController());
  }
}

final List<GetPage> appPages = [
  GetPage(
    name: '/HelpFaqScreen',
    page: () => HelpFaqScreen(),
    binding: CustomerServiceBinding(),
  ),
];
