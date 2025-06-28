import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/widgets/ProfileTextFormField.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';
import 'package:intern_task/modules/profile/views/help&faqsScreen/faqTile.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = screenWidth(context);
    final double height = bodyHeight(context);
    final CustomerServiceController controller = Get.find();

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          children: [
            customTextField(context),
            SizedBox(height: height * 0.02),
            Expanded(
              child:
                  controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : controller.notFound.value
                      ? Center(
                        child: Text(
                          'No results found',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: controller.search.length,
                        itemBuilder: (context, index) {
                          final tile = controller.search[index];
                          return faqTile(context, tile.question, tile.answer);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
