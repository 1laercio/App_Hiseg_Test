
import 'package:app_hiseg_test/app/core/data/model/users.dart';
import 'package:flutter/material.dart';

import '../core/data/db/users_services.dart';

enum StatusLogin { parado, carregando, sucesso, falha }

class LoginService extends ChangeNotifier {
  final UsersService _loginRepository;

  var status = StatusLogin.parado;

  LoginService(this._loginRepository);

  Future<void> login(Users login) async {
    try {
      status = StatusLogin.carregando;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));
      await _loginRepository.init();
      print('Entrei');
      await _loginRepository.login(login);

      status = StatusLogin.sucesso;
      notifyListeners();
    } catch (e) {
      (e);
      status = StatusLogin.falha;
      notifyListeners();
    }
  }
}
