import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

enum StatusLocalization { parado, carregando, sucesso, falha }

class LocalizationService extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  var status = StatusLocalization.parado;

  getPosicao() async {
    try {
      Position posicao = await posicaoAtual();

      lat = posicao.latitude;
      long = posicao.longitude;
      status = StatusLocalization.sucesso;
      notifyListeners();
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      permissao = await Geolocator.requestPermission();
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
