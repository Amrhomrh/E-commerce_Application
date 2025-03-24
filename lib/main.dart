import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/constint/color.dart';
import 'package:shoping/core/locallzition/tranzlation_controller.dart';
import 'package:shoping/core/servesies/binding/binding.dart';
import 'package:shoping/notification.dart';
import 'package:shoping/routes.dart';
import 'package:shoping/view/screen/laungueg.dart';
import 'package:shoping/view/screen/onboarding.dart';
import 'package:shoping/view/screen/users/setings.dart';
import 'core/locallzition/tranzlation.dart';
import 'core/servesies/servesies.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    localeController controller= Get.put(localeController());
    return GetMaterialApp(
      translations: MyTranzlation(),

      debugShowCheckedModeBanner: false,
      title: 'shoping',
      locale: controller.language,
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        hintColor: Colors.amber[600],
        scaffoldBackgroundColor: AppColor.background,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        textTheme: TextTheme(

          displayLarge: TextStyle(color: AppColor.texthead, fontSize: 28, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
          labelLarge: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColor.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
      ),

          // home: NotificationsHelper(),
      // home: laungueg(),
      // home: Setings(),

      initialBinding: Binding(),

      // routes:routes,
      getPages: routes,
    );
  }
}
