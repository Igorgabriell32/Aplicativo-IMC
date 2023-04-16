import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Claculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person_outline,
            color: Colors.blue.shade300,
            size: 120,
          ),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (Kg)",
              labelStyle: TextStyle(color: Colors.blue),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Altura",
              labelStyle: TextStyle(color: Colors.blue, fontSize: 25.0),
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Calcular'),
          )
        ],
      ),
    );
  }
}
