import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:munjizoon_app/Utils/4.1%20my_string.dart';
import 'package:munjizoon_app/lessonScreen/widget/Favorate.dart';
import 'package:munjizoon_app/registration/SignUp.dart';
import 'package:munjizoon_app/registration_%20not%20_valid/RegistrationNotValid.dart';
import 'package:provider/provider.dart';
import 'registration/LogIn.dart';
import 'routes/route.dart';

void main() {
  runApp(ChangeNotifierProvider<Favorites>(
    child: const MyApp(),
    create:(_)=>Favorites(),
  ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'astroo food',
      locale: Locale( 'lang'),
      fallbackLocale: Locale(eng),
  /*    translations: LocalizationApp(),*/
      debugShowCheckedModeBanner: false,
    /*  theme: ThemeApp.light,
      //themeMode: ThemeController().themeDateGet,
      darkTheme: ThemeApp.dark,*/
     initialRoute: Approute.welcome,


      getPages:Approute.route,
    );
  }
}

