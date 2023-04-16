import 'package:app/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(controllerIMC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Calculadora IMC'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade300,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                controller.imcfinal.value = 0.0;
                controller.valorKg.text = '0.0';
                controller.valorAltura.text = '0.0';
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: GetBuilder<controllerIMC>(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Colors.blue.shade300,
                    size: 120,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.blue),
                    controller: controller.valorKg,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Altura",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: controller.valorAltura,
                    style: TextStyle(color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.calculaIMC()
                              ? controller.calculaIMC()
                              : notificacaoerro(context);
                        },
                        child: const Text(
                          'Calcular',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                  Obx(() => controller.imcfinal.value <= 0
                      ? Container()
                      : Column(
                          children: [
                            const Text(
                              'Resultado',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Altura: ',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.blue),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '${controller.valorAltura.text}',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.blue),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Peso: ',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.blue),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '${controller.valorKg.text + ' Kg'}',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.blue),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'IMC: ',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.blue),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '${controller.imcfinal.value}',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.blue),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${controller.msg.value}',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: controller.msg.value
                                                          .toString() ==
                                                      'Obesidade'
                                                  ? Colors.red
                                                  : Colors.blue),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                ],
              );
            },
          ),
        ));
  }

  notificacaoerro(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Valor inválido ",
          style: TextStyle(color: Colors.red),
        ),
        content: Text("Informe valores vlidos para o \nPeso e Altura"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("fechar"),
          ),
        ],
      ),
    );
  }
}
