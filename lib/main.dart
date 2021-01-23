import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Screens/SplashScreen/splash_screen.dart';
import 'package:bellava/Screens/controllers/Order_controller.dart';
import 'package:bellava/Screens/controllers/Service_controller.dart';
import 'package:bellava/provider/push_notification_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  
 
  @override
  Widget build(BuildContext context) {
    Get.put<ServiceController>(ServiceController());
    Get.put<OrderController>(OrderController());
    return BlocProvider(
      child: GetMaterialApp(
         localizationsDelegates: [
   // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('es'), // Español
            const Locale('he'), // Hebrew
            const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
            // ... other locales the app supports
          ],
        debugShowCheckedModeBanner: false,
        title: 'Bellevá',
        home: SplashScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}

