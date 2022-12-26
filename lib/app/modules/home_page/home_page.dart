import 'package:app_hiseg_test/app/core/utils/constants/app_strings.dart';
import 'package:app_hiseg_test/app/core/utils/style/colors/general_colors.dart';
import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackgroundUser,
      appBar: AppBar(
        backgroundColor: kColorBackground,
        title: Text(
          kUsers,
          style: TextStyles.headline1(),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                    color: kColorBackground,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10))),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 52,
                        backgroundColor: kColorBackgroundUser,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/localization/maps.png'),
                        ),
                      ),
                    ),
                    Column(
                      children: const [
                        Text(kUserName),
                        Text(kLocalizaton),
                        Text(kAge),
                        Text(kUserType),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
