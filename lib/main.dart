import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruah_android_tv/spalsh_screen.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet,Intent>{
        LogicalKeySet(LogicalKeyboardKey.select):ActivateIntent(),
      },
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home:  new SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomePage': (BuildContext context) => new HomePage()
        },
      ),
    );
  }
}

