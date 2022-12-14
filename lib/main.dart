import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/LoginOptions.dart';
import 'package:flutter/services.dart';
import 'package:hybrid_learning_application/student/StudentLogin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.light,
    initialRoute: 'loginOptions',
    routes: {
      'loginOptions': (context) => LoginOptions(),
    },
  ));
}

