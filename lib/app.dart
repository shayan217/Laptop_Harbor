import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/bindings/genral_binding.dart';
import 'package:lhstore/features/authentication/screens/splashscreen.dart';
import 'package:lhstore/utils/theme/theme.dart';


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: LHAppTheme.lightTheme,
      darkTheme: LHAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: SplashScreen(),
      
    );  
  }
}