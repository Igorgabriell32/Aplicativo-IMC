import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class controllerIMC extends GetxController {
  TextEditingController valorKg = TextEditingController();
  TextEditingController valorAltura = TextEditingController();
  Rx<double> imcfinal = 0.0.obs;
  Rx<String> msg = ''.obs;

  controllerIMC({valorKg = '0', valorAltura = 0});

  calculaIMC() {
    try {
      double imc = 0.0;
      double altura;
      double peso;
      var imcformatado = imc.toStringAsFixed(2);

      altura = double.parse(valorAltura.text);
      peso = double.parse(valorKg.text);

      if (altura <= 0 || peso <= 0) {
        return false;
      } else {
        imc = peso / (altura * altura);
        imcformatado = imc.toStringAsFixed(2);
        imcfinal.value = double.parse(imcformatado);

        if (imcfinal.value < 18.5) {
          msg.value = 'Abaixo do peso';
        } else if (imcfinal.value > 18.5 && imcfinal.value < 24.9) {
          msg.value = 'Peso Normal';
        } else if (imcfinal.value > 25 && imcfinal.value < 29.9) {
          msg.value = 'Acima do Peso';
        } else if (imcfinal.value > 30) {
          msg.value = 'Obesidade';
        }

        update();
        return true;
      }
    } catch (e) {
      return e;
    }
  }
}
