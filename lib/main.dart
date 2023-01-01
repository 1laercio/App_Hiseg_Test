import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/core/data/db/users_services.dart';
import 'app/service/home_service.dart';
import 'app/service/localization_service.dart';
import 'app/service/login_service.dart';
import 'app/core/utils/constants/app_strings.dart';
import 'app/modules/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LocalizationService>(
              create: (context) => LocalizationService()),
          ChangeNotifierProvider<UsersService>(
              create: (context) => UsersService()),
          ChangeNotifierProvider<LoginService>(
              create: (context) => LoginService(context.read())),
              ChangeNotifierProvider<HomeService>(
              create: (context) => HomeService()),
        ],
        child: const MaterialApp(
          title: kAppName,
          home: LoginPage(),
        ));
  }
}
