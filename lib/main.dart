import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intern_task/modules/profile/bindings/CustomerServiceBinding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intern_task/routes/customerServiceRoutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: CustomerServiceBinding(),
      initialRoute: AppRoutes.page4,
      getPages: appRoutes,
    );
  }
}
