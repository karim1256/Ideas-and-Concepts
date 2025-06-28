import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:get/get.dart';
import 'package:intern_task/core/constants/responsiveUi.dart';
import 'package:intern_task/core/constants/theme.dart';
import 'package:intern_task/modules/profile/controllers/customerServiceController.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController messageController = TextEditingController();
  final CustomerServiceController customerServiceController = Get.put(CustomerServiceController());

  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final height = bodyHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Chat App',
          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.salmonColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No messages yet'));
                }

                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.015,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data!.docs[index];
                    final isSender = doc['isUser'] ?? false;
                    final message = doc['message'] ?? '';

                    return BubbleSpecialThree(
                      text: message,
                      color: isSender ? AppColors.salmonColor : AppColors.beigeColor,
                      tail: true,
                      isSender: isSender,
                      textStyle: TextStyle(
                        color: isSender ? Colors.white : AppColors.blackColor,
                        fontSize: 16,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              decoration: BoxDecoration(
                color: AppColors.beigeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(color: AppColors.blackColor),
                      decoration: const InputDecoration(
                        hintText: 'Type your message',
                        hintStyle: TextStyle(
                          color: AppColors.brownRosyColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.terracottaColor,
                    ),
                    onPressed: () {
                      if (messageController.text.trim().isNotEmpty) {
                        customerServiceController.addMessage(
                          messageController.text.trim(),
                          true, // Assuming user is always sender in this case
                        );
                        messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.whiteColor,
    );
  }
}