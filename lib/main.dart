import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/loginoptions.dart';
import 'package:flutter/services.dart';
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
