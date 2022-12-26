import 'package:app_hiseg_test/app/core/components/button_widget.dart';
import 'package:app_hiseg_test/app/core/components/text_form_widget.dart';
import 'package:app_hiseg_test/app/core/utils/constants/app_strings.dart';
import 'package:app_hiseg_test/app/core/utils/style/colors/general_colors.dart';
import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 15),
        child: Image.asset(
          'assets/core/logo.png',
          fit: BoxFit.fitWidth,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 25,left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              kWelcome,
              style: TextStyles.headline1(),
            ),
          ],
        ),
      ),
      const TextFormWidget(
        title: kCpf,
        color: kColorBackground,
        subtitle: kUserCPF,
      ),
      const TextFormWidget(
        title: kPassword,
        color: kColorBackground,
        subtitle: kInsertpassword,
      ),
      ButtonWidegt(
        title: kLogin,
        background: kColorBackgroundUser,
        height: 50,
        width: 200,
        style: TextStyles.button(color: Colors.white),
      )
    ]));
  }
}
