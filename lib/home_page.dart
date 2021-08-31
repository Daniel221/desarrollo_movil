import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  bool male = false;
  bool female = false;
  double imc = 0;

  _calculateIMC() {
    var _weight =
        double.parse(weightController.text == "" ? "0" : weightController.text);
    var _height =
        double.parse(heightController.text == "" ? "1" : heightController.text);
    imc = _weight / (_height * _height);
  }

  Future<void> _showInfoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Tu IMC: ${imc.toStringAsFixed(2)}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Tabla del imc:"),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcular IMC'),
        ),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Ingrese sus datos para calcular el IMC"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 30,
                  color: female ? Colors.indigo : Colors.grey,
                  icon: Icon(Icons.female),
                  onPressed: () {
                    female = true;
                    male = false;
                    setState(() {});
                  },
                ),
                Container(width: 30),
                IconButton(
                  iconSize: 30,
                  color: male ? Colors.indigo : Colors.grey,
                  icon: Icon(Icons.male),
                  onPressed: () {
                    female = false;
                    male = true;
                    setState(() {});
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.height),
              title: Padding(
                padding: EdgeInsets.only(right: 24),
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingresar altura (metros)"),
                ),
              ),
            ),
            Container(height: 10),
            ListTile(
              leading: Icon(Icons.monitor_weight),
              title: Padding(
                padding: EdgeInsets.only(right: 24),
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingresar peso (KG)"),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: MaterialButton(
                      child: Text(
                        "Calcular",
                      ),
                      onPressed: () {
                        _calculateIMC();
                        _showInfoDialog(context);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
