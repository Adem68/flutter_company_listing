import 'package:flutter/material.dart';
import 'package:flutter_company_listing/home_page.dart';
import 'package:flutter_company_listing/model/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isLightTheme: true),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Which Companies Using Flutter in Turkey',
      theme: themeProvider.getThemeData,
      home: const HomePage(),
    );
  }
}
