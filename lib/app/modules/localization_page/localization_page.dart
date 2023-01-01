import 'package:app_hiseg_test/app/core/components/button_widget.dart';
import 'package:app_hiseg_test/app/core/utils/constants/app_strings.dart';
import 'package:app_hiseg_test/app/core/utils/style/colors/general_colors.dart';
import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/localization_service.dart';
import '../home_page/home_page.dart';

class LocatizationPage extends StatefulWidget {
  const LocatizationPage({super.key});

  @override
  State<LocatizationPage> createState() => _LocatizationPageState();
}

class _LocatizationPageState extends State<LocatizationPage> {
  @override
  void initState() {
    super.initState();
    final controller = context.read<LocalizationService>();
    controller.getPosicao();
    controller.addListener(() {
      if (controller.status == StatusLocalization.sucesso) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LocalizationService>();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 15, left: 20, right: 20),
            child: SizedBox(
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
              controller.erro,
              style: TextStyles.subtitle1(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWidegt(
                  onPressed: (() => Navigator.pop(context)),
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
                onPressed: () async {
                  await controller.getPosicao();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
