import 'package:flutter/material.dart';

import 'package:login_datos/provider/theme_provider.dart';
import 'package:login_datos/screens/screens.dart';
import 'package:login_datos/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Preferences.init;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName     : ( _ ) => const HomeScreen(), 
        SettingsScreen.routerName : ( _ ) => const SettingsScreen(), 
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}