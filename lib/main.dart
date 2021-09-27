import 'package:fitkeep_flutter/helper/theme_model.dart';
import 'package:fitkeep_flutter/models/user.dart';
import 'package:fitkeep_flutter/screens/wrapper.dart';
import 'package:fitkeep_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return StreamProvider<CustomUser?>.value(
            value: AuthService().user,
            initialData: null,
            child: MaterialApp(
              home: Wrapper(),
              color: Colors.teal,
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.isDark
                  ? ThemeData(
                      primarySwatch: Colors.grey,
                      primaryColor: Colors.black,
                      brightness: Brightness.dark,
                      backgroundColor: Colors.grey.shade900,
                      accentColor: Colors.teal,
                      accentIconTheme: IconThemeData(color: Colors.teal),
                      dividerColor: Colors.black12,
                    )
                  : ThemeData(
                      primarySwatch: Colors.grey,
                      primaryColor: Colors.white,
                      brightness: Brightness.light,
                      backgroundColor: Colors.teal,
                      accentColor: Colors.black,
                      accentIconTheme: IconThemeData(color: Colors.white),
                      dividerColor: Colors.white54,
                    ),
            ),
          );
        },
      ),
    );

    /*

    */
  }
}
