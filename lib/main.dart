import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/calender_page_controller.dart';
import 'Controller/paragraph_form_controller.dart';
import 'Screen/calendar_screen.dart';
import 'Screen/main_screen.dart';
import 'Screen/paragraph_form_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CalenderPageController());
    Get.lazyPut(() => ParagraphFormController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          canvasColor: Colors.white,///here
        ),
      home: MainScreen()
    );
  }
}

