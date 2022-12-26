import 'package:app_hiseg_test/app/core/components/button_widget.dart';
import 'package:app_hiseg_test/app/core/utils/constants/app_strings.dart';
import 'package:app_hiseg_test/app/core/utils/style/colors/general_colors.dart';
import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';
import 'package:flutter/material.dart';

class LocatizationPage extends StatelessWidget {
  const LocatizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 15, left: 20, right: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                'assets/localization/maps.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              kPermission,
              style: TextStyles.subtitle1(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWidegt(
                  title: kNot,
                  background: kColorButtonNot,
                  height: 50,
                  width: 100,
                  style: TextStyles.button()),
              ButtonWidegt(
                title: kYes,
                background: kColorButtonYes,
                height: 50,
                width: 100,
                style: TextStyles.button(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
