import 'package:app_hiseg_test/app/core/data/db/users_services.dart';
import 'package:app_hiseg_test/app/core/data/model/users.dart';
import 'package:flutter/material.dart';

enum StatusForm { parado, carregando, sucesso, falha }

class HomeService extends ChangeNotifier {
  late final UsersService _repository;
  Users users = Users();

  String mensagem = 'Falhou home';
  int? id;

  var status = StatusForm.parado;

  Future<List<Users>> buscar() async {
    List<Users> _listaUsers = [];
    try {
      status = StatusForm.carregando;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));

      _listaUsers = await _repository.getAll(users);

      status = StatusForm.sucesso;
      notifyListeners();
    } catch (e) {
      mensagem = e.toString();
      status = StatusForm.falha;
      notifyListeners();
      _listaUsers = [];
    }

    return _listaUsers;
  }
}
