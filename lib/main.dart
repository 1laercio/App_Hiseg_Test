import 'package:app_hiseg_test/app/modules/login_page/login_page.dart';
import 'package:flutter/material.dart';

import 'app/core/utils/constants/app_strings.dart';
import 'app/core/utils/style/colors/general_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: kAppName,
      home: LoginPage(),
    );
  }
}
