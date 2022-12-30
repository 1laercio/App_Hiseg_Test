import 'package:app_hiseg_test/app/core/components/button_widget.dart';
import 'package:app_hiseg_test/app/core/components/text_form_widget.dart';
import 'package:app_hiseg_test/app/core/data/model/users.dart';
import 'package:app_hiseg_test/app/core/utils/constants/app_strings.dart';
import 'package:app_hiseg_test/app/core/utils/style/colors/general_colors.dart';
import 'package:app_hiseg_test/app/core/utils/style/themes/text_styles.dart';
import 'package:app_hiseg_test/app/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../localization_page/localization_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txCPFController = TextEditingController();
  TextEditingController txPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isParecerSenha = true;

  @override
  void initState() {
    super.initState();
    final controller = context.read<LoginService>();

    controller.addListener(() {
      if (controller.status == StatusLogin.falha) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Usuário ou Senha Inválida')));
      } else if (controller.status == StatusLogin.sucesso) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LocatizationPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginService>();

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
        padding: const EdgeInsets.only(bottom: 25, left: 25),
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
      TextFormWidget(
        controller: txCPFController,
        title: kCpf,
        color: kColorBackground,
        subtitle: kUserCPF,
      ),
      TextFormWidget(
        controller: txPasswordController,
        title: kPassword,
        color: kColorBackground,
        subtitle: kInsertpassword,
      ),
      ButtonWidegt(
          title: kLogin,
          background: kColorBackgroundUser,
          height: 50,
          width: 200,
          style: TextStyles.button(),
          onPressed: () async {
            Users login = Users(
                cpf: txCPFController.text, password: txPasswordController.text);
                await controller.login(login);
          })
    ]));
  }
}
