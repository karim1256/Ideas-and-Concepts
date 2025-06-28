import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intern_task/data/models/tileModel.dart';

class CustomerServiceController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var selectedTab = 'FAQ'.obs;
  final isLoading = true.obs;
  RxList<TileModel> tiles = <TileModel>[].obs;
  RxList<TileModel> search = <TileModel>[].obs;
  final notFount = false.obs;

  @override
  void onInit() {
    fetchFaqs();
    fetchContactMethods();

    super.onInit();
  }

  Future<void> fetchFaqs() async {
    try {
      isLoading(true);
      final snapshot = await firestore.collection('questions').get();

      tiles.clear();
      for (var doc in snapshot.docs) {
        tiles.add(TileModel.fromJson(doc.data()));
      }

      search.assignAll(
        tiles,
      ); 
      print("Loaded ${tiles.length} FAQs");
    } catch (e) {
      print("Error loading FAQs: $e");
      Get.snackbar('Error', 'Failed to load FAQs: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }


final searchFocusNode = FocusNode();

@override
void onClose() {
  searchFocusNode.dispose();
  super.onClose();
}

  final notFound = false.obs;
  void searchQuestion(String input) {
    if (input.isEmpty) {
      search.assignAll(tiles);
      notFound.value = false; 
    } else {
      final filtered =
          tiles
              .where(
                (i) =>
                    i.question.toLowerCase().contains(input.toLowerCase()) ||
                    (i.answer.toLowerCase().contains(input.toLowerCase()) ??
                        false),
              )
              .toList();

      search.assignAll(filtered);
      notFound.value = filtered.isEmpty;
    }
  }

  Future<void> addMessage(String message, bool isSender) async {
    try {
      await firestore.collection('messages').add({
        'message': message,
        'isUser': isSender,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to send message');
      print('Error sending message: $e');
    }
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Map<String, dynamic>> contactMethods =
      <Map<String, dynamic>>[].obs;
  final RxBool Loading = true.obs;

  @override
  Future<void> fetchContactMethods() async {
    try {
      isLoading(true);
      final snapshot = await _firestore.collection('contact_methods').get();
      contactMethods.assignAll(snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      Get.snackbar('Error', 'Failed to load contact methods: $e');
    } finally {
      Loading(false);
    }
  }
}
