import 'package:bellava/Bloc/user_bloc.dart';
import 'package:bellava/Screens/SplashScreen/splash_screen.dart';
import 'package:bellava/provider/push_notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
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

